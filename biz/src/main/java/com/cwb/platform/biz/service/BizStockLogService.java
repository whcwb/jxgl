package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.biz.model.BizStockLog;
import com.cwb.platform.sys.base.BaseService;

/**
 * auther chenwei
 * create at 2018/8/13
 */
public interface BizStockLogService  extends BaseService<BizStockLog,String> {
    void log(BizStock nowRecord,int beforeUpdate,String remark,String type);
}
