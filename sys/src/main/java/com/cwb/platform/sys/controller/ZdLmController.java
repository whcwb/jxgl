package com.cwb.platform.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.sys.model.SysZdlm;
import com.cwb.platform.sys.service.ZdlmService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * 平台字典
 */
@RestController
@RequestMapping("/api/zd")
public class ZdLmController extends BaseController<SysZdlm, String> {
    @Autowired
    private ZdlmService zdlmService;

    @Override
    protected BaseService<SysZdlm, String> getBaseService() {
        return zdlmService;
    }

    @Override
    @RequestMapping(value="/save", method={RequestMethod.POST})
    public ApiResponse<String> save(SysZdlm entity) {
        this.zdlmService.add(entity);
        return ApiResponse.success();
    }


}
