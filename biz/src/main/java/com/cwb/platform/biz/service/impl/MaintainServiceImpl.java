package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.MaintainInfoService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizMaintainMapper;
import com.cwb.platform.biz.model.BizMaintain;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.MaintainService;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class MaintainServiceImpl extends BaseServiceImpl<BizMaintain,String> implements MaintainService {
    @Autowired
    private BizMaintainMapper entityMapper;
    @Autowired
    private BizVehicleMapper vehicleMapper;
    @Autowired
    private MaintainInfoService maintainInfoService;

    @Override
    protected Mapper<BizMaintain> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizMaintain.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizMaintain entity) {
        RuntimeCheck.ifBlank(entity.getvId(),"请选择车辆");
        BizVehicle car = vehicleMapper.selectByPrimaryKey(entity.getvId());
        RuntimeCheck.ifNull(car,"车辆不存在");
        entity.setvHphm(car.getvHphm());
        entity.setBydId(genId());
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        save(entity);
        maintainInfoService.maintain(entity);
        return ApiResponse.saveSuccess();
    }
}
