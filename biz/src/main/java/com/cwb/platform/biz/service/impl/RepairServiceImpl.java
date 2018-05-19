package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.service.RepairInfoService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizRepairMapper;
import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class RepairServiceImpl extends BaseServiceImpl<BizRepair,String> implements RepairService {
    @Autowired
    private BizRepairMapper entityMapper;
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
        entity.setWxxId(genId());
        save(entity);
        repairInfoService.repair(entity);
        return ApiResponse.saveSuccess();
    }
}
