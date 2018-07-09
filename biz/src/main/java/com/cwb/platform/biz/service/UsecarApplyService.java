package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizUsecarApply;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

public interface UsecarApplyService extends BaseService<BizUsecarApply, String> {

    ApiResponse<String> audit(String id, String state, String reason);
}
