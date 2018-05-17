package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizWxjl;

public interface WxjlService extends BaseService<BizWxjl,String>{
    ApiResponse<String> saveEntity(BizWxjl entity);
}
