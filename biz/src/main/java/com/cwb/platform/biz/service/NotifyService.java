package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizNotify;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizWfxx;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * auther chenwei
 * create at 2018/7/6
 */
public interface NotifyService extends BaseService<BizNotify,String> {
    ApiResponse<String> wfNotify(BizVehicle car,BizWfxx wfxx);
    ApiResponse<String> nianshenNotify(BizVehicle wfxx,String content);
}
