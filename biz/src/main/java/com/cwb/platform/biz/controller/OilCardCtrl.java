package com.cwb.platform.biz.controller;

import com.cwb.platform.biz.model.BizOilCard;
import com.cwb.platform.biz.service.OilCardService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 油卡管理
 * auther chenwei
 * create at 2018/5/17
 */
@RestController
@RequestMapping("/api/oilCard")
public class OilCardCtrl extends BaseController<BizOilCard,String> {
    @Autowired
    private OilCardService service;
    @Override
    protected BaseService<BizOilCard, String> getBaseService() {
        return service;
    }

    @PostMapping("charge")
    public ApiResponse<String> charge(String cardId,Float amount){
        return service.charge(cardId,amount);
    }
}
