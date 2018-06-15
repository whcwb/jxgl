package com.cwb.platform.biz.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cwb.platform.biz.model.BizVehLog;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.VehLogService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * 车辆管理业务处理
 * @author Lee
 *
 */
@RestController
@RequestMapping("/api/car")
public class CarCtrl extends BaseController<BizVehicle,String> {
    @Autowired
    private VehicleService vehicleService;
    @Autowired
    private VehLogService vehLogService;
    
    @Override
    protected BaseService<BizVehicle, String> getBaseService() {
        return vehicleService;
    }
    
    /**
     * 给车辆分配人员信息
     */
    @PostMapping("/allocPerson")
	public ApiResponse<String> allocPerson(BizVehicle entity){
		return this.vehicleService.allocPerson(entity);
	}
    
    @PostMapping(value="/clnsPager")
	public ApiResponse<List<BizVehLog>> pager(BizVehLog entity, Page<BizVehLog> pager){
		return this.vehLogService.pager(pager);
	}

    /**
     * 车辆年审更新
     * @param entity
     * @return
     */
    @PostMapping("/clnsUpdate")
	public ApiResponse<String> clnsUpdate(BizVehLog entity){
		return this.vehicleService.clnsUpdate(entity);
	}

    /**
     * 未借出车辆列表
     */
    @RequestMapping("notUseCarList")
    public ApiResponse<List<BizVehicle>> notUseCarList(){
        return vehicleService.notUseCarList();
    }
}
