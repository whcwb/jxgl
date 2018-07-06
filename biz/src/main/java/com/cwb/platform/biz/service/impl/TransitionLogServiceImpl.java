package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizTransitionLogMapper;
import com.cwb.platform.biz.model.BizTransitionLog;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.TransitionLogService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class TransitionLogServiceImpl extends BaseServiceImpl<BizTransitionLog, String> implements TransitionLogService {

	@Autowired
	private BizTransitionLogMapper baseMapper;

	@Override
	protected Mapper<BizTransitionLog> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public ApiResponse<String> log(BizVehicle vehicle, String filePath, String type) {
		SysYh user = getCurrentUser();
		BizTransitionLog log = new BizTransitionLog();
		log.setClId(vehicle.getvId());
		log.setCph(vehicle.getvHphm());
		log.setCreateTime(DateUtils.getNowTime());
		log.setCreateUserId(user.getYhid());
		log.setCreateUserName(user.getXm());
		log.setFilePath(filePath);
		log.setType(type);
		log.setId(genId());
		save(log);
		return ApiResponse.success();
	}
}
