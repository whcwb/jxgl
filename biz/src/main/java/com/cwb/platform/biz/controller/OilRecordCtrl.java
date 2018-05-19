package com.cwb.platform.biz.controller;


import com.cwb.platform.biz.model.BizOilRecord;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.OilRecordService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 油料管理
 */
@RestController
@RequestMapping("/api/oilRecord")
public class OilRecordCtrl extends BaseController<BizOilRecord,String> {
    @Autowired
    private OilRecordService service;
    @Override
    protected BaseService<BizOilRecord, String> getBaseService() {
        return service;
    }

    @RequestMapping("list")
    public ApiResponse<List<BizVehicle>> list(BizVehicle entity, String jysj,Page<BizVehicle> pager){
        return service.list(entity,jysj,pager);
    }
}
