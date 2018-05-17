package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class VehicleServiceImpl extends BaseServiceImpl<BizVehicle,String> implements VehicleService{
    @Autowired
    private BizVehicleMapper entityMapper;

    @Override
    protected Mapper<BizVehicle> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizVehicle.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizVehicle entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
