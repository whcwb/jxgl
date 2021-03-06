package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizMaintain;
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
@RequestMapping("/api/maintain")
public class MaintainCtrl extends BaseController<BizMaintain,String> {
    @Autowired
    private MaintainService service;
    @Override
    protected BaseService<BizMaintain, String> getBaseService() {
        return service;
    }
}
