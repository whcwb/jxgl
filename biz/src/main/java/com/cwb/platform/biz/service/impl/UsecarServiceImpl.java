package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizUsecarMapper;
import com.cwb.platform.biz.model.BizUsecar;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.UsecarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class UsecarServiceImpl extends BaseServiceImpl<BizUsecar,String> implements UsecarService{
    @Autowired
    private BizUsecarMapper entityMapper;

    @Override
    protected Mapper<BizUsecar> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizUsecar.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizUsecar entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
