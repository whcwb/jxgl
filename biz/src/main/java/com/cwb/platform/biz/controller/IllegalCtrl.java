package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizWfxx;
import com.cwb.platform.biz.service.WfxxService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 违法管理
 */
@RestController
@RequestMapping("api/illegal")
public class IllegalCtrl extends BaseController<BizWfxx,String> {
    @Autowired
    private WfxxService service;
    @Override
    protected BaseService<BizWfxx, String> getBaseService() {
        return service;
    }
}
