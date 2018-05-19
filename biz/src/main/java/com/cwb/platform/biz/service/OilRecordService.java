package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizOilCard;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.biz.model.BizOilRecord;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.Page;

import java.math.BigDecimal;
import java.util.List;

public interface OilRecordService extends BaseService<BizOilRecord,String>{
    void chargeLog(BizOilCard card, BigDecimal amount);

    ApiResponse<List<BizVehicle>> list(BizVehicle entity, String jysj, Page<BizVehicle> pager);
}
