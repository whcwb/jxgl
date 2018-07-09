package com.cwb.platform.biz.controller;


import com.cwb.platform.biz.model.BizUsecarApply;
import com.cwb.platform.biz.service.UsecarApplyService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

//import com.cwb.platform.biz.model.BizVehicleChange;
//import com.cwb.platform.biz.service.VehicleChangeService;


/**
 * 车辆管理业务处理
 * @author Lee
 *
 */
@SuppressWarnings("unchecked")
@RestController
@RequestMapping("/api/useCarApply")
public class UseCarApplyCtrl extends BaseController<BizUsecarApply,String> {
    @Autowired
    private UsecarApplyService service;

    @Override
    protected BaseService<BizUsecarApply, String> getBaseService() {
        return service;
    }

    @RequestMapping("audit")
    public ApiResponse<String> audit(String id,String state,String reason){
        return service.audit(id,state,reason);
    }

}
