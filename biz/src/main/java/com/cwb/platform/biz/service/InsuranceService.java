package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizInsurance;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

public interface InsuranceService extends BaseService<BizInsurance,String>{
    ApiResponse<String> sendSms(String inId);
    ApiResponse<String> sendSms(BizInsurance insurance);
}
