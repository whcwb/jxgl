package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.biz.model.BizRepairInfo;

public interface RepairInfoService extends BaseService<BizRepairInfo,String>{
    void repair(BizRepair record);
}
