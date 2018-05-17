package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizWfxx;

public interface WfxxService extends BaseService<BizWfxx,String>{
    ApiResponse<String> saveEntity(BizWfxx entity);
}
