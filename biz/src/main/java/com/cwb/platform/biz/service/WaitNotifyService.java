package com.cwb.platform.biz.service;

import com.cwb.platform.biz.model.BizNotify;
import com.cwb.platform.biz.model.BizWaitNotify;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * auther chenwei
 * create at 2018/7/6
 */
public interface WaitNotifyService extends BaseService<BizWaitNotify,String> {
    ApiResponse<String> nextNotify(BizNotify notify);
}
