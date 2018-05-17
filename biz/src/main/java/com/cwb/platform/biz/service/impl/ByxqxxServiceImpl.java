package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizByxqxxMapper;
import com.cwb.platform.biz.model.BizByxqxx;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.ByxqxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class ByxqxxServiceImpl extends BaseServiceImpl<BizByxqxx,String> implements ByxqxxService{
    @Autowired
    private BizByxqxxMapper entityMapper;

    @Override
    protected Mapper<BizByxqxx> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizByxqxx.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizByxqxx entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
