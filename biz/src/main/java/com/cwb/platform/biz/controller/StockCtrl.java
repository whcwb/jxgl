package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.biz.service.BizStockService;
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
    @RequestMapping("outStocks")
    public ApiResponse<String> outStocks(String stocks){
        RuntimeCheck.ifBlank(stocks,"请输入库存信息");
        List<BizStock> stockList = JsonUtil.toList(stocks,BizStock.class);
        return stockService.outStocks(stockList);
    }
    @RequestMapping("revert")
    public ApiResponse<String> revert(BizStock stock){
        return stockService.revert(stock);
    }
}
