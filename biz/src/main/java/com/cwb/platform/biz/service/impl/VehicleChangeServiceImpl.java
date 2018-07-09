package com.cwb.platform.biz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizVehicleChangeMapper;
import com.cwb.platform.biz.model.BizVehicleChange;
import com.cwb.platform.biz.service.VehicleChangeService;
import com.cwb.platform.sys.base.BaseServiceImpl;

import tk.mybatis.mapper.common.Mapper;

@Service
public class VehicleChangeServiceImpl extends BaseServiceImpl<BizVehicleChange, java.lang.String> implements VehicleChangeService {

	@Autowired
	private BizVehicleChangeMapper baseMapper;
	
	@Override
	protected Mapper<BizVehicleChange> getBaseMapper() {
		return baseMapper;
	}
}