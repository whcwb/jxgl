package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizByxqxx;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

public interface ByxqxxService extends BaseService<BizByxqxx, String>{
    ApiResponse<String> saveEntity(BizByxqxx entity);
}
