package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.biz.service.RepairService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 维修管理
 */
@RestController
@RequestMapping("/api/repair")
public class RepairCtrl extends BaseController<BizRepair,String> {
    @Autowired
    private RepairService service;
    @Override
    protected BaseService<BizRepair, String> getBaseService() {
        return service;
    }

    @RequestMapping("statistics")
    public ApiResponse<List<Map<String,Object>>> statistics(){
        return service.statistics();
    }
}
