package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizOilCard;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.biz.model.BizOilRecord;

public interface OilRecordService extends BaseService<BizOilRecord,String>{
    void chargeLog(BizOilCard card);
}
