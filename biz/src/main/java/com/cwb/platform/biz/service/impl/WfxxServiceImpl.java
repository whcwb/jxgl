package com.cwb.platform.biz.service.impl;

import javax.servlet.http.HttpServletRequest;

import com.cwb.platform.util.commonUtil.HttpUtil;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.cwb.platform.biz.mapper.BizWfxxMapper;
import com.cwb.platform.biz.model.BizFiles;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizWfxx;
import com.cwb.platform.biz.service.FilesService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.biz.service.WfxxService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;

import tk.mybatis.mapper.common.Mapper;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class WfxxServiceImpl extends BaseServiceImpl<BizWfxx,String> implements WfxxService{
    @Autowired
    private BizWfxxMapper entityMapper;
    @Autowired
    private VehicleService vehicleService;
    @Autowired
    private FilesService filesService;

    @Override
    protected Mapper<BizWfxx> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizWfxx.class;
    }

    @Override
	public void afterPager(PageInfo<BizWfxx> pageInfo){
		Set<String> vIds = new HashSet<>();
		for (BizWfxx wfxx : pageInfo.getList()) {
			vIds.add(wfxx.getvId());
		}
		List<BizVehicle> carList = vehicleService.findIn(BizVehicle.InnerColumn.vId,vIds);
		Map<String,BizVehicle> carMap = carList.stream().collect(Collectors.toMap(BizVehicle::getvId,p->p));
		for (BizWfxx wfxx : pageInfo.getList()) {
			String vId = wfxx.getvId();
			if (StringUtils.isEmpty(vId))continue;
			BizVehicle car = carMap.get(vId);
			if (car == null)continue;
			wfxx.setFzr(car.getvZrr());
			wfxx.setFzrlxfs(car.getvZrrlxdh());
		}
	}

    public BizWfxx validEntity(BizWfxx entity){
    	RuntimeCheck.ifBlank(entity.getvId(), "请先选择车辆");
    	RuntimeCheck.ifNull(entity.getWfWfjf(), "请先输入违法记分");
    	RuntimeCheck.ifNull(entity.getWfWfje(), "请先输入违法金额");
    	if (StringUtils.isEmpty(entity.getWfId())){
    		entity.setWfId(genId());
		}
    	//查看车辆信息是否存在
    	BizVehicle vehicle = this.vehicleService.findById(entity.getvId());
    	RuntimeCheck.ifNull(vehicle, "选择的车辆信息不存在");

    	entity.setvId(vehicle.getvId());
    	entity.setvHphm(vehicle.getvHphm());
    	//
    	RuntimeCheck.ifTrue((entity.getWfWfjf() != null && entity.getWfWfjf() > 12), "违法记分不能大于12分");
    	//查看是否上传了图片
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    	String photos = request.getParameter("photos");
    	if (StringUtils.isNotEmpty(photos)){
    		String[] photoArr = photos.split(",");
    		for (int i=0; i<photoArr.length; i++){
    			BizFiles file = new BizFiles();
    			file.setpZtlx("40");
    			file.setVfDamc("wfzp-"+i);
    			file.setpId(entity.getWfId());
    			file.setVfNetPath(photoArr[i]);

    			this.filesService.saveEntity(file, null);
    		}
    	}

    	return entity;
    }

    @Override
    public ApiResponse<String> validAndSave(BizWfxx entity) {
    	entity = validEntity(entity);

        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        save(entity);
        if ("true".equals(entity.getSendSms())){
        	sendSms(entity);
		}
        return ApiResponse.saveSuccess();
    }

    @Override
    public ApiResponse<String> validAndUpdate(BizWfxx entity) {
    	RuntimeCheck.ifBlank(entity.getWfId(), "修改信息不存在");
    	BizWfxx exist = this.findById(entity.getWfId());
    	RuntimeCheck.ifNull(exist, "修改信息不存在");
    	entity = this.validEntity(entity);

    	entity.setUpdateTime(DateUtils.getNowTime());
        entity.setUpdateUser(getOperateUser());
        update(entity);
    	return ApiResponse.saveSuccess();
    }

	@Override
	public ApiResponse<String> sendSms(String wfId) {
    	RuntimeCheck.ifBlank(wfId,"请选择违法信息");
    	BizWfxx wfxx = findById(wfId);
    	RuntimeCheck.ifNull(wfxx,"未找到违法信息");
    	return sendSms(wfxx);
	}

	@Override
	public ApiResponse<String> sendSms(BizWfxx wfxx) {
		BizVehicle vehicle = vehicleService.findById(wfxx.getvId());
		RuntimeCheck.ifNull(vehicle,"未找到车辆信息");

		//发送短信是通知到车辆负责人，不是使用人
		Map<String, String> params = Maps.newConcurrentMap();
		DateTime date = DateTime.parse(wfxx.getWfWfsj().substring(0,10));
		params.put("SpCode", "1011012028851");
		params.put("LoginName", "wh_tmjx");
		params.put("Password", "tmjx2017");
		params.put("MessageContent", vehicle.getvHphm()+"车主，您好，您的爱车于"+date.toString("yyyy年MM月dd日")+"，有一条违章处罚待处理，请尽快前往交警大队进行处理。");
		params.put("UserNumber", vehicle.getvZrrlxdh());
		params.put("SerialNumber", String.valueOf(DateTime.now().getMillis()));
		params.put("ScheduleTime", "");
		params.put("f", "1");

		String smsResult = HttpUtil.post("https://api.ums86.com:9600/sms/Api/Send.do", params, "gbk");
		if (smsResult.contains("result=0")){
			return ApiResponse.success("短信发送成功");
		}
		return ApiResponse.fail("短信发送失败");
	}
}
