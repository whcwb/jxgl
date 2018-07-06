package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizUsecarApplyMapper;
import com.cwb.platform.biz.model.BizUsecarApply;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.UsecarApplyService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class UsecarApplyServiceImpl extends BaseServiceImpl<BizUsecarApply, String> implements UsecarApplyService {

	@Autowired
	private BizUsecarApplyMapper baseMapper;
	@Autowired
	private VehicleService vehicleService;

	@Override
	protected Mapper<BizUsecarApply> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public boolean fillPagerCondition(LimitedCondition condition){
		SysYh user = getCurrentUser();
		if (!("00".equals(user.getLx()) || "su".equals(user.getLx()))){
			condition.eq(BizUsecarApply.InnerColumn.sqrId,user.getYhid());
		}
		return true;
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
		apply.setSqrId(user.getYhid());
		apply.setSqrxm(user.getXm());
		apply.setZt("0");
		save(apply);
		return ApiResponse.success();
	}

	@Override
	public ApiResponse<String> audit(String id, String state, String reason) {
		RuntimeCheck.ifBlank(id,"请选择数据");
		RuntimeCheck.ifBlank(state,"请选择状态");
		RuntimeCheck.ifTrue("2".equals(state) && StringUtils.isEmpty(reason),"请填写驳回原因");
		BizUsecarApply apply = findById(id);
		RuntimeCheck.ifNull(apply,"未找到记录");
		RuntimeCheck.ifFalse("0".equals(apply.getZt()),"请选择待审核的数据");

		SysYh user = getCurrentUser();
		apply.setZt(state);
		apply.setBhyy(reason);
		apply.setShrId(user.getYhid()+"-"+user.getXm());
		apply.setShsj(DateUtils.getNowTime());
		update(apply);
		return null;
	}
}
