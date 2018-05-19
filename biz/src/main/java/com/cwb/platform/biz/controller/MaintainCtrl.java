package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizByxx;
import com.cwb.platform.biz.service.ByxxService;
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
public class MaintainCtrl extends BaseController<BizByxx,String> {
    @Autowired
    private ByxxService service;
    @Override
    protected BaseService<BizByxx, String> getBaseService() {
        return service;
    }
}
