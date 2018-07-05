package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizUsecarApplyMapper;
import com.cwb.platform.biz.model.BizUsecarApply;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.BizUsecarApplyService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class BizUsecarApplyServiceImpl extends BaseServiceImpl<BizUsecarApply, String> implements BizUsecarApplyService {

	@Autowired
	private BizUsecarApplyMapper baseMapper;
	@Autowired
	private VehicleService vehicleService;

	@Override
	protected Mapper<BizUsecarApply> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public ApiResponse<String> validAndSave(BizUsecarApply apply){
		RuntimeCheck.ifBlank(apply.getClId(),"请选择车辆");
		SysYh user = getCurrentUser();
		BizVehicle car = vehicleService.findById(apply.getClId());
		RuntimeCheck.ifNull(car,"未找到车辆");
		apply.setId(genId());
		apply.setCph(car.getvHphm());
		apply.setCreateTime(DateUtils.getNowTime());
		apply.setSqrId(user.getZh());
		apply.setSqrxm(user.getXm());
		apply.setZt("0");
		save(apply);
		return ApiResponse.success();
	}
}
