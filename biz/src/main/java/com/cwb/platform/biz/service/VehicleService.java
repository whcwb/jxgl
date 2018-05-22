package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.*;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.util.bean.ApiResponse;

import java.util.List;

public interface VehicleService extends BaseService<BizVehicle,String>{
    void fuel(BizOilRecord record);
    
    public ApiResponse<String> allocPerson(BizVehicle entity);
    
    public ApiResponse<String> clnsUpdate(BizVehLog entity);

    ApiResponse<List<BizVehicle>> notUseCarList();
}
