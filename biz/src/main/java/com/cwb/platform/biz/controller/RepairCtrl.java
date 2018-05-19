package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizWxjlxq;
import com.cwb.platform.biz.service.WxjlxqService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 维修管理
 */
@RestController
@RequestMapping("/api/repair")
public class RepairCtrl extends BaseController<BizWxjlxq,String> {
    @Autowired
    private WxjlxqService service;
    @Override
    protected BaseService<BizWxjlxq, String> getBaseService() {
        return service;
    }
}
