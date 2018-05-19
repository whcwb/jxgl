package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizMaintain;
import com.cwb.platform.biz.model.BizMaintainInfo;
import com.cwb.platform.biz.service.MaintainInfoService;
import com.cwb.platform.biz.service.MaintainService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 保养管理
 */
@RestController
@RequestMapping("/api/maintainInfo")
public class MaintainInfoCtrl extends BaseController<BizMaintainInfo,String> {
    @Autowired
    private MaintainInfoService service;
    @Override
    protected BaseService<BizMaintainInfo, String> getBaseService() {
        return service;
    }
}
