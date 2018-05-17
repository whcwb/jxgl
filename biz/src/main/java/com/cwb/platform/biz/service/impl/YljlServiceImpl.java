package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizYljlMapper;
import com.cwb.platform.biz.model.BizYljl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.YljlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class YljlServiceImpl extends BaseServiceImpl<BizYljl,String> implements YljlService{
    @Autowired
    private BizYljlMapper entityMapper;

    @Override
    protected Mapper<BizYljl> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizYljl.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizYljl entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
