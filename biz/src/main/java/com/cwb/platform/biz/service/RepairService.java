package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.util.bean.ApiResponse;

import java.util.List;
import java.util.Map;

public interface RepairService extends BaseService<BizRepair,String>{
    ApiResponse<List<Map<String, Object>>> statistics();
}
