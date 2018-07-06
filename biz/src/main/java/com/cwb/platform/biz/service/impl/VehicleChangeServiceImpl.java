package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizVehicleChangeMapper;
import com.cwb.platform.biz.model.BizVehicleChange;
import com.cwb.platform.biz.service.VehicleChangeService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

/**
 * auther chenwei
 * create at 2018/7/6
 */
@Service
public class VehicleChangeServiceImpl  extends BaseServiceImpl<BizVehicleChange, String> implements VehicleChangeService {

    @Autowired
    private BizVehicleChangeMapper baseMapper;

    @Override
    protected Mapper<BizVehicleChange> getBaseMapper() {
        return baseMapper;
    }
}
