package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizTransitionLog;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * auther chenwei
 * create at 2018/7/6
 */
public interface TransitionLogService extends BaseService<BizTransitionLog,String> {
    ApiResponse<String> log(BizVehicle vehicle,String filePath,String type,String otherFiles);
}
