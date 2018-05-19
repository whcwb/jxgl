package com.cwb.platform.biz.controller;


import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/car")
public class CarCtrl extends BaseController<BizVehicle,String> {
    @Autowired
    private VehicleService vehicleService;
    @Override
    protected BaseService<BizVehicle, String> getBaseService() {
        return vehicleService;
    }
}
