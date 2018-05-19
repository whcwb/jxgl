package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizWfxxMapper;
import com.cwb.platform.biz.model.BizWfxx;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.WfxxService;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class WfxxServiceImpl extends BaseServiceImpl<BizWfxx,String> implements WfxxService{
    @Autowired
    private BizWfxxMapper entityMapper;

    @Override
    protected Mapper<BizWfxx> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizWfxx.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizWfxx entity) {
        entity.setvId(genId());
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
