package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizRepairInfo;
import com.cwb.platform.biz.service.RepairInfoService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 维修管理
 */
@RestController
@RequestMapping("/api/repairInfo")
public class RepairInfoCtrl extends BaseController<BizRepairInfo,String> {
    @Autowired
    private RepairInfoService service;
    @Override
    protected BaseService<BizRepairInfo, String> getBaseService() {
        return service;
    }

}
