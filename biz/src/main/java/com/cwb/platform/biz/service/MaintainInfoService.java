package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizMaintain;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.biz.model.BizMaintainInfo;

public interface MaintainInfoService extends BaseService<BizMaintainInfo,String>{
    void maintain(BizMaintain record);
}
