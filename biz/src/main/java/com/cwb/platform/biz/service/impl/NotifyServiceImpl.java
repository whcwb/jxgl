package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizNotifyMapper;
import com.cwb.platform.biz.model.BizNotify;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizWfxx;
import com.cwb.platform.biz.service.NotifyService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.biz.service.WaitNotifyService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class NotifyServiceImpl extends BaseServiceImpl<BizNotify, String> implements NotifyService {

	@Autowired
	private BizNotifyMapper baseMapper;
	@Autowired
	private VehicleService vehicleService;
	@Autowired
	private WaitNotifyService waitNotifyService;

	@Override
	protected Mapper<BizNotify> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public ApiResponse<String> validAndSave(BizNotify notify){
		RuntimeCheck.ifBlank(notify.getClId(),"请选择车辆");
		BizVehicle car = vehicleService.findById(notify.getClId());
		RuntimeCheck.ifNull(car,"未找到车辆");

		SysYh user = getCurrentUser();
		notify.setCreateTime(DateUtils.getNowTime());
		notify.setCreateUser(user.getYhid()+'-'+user.getXm());
		notify.setId(genId());
		notify.setCph(car.getvHphm());
		save(notify);

		if (StringUtils.isNotEmpty(notify.getNextNotifyTime())){
			waitNotifyService.nextNotify(notify);
		}
		return ApiResponse.success();
	}

	@Override
	public ApiResponse<String> wfNotify(BizVehicle car,BizWfxx wfxx) {
		BizNotify notify = new BizNotify();
		notify.setClId(car.getvId());
		notify.setContent(wfxx.getWfWfxw());
		notify.setMethod("1");
		notify.setCph(car.getvHphm());
		notify.setCreateTime(DateUtils.getNowTime());
		notify.setCreateUser("系统自动");
		notify.setId(genId());
		notify.setTime(car.getvNsrq());
		notify.setType("2");
		notify.setToUserName(car.getvZrr());
		notify.setToUserPhone(car.getvZrrlxdh());
		save(notify);
		return ApiResponse.success();
	}
	@Override
	public ApiResponse<String> nianshenNotify(BizVehicle car,String content) {
		BizNotify notify = new BizNotify();
		notify.setClId(car.getvId());
		notify.setContent(content);
		notify.setMethod("1");
		notify.setCph(car.getvHphm());
		notify.setCreateTime(DateUtils.getNowTime());
		notify.setCreateUser("系统自动");
		notify.setId(genId());
		notify.setTime(car.getvNsrq());
		notify.setType("1");
		notify.setToUserName(car.getvZrr());
		notify.setToUserPhone(car.getvZrrlxdh());
		save(notify);
		return ApiResponse.success();
	}
}
