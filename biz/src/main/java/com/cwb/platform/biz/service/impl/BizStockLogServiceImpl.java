package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizStockLogMapper;
import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.biz.model.BizStockLog;
import com.cwb.platform.biz.service.BizStockLogService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class BizStockLogServiceImpl extends BaseServiceImpl<BizStockLog, String> implements BizStockLogService {

	@Autowired
	private BizStockLogMapper baseMapper;

	@Override
	protected Mapper<BizStockLog> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public void log(BizStock nowRecord, int beforeUpdate, String remark) {
		BizStockLog log = new BizStockLog();
		log.setId(genId());
		log.setAfterUpdate(nowRecord.getNumber());
		log.setBeforeUpdate(beforeUpdate);
		log.setCreateTime(DateUtils.getNowTime());
		log.setCreateUser(getOperateUser());
		log.setProductCode(nowRecord.getProductCode());
		log.setProductName(nowRecord.getProductName());
		log.setRemark(remark);
		log.setStockId(nowRecord.getId());
		save(log);
	}
}
