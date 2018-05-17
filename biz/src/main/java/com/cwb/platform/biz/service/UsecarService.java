package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizUsecar;

public interface UsecarService extends BaseService<BizUsecar,String>{
    ApiResponse<String> saveEntity(BizUsecar entity);
}
