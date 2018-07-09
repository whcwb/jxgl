package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizNotify;
import com.cwb.platform.biz.service.NotifyService;
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
@RequestMapping("api/notify")
public class NotifyCtrl extends BaseController<BizNotify,String> {
    @Autowired
    private NotifyService service;
    @Override
    protected BaseService<BizNotify, String> getBaseService() {
        return service;
    }
}
