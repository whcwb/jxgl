package com.cwb.platform.sys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.sys.model.SysJs;
import com.cwb.platform.sys.service.JsService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * 平台角色
 */
@RestController
@RequestMapping("/api/js")
public class JsController extends BaseController<SysJs, String> {
    @Autowired
    private JsService roleService;

    @Override
    protected BaseService<SysJs, String> getBaseService() {
        return roleService;
    }

    @Override
    public ApiResponse<String> save(SysJs entity) {
        return roleService.saveEntity(entity);
    }
    
    @Override
    public ApiResponse<String> update(SysJs entity) {
        return roleService.updateEntity(entity);
    }

    /**
     * 修改用户角色
     * @param userId 用户id
     * @param roleIds 角色id列表
     * @return 操作结果
     */
    @RequestMapping(value = "modifyUserRoles",method = RequestMethod.POST)
    public ApiResponse<String> modifyUserRoles(@RequestParam(name="userId" ) String userId,
                                               @RequestParam(name="roleIds") List<String> roleIds){
        return roleService.modifyUserRoles(userId,roleIds);
    }

    /**
     * 获取用户角色
     * @param userId 用户id
     * @return 操作结果
     */
    @RequestMapping(value = "getUserRoles")
    public ApiResponse<List<SysJs>> getUserRoles(String userId){
        List<SysJs> roles = roleService.getUserRoles(userId);
        return new ApiResponse<>(roles);
    }
    @RequestMapping(value = "getUserRolesWithChecked")
    public ApiResponse<List<SysJs>> getUserRolesWithChecked(String userId){
        List<SysJs> roles = roleService.getUserRolesWithChecked(userId);
        return new ApiResponse<>(roles);
    }
}
