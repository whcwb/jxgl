package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * auther chenwei
 * create at 2018/8/13
 */
public interface BizStockService extends BaseService<BizStock,String> {
    BizStock findByProductName(String productName);
    ApiResponse<String> outStock(BizStock stockDto);
}
