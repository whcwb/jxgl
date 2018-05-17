package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizYljl;

public interface YljlService extends BaseService<BizYljl,String>{
    ApiResponse<String> saveEntity(BizYljl entity);
}
