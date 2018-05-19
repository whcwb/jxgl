package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizWxjlMapper;
import com.cwb.platform.biz.model.BizWxjl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.WxjlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class WxjlServiceImpl extends BaseServiceImpl<BizWxjl,String> implements WxjlService{
    @Autowired
    private BizWxjlMapper entityMapper;

    @Override
    protected Mapper<BizWxjl> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizWxjl.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizWxjl entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
