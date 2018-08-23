package com.cwb.platform.biz.controller;


import com.cwb.platform.biz.baidu.AiApis;
import com.cwb.platform.biz.model.BizVehLog;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizVehicleChange;
import com.cwb.platform.biz.service.DriverService;
import com.cwb.platform.biz.service.VehLogService;
import com.cwb.platform.biz.service.VehicleChangeService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.sys.service.YhService;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.Page;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

//import com.cwb.platform.biz.model.BizVehicleChange;
//import com.cwb.platform.biz.service.VehicleChangeService;


/**
 * 车辆管理业务处理
 * @author Lee
 *
 */
@SuppressWarnings("unchecked")
@RestController
@RequestMapping("/api/driver")
public class DriverCtrl extends BaseController<SysYh,String> {
    @Autowired
	private DriverService driverService;

    @Override
    protected BaseService<SysYh, String> getBaseService() {
        return driverService;
    }
}
