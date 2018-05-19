//网络请求地址前缀
let BASE_URL = 'http://127.0.0.1';
module.exports = {
    url: BASE_URL,
    //图片上传地址
    UPLOAD: BASE_URL + '/upload',
    STATIC_PATH: BASE_URL + ':8765/server/',
    VIDEO_PATH:'',
    USERROOT:{
        GET_MENU_LIST:'/api/gn/getUserFunctions',
        GET_MENU_TREE:'/api/gn/getMenuTree',
        INIT_MENU:'/api/gn/initMenu',
        MODIFY_PSD:'/api/yh/mdfPwd'
    },
    LOGIN:{
        QUERY:'login'
    },
    //文件控制
    FILE:{
        FINDBYPID:'/api/files/findByPId',//根据主ID查询文件信息
        UPLOAD:BASE_URL + '/api/files/upload',//根据主ID查询文件信息
    },
    USER:{
        QUERY:'/api/yh/pager',//用户管理
        ADD:'/api/yh/save',
        CHANGE:'/api/yh/update',
        GIVE:'/api/js/modifyUserRoles',
        DELE:'/api/yh/removeIds'
    },
    ROLE:{
        QUERY:'/api/js/pager',//角色管理
        ALL:'/api/js/getAll',//角色管理
        ADD:'/api/js/save',
        CHANGE:'/api/js/update',
        GIVE:'/api/js/modifyUserRoles',
        DELE:'/api/js/removeIds',
        MODIFY_USER_ROLES:'/api/js/modifyUserRoles',
        GET_USER_ROLES:'/api/js/getUserRoles'
    },
    FRAMEWORK:{
        QUERY:'api/jg/pager',//机构管理
        ADD:'/api/jg/save',
        CHANGE:'/api/jg/update',
        DELE:'/api/jg/removeIds',
        GET_TREE:'/api/jg/getOrgTree',
        GET_TREE_Node:'/api/jg/getTree',
        getSubOrgList:'/api/jg/getSubOrgList',
    },
    DICTIONARY:{
        QUERY:'/api/zd/pager',// 查询字典
        ADD:'/api/zd/save',// 新增字典
        CHANGE:'/api/zd/update',// 编辑字典
        DELE:'/api/zd/removeIds' // 删除字典
    },
    DICTIONARY_LIST:{
        QUERY:'/api/zdxm/pager',//查询字典项
        ADD:'/api/zdxm/save',// 新增字典项
        CHANGE:'/api/zdxm/update',// 编辑字典项
        DELE:'/api/zdxm/removeIds',// 删除字典项
        GET_BY_CONDITION:'/api/zdxm/getCondition', // 删除字典
    },
    ITMS:{
        QUERY:'api/fw/pager',//服务管理
        ADD:'/api/fw/save',
        CHANGE:'/api/fw/update',
        DELE:'/api/fw/removeIds'
    },
    FUNCTION:{
        QUERY:'api/gn/pager',//功能管理
        ADD:'/api/gn/save',
        CHANGE:'/api/gn/update',
        DELE:'/api/gn/removeIds',
        GET_ORG_PERMISSION_TREE:'/api/gn/getOrgPermissionTree',
        GET_ALL_PERMISSION_TREE:'/api/gn/getAllPermissionTree',
        GET_ROLE_PERMISSION_TREE:'/api/gn/getRolePermissionTree',
        SET_ROLE_FUNCTIONS:'/api/gn/setRoleFunctions',
        SET_ORG_FUNCTIONS:'/api/gn/setOrgFunctions',
        GET_ROLE_FUNCTIONS:'/api/gn/getRoleFunctions'
    },
    DAILY:{
        QUERY:'api/rz/pager',//日志管理
        ADD:'/api/rz/save',
        CHANGE:'/api/rz/update',
        DELE:'/api/rz/removeIds'
    },
    OIL_CARD:{
        QUERY:'api/oilCard/pager',//油卡管理
        ADD:'/api/oilCard/save',
        CHANGE:'/api/oilCard/update',
        CHARGE:'/api/oilCard/charge',
        DELE:'/api/oilCard/removeIds',
    },
    CAR:{
        QUERY:'api/car/pager',//车辆管理
        ADD:'/api/car/save',
        CHANGE:'/api/car/update',
        DELE:'/api/car/removeIds',
    },
    illegal:{
        QUERY:'api/illegal/pager',//违法管理
        ADD:'/api/illegal/save',
        CHANGE:'/api/illegal/update',
        DELE:'/api/illegal/removeIds',
    },
    maintain:{
        QUERY:'api/maintain/pager',//保养管理
        ADD:'/api/maintain/save',
        CHANGE:'/api/maintain/update',
        DELE:'/api/maintain/removeIds',
    },
    maintainInfo:{
        QUERY:'api/maintainInfo/pager',//保养管理
        ADD:'/api/maintainInfo/save',
        CHANGE:'/api/maintainInfo/update',
        DELE:'/api/maintainInfo/removeIds',
    },
    insurance:{
        QUERY:'api/insurance/pager',//保险管理
        ADD:'/api/insurance/save',
        CHANGE:'/api/insurance/update',
        DELE:'/api/insurance/removeIds',
    },
    userCar:{
        QUERY:'api/userCar/pager',//出车管理
        ADD:'/api/userCar/save',
        CHANGE:'/api/userCar/update',
        DELE:'/api/userCar/removeIds',
    },
    repair:{
        QUERY:'api/repair/pager',//维修管理
        ADD:'/api/repair/save',
        CHANGE:'/api/repair/update',
        DELE:'/api/repair/removeIds',
    },
    repairInfo:{
        QUERY:'api/repairInfo/pager',//维修管理
        ADD:'/api/repairInfo/save',
        CHANGE:'/api/repairInfo/update',
        DELE:'/api/repairInfo/removeIds',
    },
    oilRecord:{
        QUERY:'api/oilRecord/pager',//油料管理
        list:'/api/oilRecord/list',
        ADD:'/api/oilRecord/save',
        CHANGE:'/api/oilRecord/update',
        DELE:'/api/oilRecord/removeIds',
    },
}
