package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizWaitNotifyMapper;
import com.cwb.platform.biz.model.BizNotify;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizWaitNotify;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.biz.service.WaitNotifyService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class WaitNotifyServiceImpl extends BaseServiceImpl<BizWaitNotify, String> implements WaitNotifyService {

	@Autowired
	private BizWaitNotifyMapper baseMapper;
	@Autowired
	private VehicleService vehicleService;

	@Override
	protected Mapper<BizWaitNotify> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public ApiResponse<String> validAndSave(BizWaitNotify notify){
		RuntimeCheck.ifBlank(notify.getClId(),"请选择车辆");
		BizVehicle car = vehicleService.findById(notify.getClId());
		RuntimeCheck.ifNull(car,"未找到车辆");

		SysYh user = getCurrentUser();
		notify.setCreateTime(DateUtils.getNowTime());
		notify.setCreateUser(user.getYhid()+'-'+user.getXm());
		notify.setId(genId());
		notify.setCph(car.getvHphm());
		save(notify);
		return ApiResponse.success();
	}

	@Override
	public ApiResponse<String> nextNotify(BizNotify notify) {
		BizWaitNotify waitNotify = new BizWaitNotify();
		BeanUtils.copyProperties(notify,waitNotify,"id","content");
		waitNotify.setId(genId());
		waitNotify.setContent(notify.getNextNotifyContent());
		waitNotify.setTime(notify.getNextNotifyTime());
		save(waitNotify);
		return ApiResponse.success();
	}
}
