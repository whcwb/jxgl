package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizWaitNotify;
import com.cwb.platform.biz.service.WaitNotifyService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * auther chenwei
 * create at 2018/7/6
 */
@RestController
@RequestMapping("api/waitNotify")
public class WaitNotifyCtrl extends BaseController<BizWaitNotify,String> {
    @Autowired
    private WaitNotifyService service;
    @Override
    protected BaseService<BizWaitNotify, String> getBaseService() {
        return service;
    }

}
