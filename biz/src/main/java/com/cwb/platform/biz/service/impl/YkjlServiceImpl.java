package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizYkjlMapper;
import com.cwb.platform.biz.model.BizYkjl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.YkjlService;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class YkjlServiceImpl extends BaseServiceImpl<BizYkjl,String> implements YkjlService{
    @Autowired
    private BizYkjlMapper entityMapper;

    @Override
    protected Mapper<BizYkjl> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizYkjl.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizYkjl entity) {
        entity.setCreateTime(DateUtils.getNowTime());
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
