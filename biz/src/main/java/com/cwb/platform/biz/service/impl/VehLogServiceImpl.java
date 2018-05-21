package com.cwb.platform.biz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizVehLogMapper;
import com.cwb.platform.biz.model.BizVehLog;
import com.cwb.platform.biz.service.VehLogService;
import com.cwb.platform.sys.base.BaseServiceImpl;

import tk.mybatis.mapper.common.Mapper;

@Service
public class VehLogServiceImpl extends BaseServiceImpl<BizVehLog, String> implements VehLogService{
    @Autowired
    private BizVehLogMapper entityMapper;

    @Override
    protected Mapper<BizVehLog> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizVehLog.class;
    }

}
