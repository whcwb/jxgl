package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizVehicleChangeMapper;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizVehicleChange;
import com.cwb.platform.biz.service.VehicleChangeService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
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
    @Autowired
    private VehicleService vehicleService;

    @Override
    protected Mapper<BizVehicleChange> getBaseMapper() {
        return baseMapper;
    }

    @Override
    public ApiResponse<String> validAndSave(BizVehicleChange change){
        RuntimeCheck.ifBlank(change.getvId(),"请选择车辆");
        BizVehicle car = vehicleService.findById(change.getvId());
        RuntimeCheck.ifNull(car,"车辆不存在");

        SysYh user = getCurrentUser();
        change.setChgId(genId());
        change.setCreateTime(DateUtils.getNowTime());
        change.setCreateUser(user.getYhid());
        change.setvHphm(car.getvHphm());

        save(change);
        vehicleService.cqChange(change);
        return ApiResponse.success();
    }
}
