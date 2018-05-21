package com.cwb.platform.biz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizWfxxMapper;
import com.cwb.platform.biz.model.BizInsurance;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizWfxx;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.biz.service.WfxxService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;

import tk.mybatis.mapper.common.Mapper;

@Service
public class WfxxServiceImpl extends BaseServiceImpl<BizWfxx,String> implements WfxxService{
    @Autowired
    private BizWfxxMapper entityMapper;
    @Autowired
    private VehicleService vehicleService;

    @Override
    protected Mapper<BizWfxx> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizWfxx.class;
    }
    
    public BizWfxx validEntity(BizWfxx entity){
    	RuntimeCheck.ifBlank(entity.getvId(), "请先选择车辆");
    	RuntimeCheck.ifBlank(entity.getWfId(), "请先输入违法编号");
    	RuntimeCheck.ifNull(entity.getWfWfjf(), "请先输入违法记分");
    	RuntimeCheck.ifNull(entity.getWfWfje(), "请先输入违法金额");
    	//查看车辆信息是否存在
    	BizVehicle vehicle = this.vehicleService.findById(entity.getvId());
    	RuntimeCheck.ifNull(vehicle, "选择的车辆信息不存在");
    	
    	entity.setvId(vehicle.getvId());
    	entity.setvHphm(vehicle.getvHphm());
    	//
    	RuntimeCheck.ifTrue((entity.getWfWfjf() != null && entity.getWfWfjf() > 12), "违法记分不能大于12分");
    	
    	
    	return entity;
    }

    @Override
    public ApiResponse<String> validAndSave(BizWfxx entity) {
    	entity = validEntity(entity);
    	
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        save(entity);
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
}
