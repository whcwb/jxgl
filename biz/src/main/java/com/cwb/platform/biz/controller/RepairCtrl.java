package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.biz.model.BizRepairInfo;
import com.cwb.platform.biz.service.RepairService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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

}
