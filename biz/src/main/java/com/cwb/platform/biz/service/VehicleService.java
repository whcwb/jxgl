package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.*;
import com.cwb.platform.sys.base.BaseService;

public interface VehicleService extends BaseService<BizVehicle,String>{
    void fuel(BizOilRecord record);
}
