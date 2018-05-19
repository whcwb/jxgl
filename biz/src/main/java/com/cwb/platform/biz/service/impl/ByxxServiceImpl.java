package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizByxxMapper;
import com.cwb.platform.biz.model.BizByxx;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.ByxxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class ByxxServiceImpl extends BaseServiceImpl<BizByxx,String> implements ByxxService{
    @Autowired
    private BizByxxMapper entityMapper;

    @Override
    protected Mapper<BizByxx> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizByxx.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizByxx entity) {
        entity.setvId(genId());
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
