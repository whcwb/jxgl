package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizYkjl;
import com.cwb.platform.biz.service.YkjlService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 油卡管理
 * auther chenwei
 * create at 2018/5/17
 */
@RestController
@RequestMapping("/api/oilCard")
public class OilCardCtrl extends BaseController<BizYkjl,String> {
    @Autowired
    private YkjlService service;
    @Override
    protected BaseService<BizYkjl, String> getBaseService() {
        return service;
    }
}
