package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizInsurance;
import com.cwb.platform.biz.model.BizInsuranceHistory;
import com.cwb.platform.biz.service.InsuranceHistoryService;
import com.cwb.platform.biz.service.InsuranceService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 保险管理
 */
@RestController
@RequestMapping("api/insuranceHistory")
public class InsuranceHistoryCtrl extends BaseController<BizInsuranceHistory,String> {
    @Autowired
    private InsuranceHistoryService service;
    @Override
    protected BaseService<BizInsuranceHistory, String> getBaseService() {
        return service;
    }
}
