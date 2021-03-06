//网络请求地址前缀 "http://127.0.0.1";//
// let BASE_URL = 'http://127.0.0.1';
// let BASE_URL = 'http://119.97.172.181:8180/api';
let BASE_URL ='http://192.168.123.6:8180'
module.exports = {
    //url: BASE_URL + ':8180',
    url: BASE_URL,
    //图片上传地址
    UPLOAD: 'http://119.97.172.181:8180' + '/upload',
    STATIC_PATH: 'http://119.97.172.181:8180/image/',
    // STATIC_PATH: 'http://119.97.172.181' + ':9001/',
    VIDEO_PATH:'',
    //文件控制119.97.172.181
    FILE:{
        FINDBYPID:BASE_URL+'/api/files/findByPId',//根据主ID查询文件信息
        UPLOAD:BASE_URL+ '/api/files/upload',//根据主ID查询文件信息
        REMOVE:'/api/files/remove/',
    },
    USERROOT:{
        GET_MENU_LIST:'/api/gn/getUserFunctions',
        GET_MENU_TREE:'/api/gn/getMenuTree',
        INIT_MENU:'/api/gn/initMenu',
        MODIFY_PSD:'/api/yh/mdfPwd'
    },
    LOGIN:{
        QUERY:'login'
    },
    USER:{
        QUERY:'/api/yh/pager',//用户管理
        ADD:'/api/yh/save',
        CHANGE:'/api/yh/update',
        GIVE:'/api/js/modifyUserRoles',
        DELE:'/api/yh/removeIds',
        SEARCHSOME:'/api/yh/query',//用户管理
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
    stock:{
        QUERY:'/api/stock/pager',// 查询库存
        ADD:'/api/stock/save',
        CHANGE:'/api/stock/update',
        DELE:'/api/stock/removeIds',
        outStock:'/api/stock/outStock',
        outStocks:'/api/stock/outStocks',
        revert:'/api/stock/revert',
    },
    stockLog:{
        QUERY:'/api/stockLog/pager',// 查询库存历史
        ADD:'/api/stockLog/save',
        CHANGE:'/api/stockLog/update',
        DELE:'/api/stockLog/removeIds',
    },
    notify:{
        QUERY:'/api/notify/pager',// 通知管理
        ADD:'/api/notify/save',// 新增字典
        CHANGE:'/api/notify/update',// 编辑字典
        DELE:'/api/notify/removeIds' // 删除字典
    },
    waitNotify:{
        QUERY:'/api/waitNotify/pager',// 通知管理
        ADD:'/api/waitNotify/save',// 新增字典
        CHANGE:'/api/waitNotify/update',// 编辑字典
        DELE:'/api/waitNotify/removeIds' // 删除字典
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
    DRIVER:{
        QUERY:'api/driver/pager',//驾驶员管理
    },
    CAR:{
        QUERY:'api/car/pager',//车辆管理
        SEARCHSOME:'/api/car/query',//指定条件查询数据
        ADD:'/api/car/save',
        countByCondition:'/api/car/countByCondition',
        lqnjCarList:'/api/car/lqnjCarList',
        CHANGE:'/api/car/update',
        DELE:'/api/car/removeIds',
        ALLOCPERSON:'/api/car/allocPerson',
        notUseCarList:'/api/car/notUseCarList',
        CLNS:'/api/car/clnsUpdate',
        CLNSPAGER:'/api/car/clnsPager',
        SENDSMS:'/api/car/sendSms/',
        PRINT:'/api/car/print/',
        SCANFILE:'/api/car/scanXszFile',
        CHGPAGER:'/api/car/zrrChangePager',
        CHANQUANPAGER:'/api/car/chanquanPager',
        uploadBill:'/api/car/uploadBill',
    },
    illegal:{
        QUERY:'api/illegal/pager',//违法管理
        ADD:'/api/illegal/save',
        CHANGE:'/api/illegal/update',
        DELE:'/api/illegal/removeIds',
        SEND_SMS:'/api/illegal/sendSms',
    },
    vehicleChange:{
        QUERY:'api/vehicleChange/pager',//违法管理
        ADD:'/api/vehicleChange/save',
        CHANGE:'/api/vehicleChange/update',
        DELE:'/api/vehicleChange/removeIds',
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
    useCarApply:{
        QUERY:'api/useCarApply/pager',//用车申请管理
        ADD:'/api/useCarApply/save',
        CHANGE:'/api/useCarApply/update',
        DELE:'/api/useCarApply/removeIds',
        AUDIT:'/api/useCarApply/audit',
    },
    insurance:{
        QUERY:'api/insurance/pager',//保险管理
        ADD:'/api/insurance/save',
        CHANGE:'/api/insurance/update',
        DELE:'/api/insurance/removeIds',
        SEND_SMS:'/api/insurance/sendSms',
        GET_BY_ID:'/api/insurance/',
    },
    insuranceHistory:{
        QUERY:'api/insuranceHistory/pager',//保险管理
        ADD:'/api/insuranceHistory/save',
        CHANGE:'/api/insuranceHistory/update',
        DELE:'/api/insuranceHistory/removeIds',
    },
    userCar:{
        QUERY:'api/userCar/pager',//出车管理
        ADD:'/api/userCar/save',
        CHANGE:'/api/userCar/update',
        DELE:'/api/userCar/removeIds',
        returnCar:'/api/userCar/return',
        getLastReturnMileage:'/api/userCar/getLastReturnMileage',
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
    jiaojie_log:{
        QUERY:'api/transitionLog/pager',//维修管理
    },
    oilRecord:{
        QUERY:'api/oilRecord/pager',//油料管理
        list:'/api/oilRecord/list',
        ADD:'/api/oilRecord/save',
        CHANGE:'/api/oilRecord/update',
        DELE:'/api/oilRecord/removeIds',
    },
    report:{
        zrr:'/api/report/zrr',//保险管理
        wx:'/api/repair/statistics',//维修统计
    },
}
