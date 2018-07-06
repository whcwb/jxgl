package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizNotifyMapper;
import com.cwb.platform.biz.model.BizNotify;
import com.cwb.platform.biz.service.NotifyService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class NotifyServiceImpl extends BaseServiceImpl<BizNotify, String> implements NotifyService {

	@Autowired
	private BizNotifyMapper baseMapper;

	@Override
	protected Mapper<BizNotify> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public ApiResponse<String> validAndSave(BizNotify notify){
		SysYh user = getCurrentUser();
		notify.setCreateTime(DateUtils.getNowTime());
		notify.setCreateUser(user.getYhid());
		notify.setId(genId());
		save(notify);
		return ApiResponse.success();
	}
}
