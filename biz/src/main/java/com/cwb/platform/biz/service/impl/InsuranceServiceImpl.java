package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizInsuranceMapper;
import com.cwb.platform.biz.model.BizInsurance;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.InsuranceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class InsuranceServiceImpl extends BaseServiceImpl<BizInsurance,String> implements InsuranceService{
    @Autowired
    private BizInsuranceMapper entityMapper;

    @Override
    protected Mapper<BizInsurance> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizInsurance.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizInsurance entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
