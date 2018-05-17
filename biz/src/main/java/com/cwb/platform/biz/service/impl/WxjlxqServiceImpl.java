package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizWxjlxqMapper;
import com.cwb.platform.biz.model.BizWxjlxq;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.WxjlxqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class WxjlxqServiceImpl extends BaseServiceImpl<BizWxjlxq,String> implements WxjlxqService{
    @Autowired
    private BizWxjlxqMapper entityMapper;

    @Override
    protected Mapper<BizWxjlxq> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizWxjlxq.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizWxjlxq entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
