package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.RepairInfoService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizRepairMapper;
import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.RepairService;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class RepairServiceImpl extends BaseServiceImpl<BizRepair,String> implements RepairService {
    @Autowired
    private BizRepairMapper entityMapper;
    @Autowired
    private BizVehicleMapper vehicleMapper;
    @Autowired
    private RepairInfoService repairInfoService;

    @Override
    protected Mapper<BizRepair> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizRepair.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizRepair entity) {
        RuntimeCheck.ifBlank(entity.getvId(),"请选择车辆");
        BizVehicle car = vehicleMapper.selectByPrimaryKey(entity.getvId());
        RuntimeCheck.ifNull(car,"车辆不存在");
        entity.setvHphm(car.getvHphm());
        entity.setWxxId(genId());
        if (StringUtils.isEmpty(entity.getCreateTime())){
            entity.setCreateTime(DateUtils.getNowTime());
        }
        save(entity);
        repairInfoService.repair(entity);
        return ApiResponse.saveSuccess();
    }
}
