package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizYkjl;

public interface YkjlService extends BaseService<BizYkjl,String>{
    ApiResponse<String> saveEntity(BizYkjl entity);
}
