import Main from '@/views/Main.vue';

// 不作为Main组件的子页面展示的页面单独写，如下
export const loginRouter = {
    path: '/login',
    name: 'login',
    meta: {
        title: '登录'
    },
    component: () => import('@/views/login.vue')
};

export const page404 = {
    path: '/*',
    name: 'error-404',
    meta: {
        title: '404-页面不存在'
    },
    component: () => import('@/views/error-page/404.vue')
};

export const page403 = {
    path: '/403',
    meta: {
        title: '403-权限不足'
    },
    name: 'error-403',
    component: () => import('@//views/error-page/403.vue')
};

export const page500 = {
    path: '/500',
    meta: {
        title: '500-服务端错误'
    },
    name: 'error-500',
    component: () => import('@/views/error-page/500.vue')
};
// 作为Main组件的子页面展示但是不在左侧菜单显示的路由写在otherRouter里
export const otherRouter = {
    path: '/',
    name: 'otherRouter',
    redirect: '/home',
    meta: { title: '首页' },
    component: Main,
    children: [
        {meta: { title: '首页' },path: 'home', title: {i18n: 'home'}, name: 'home_index', component: () => import('@/views/home/home.vue') }
    ]
};

// 作为Main组件的子页面展示并且在左侧菜单显示的路由写在appRouter里
export let appRouter = [
	{
		path: '/system',
        icon: 'android-car',
        name: 'system',
        meta: { title: '系统管理' },
        component: Main,
        children: [
			{
				path: 'system-user',
				icon: 'android-clipboard',
				name: 'system-user',
                meta: { title: '用户管理' },
				component: () => import('@/views/whdx/system/system-user')
			},
			{
				path: 'system-role',
				icon: 'android-clipboard',
				name: 'system-role',
                meta: { title: '角色管理' },
				component: () => import('@/views/whdx/system/system-role')
			},
			{
				path: 'system-framework',
				icon: 'android-clipboard',
				name: 'system-framework',
                meta: { title: '组织机构' },
				component: () => import('@/views/whdx/system/system-framework')
			},
			{
				path: 'system-dictionary',
				icon: 'android-clipboard',
				name: 'system-dictionary',
                meta: { title: '字典管理' },
				component: () => import('@/views/whdx/system/system-dictionary')
			},
			{
				path: 'system-ITSM',
				icon: 'android-clipboard',
				name: 'system-ITSM',
                meta: { title: '服务管理' },
				component: () => import('@/views/whdx/system/system-ITSM')
			},
			{
				path: 'system-function',
				icon: 'android-clipboard',
				name: 'system-function',
                meta: { title: '功能管理' },
				component: () => import('@/views/whdx/system/system-function')
			},
			{
				path: 'system-daily',
				icon: 'android-clipboard',
				name: 'system-daily',
                meta: { title: '日志管理' },
				component: () => import('@/views/whdx/system/system-daily')
			}
		]
	},
    {
        path: '/vehicle',
        icon: 'android-car',
        name: 'vehicle',
        meta: { title: '车辆管理' },
        component: Main,
        children: [
            {
                path: 'vehicle-mgr',
                icon: 'android-clipboard',
                name: 'vehicle-mgr',
                meta: { title: '车辆管理' },
                component: () => import('@/views/whdx/vehicle/vehicle-mgr')
            },
            {
                path: 'vehicle-baoxian',
                icon: 'android-clipboard',
                name: 'vehicle-baoxian',
                meta: { title: '保险管理' },
                component: () => import('@/views/whdx/system/system-role')
            },
            {
                path: 'vehicle-wfxx',
                icon: 'android-clipboard',
                name: 'vehicle-wfxx',
                meta: { title: '违法管理' },
                component: () => import('@/views/whdx/system/system-framework')
            },
            {
                path: 'system-dictionary',
                icon: 'android-clipboard',
                name: 'system-dictionary',
                meta: { title: '出车管理' },
                component: () => import('@/views/whdx/system/system-dictionary')
            }
        ]
    },
    {
        path: '/vehbaoxian',
        icon: 'android-car',
        name: 'vehbaoxian',
        meta: { title: '维保管理' },
        component: Main,
        children: [
            {
                path: 'vehbaoxian-youka',
                icon: 'android-clipboard',
                name: 'vehbaoxian-youka',
                meta: { title: '油卡管理' },
                component: () => import('@/views/whdx/vehbaoxian/vehbaoxian-youka')
            },
            {
                path: 'vehbaoxian-youliao',
                icon: 'android-clipboard',
                name: 'vehbaoxian-youliao',
                meta: { title: '油料管理' },
                component: () => import('@/views/whdx/vehbaoxian/vehbaoxian-youliao')
            },
            {
                path: 'vehbaoxian-weixiu',
                icon: 'android-clipboard',
                name: 'vehbaoxian-weixiu',
                meta: { title: '维修管理' },
                component: () => import('@/views/whdx/vehbaoxian/vehbaoxian-weixiu')
            },
            {
                path: 'vehbaoxian-baoyang',
                icon: 'android-clipboard',
                name: 'vehbaoxian-baoyang',
                meta: { title: '保养管理' },
                component: () => import('@/views/whdx/vehbaoxian/vehbaoxian-baoyang')
            }
        ]
    },
    {
    	path: '/',
    	meta: {
    	    title: '500-服务端错误'
    	},
    	name: 'error-page-500',
    	component: Main,
        children: [
            { path: '500', title: '服务器繁忙', name: 'errorpage_500', component: () => import('@/views/error-page/500.vue') }
        ]
    }
];
// 所有上面定义的路由都要写在下面的routers里
export const routers = [
    loginRouter,
    otherRouter,
    ...appRouter,
    page500,
    page403,
    page404
];
