package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizTransitionLog;
import com.cwb.platform.biz.service.TransitionLogService;
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
@RequestMapping("/api/transitionLog")
public class TransitionLogCtrl extends BaseController<BizTransitionLog,String> {
    @Autowired
    private TransitionLogService service;
    @Override
    protected BaseService<BizTransitionLog, String> getBaseService() {
        return service;
    }
}
