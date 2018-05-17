package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizVehicle;

public interface VehicleService extends BaseService<BizVehicle,String>{
    ApiResponse<String> saveEntity(BizVehicle entity);
}
