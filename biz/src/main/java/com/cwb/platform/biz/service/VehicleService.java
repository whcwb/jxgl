package com.cwb.platform.biz.service;

import java.util.List;

import com.cwb.platform.biz.model.BizOilRecord;
import com.cwb.platform.biz.model.BizVehLog;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

public interface VehicleService extends BaseService<BizVehicle,String>{
    void fuel(BizOilRecord record);
    
    public ApiResponse<String> allocPerson(BizVehicle entity);
    
    public ApiResponse<String> clnsUpdate(BizVehLog entity);

    ApiResponse<List<BizVehicle>> notUseCarList();
    
    /**
     * 发送年审通知短信
     * @param entity
     * @return
     */
    public ApiResponse<String> sendSms(String vehId);
}
