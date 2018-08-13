package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.biz.service.BizStockService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * auther chenwei
 * create at 2018/8/13
 */
@RestController
@RequestMapping("api/stock")
public class StockCtrl extends BaseController<BizStock,String> {
    @Autowired
    private BizStockService stockService;

    @Override
    protected BaseService<BizStock, String> getBaseService() {
        return stockService;
    }

    @RequestMapping("outStock")
    public ApiResponse<String> outStock(BizStock stock){
        return stockService.outStock(stock);
    }
}
