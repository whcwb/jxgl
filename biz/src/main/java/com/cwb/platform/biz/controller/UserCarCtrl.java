package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizUsecar;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.UsecarService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 出车管理
 */
@RestController
@RequestMapping("api/userCar")
public class UserCarCtrl extends BaseController<BizUsecar,String> {
    @Autowired
    private UsecarService service;
    @Override
    protected BaseService<BizUsecar, String> getBaseService() {
        return service;
    }

    @RequestMapping("getLastReturnMileage")
    public ApiResponse<Integer> getLastReturnMileage(String carId){
        return service.getLastReturnMileage(carId);
    }
}
