package com.cwb.platform.biz.service;

import java.util.List;
import java.util.Map;

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

    /**
     * 按责任人统计车辆数量
     * @return
     */
    public ApiResponse<List<Map<String, String>>> reportZrr();

    ApiResponse<String> uploadBill(String clId, String filePath, String in);
}
