package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.*;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

public interface VehicleService extends BaseService<BizVehicle,String>{
    void fuel(BizOilRecord record);
    
    public ApiResponse<String> allocPerson(BizVehicle entity);
}
