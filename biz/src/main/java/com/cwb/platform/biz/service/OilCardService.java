package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizOilRecord;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizOilCard;

public interface OilCardService extends BaseService<BizOilCard,String>{
    ApiResponse<String> charge(String cardId, Float amount);
    void fuel(BizOilRecord record);
}
