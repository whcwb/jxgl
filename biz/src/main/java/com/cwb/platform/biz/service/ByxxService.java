package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizByxx;

public interface ByxxService extends BaseService<BizByxx,String>{
    ApiResponse<String> saveEntity(BizByxx entity);
}
