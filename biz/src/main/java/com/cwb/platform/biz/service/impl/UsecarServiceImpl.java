package com.cwb.platform.biz.service.impl;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.ibatis.session.RowBounds;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizUsecarMapper;
import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.model.BizUsecar;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.UsecarService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.mapper.SysClkPtyhMapper;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

@Service
public class UsecarServiceImpl extends BaseServiceImpl<BizUsecar,String> implements UsecarService{
    @Autowired
    private BizUsecarMapper entityMapper;
    @Autowired
    private BizVehicleMapper vehicleMapper;
    @Autowired
    private SysClkPtyhMapper ptyhMapper;

    @Override
    protected Mapper<BizUsecar> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizUsecar.class;
    }
    
    public BizUsecar validEntity(BizUsecar entity){
    	RuntimeCheck.ifBlank(entity.getvId(),"请选择车辆");
        BizVehicle car = vehicleMapper.selectByPrimaryKey(entity.getvId());
        RuntimeCheck.ifNull(car,"车辆不存在");

        RuntimeCheck.ifBlank(entity.getUcJyrid(),"请选择借用人");
        SysYh user = ptyhMapper.selectByPrimaryKey(entity.getUcJyrid());
        RuntimeCheck.ifNull(user,"借用人不存在");
        
        entity.setUcJyr(user.getXm());
        entity.setvHphm(car.getvHphm());
        
        return entity;
    }

    @Override
    public ApiResponse<String> validAndSave(BizUsecar entity) {
    	entity = validEntity(entity);
    	//检查选择的车辆是否有未还车记录，如果有则不允许再申请
    	Example condition = new Example(BizUsecar.class);
    	condition.and().andEqualTo(BizUsecar.InnerColumn.vId.name(), entity.getvId());
    	condition.and().andIsNull(BizUsecar.InnerColumn.unHclcs.name());
    	List<BizUsecar> existList = this.findByConditionParam(condition);
    	RuntimeCheck.ifFalse(CollectionUtils.isEmpty(existList), "当前车辆有未还车记录，不允许再次申请");
        
        entity.setUcId(genId());
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        save(entity);
        return ApiResponse.saveSuccess();
    }
    
    @Override
    public ApiResponse<String> validAndUpdate(BizUsecar entity) {
    	RuntimeCheck.ifTrue((entity.getUnHclcs() == null || entity.getUnHclcs().intValue() == 0), "还车里程数不能为空");
    	BizUsecar exist = this.findById(entity.getUcId());
        RuntimeCheck.ifNull(exist,"出车单信息不存在");
    	entity = validEntity(entity);
        
        entity.setUpdateTime(DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
        entity.setUpdateUser(getOperateUser());
        update(entity);
    	return super.validAndUpdate(entity);
    }

    @Override
    public ApiResponse<Integer> getLastReturnMileage(String carId) {
        RuntimeCheck.ifBlank(carId,"请选择车辆");
        SimpleCondition condition = new SimpleCondition(BizUsecar.class);
        condition.eq(BizUsecar.InnerColumn.vId,carId);
        condition.setOrderByClause("create_time desc");
        List<BizUsecar> usecars = entityMapper.selectByExampleAndRowBounds(condition,new RowBounds(0,1));
        if (usecars.size() == 0)return ApiResponse.success(0);
        return ApiResponse.success(usecars.get(0).getUnHclcs());
    }

    @Override
    public List<BizUsecar> getNotReturnList() {
        Example condition = new Example(BizUsecar.class);
        condition.and().andIsNull(BizUsecar.InnerColumn.unHclcs.name());
        List<BizUsecar> usecars = findByConditionParam(condition);
        return usecars;
    }
}
