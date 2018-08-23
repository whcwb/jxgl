package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.biz.model.BizStockLog;
import com.cwb.platform.biz.service.BizStockLogService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.JsonUtil;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * auther chenwei
 * create at 2018/8/13
 */
@RestController
@RequestMapping("api/stockLog")
public class StockLogCtrl extends BaseController<BizStockLog,String> {
    @Autowired
    private BizStockLogService stockLogService;

    @Override
    protected BaseService<BizStockLog, String> getBaseService() {
        return stockLogService;
    }
}
