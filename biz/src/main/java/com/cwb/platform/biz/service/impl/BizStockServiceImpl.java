package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizStockMapper;
import com.cwb.platform.biz.model.BizStock;
import com.cwb.platform.biz.service.BizStockLogService;
import com.cwb.platform.biz.service.BizStockService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.ArrayList;
import java.util.List;

@Service
public class BizStockServiceImpl extends BaseServiceImpl<BizStock, String> implements BizStockService {

	@Autowired
	private BizStockMapper baseMapper;
	@Autowired
	private BizStockLogService stockLogService;

	@Override
	protected Mapper<BizStock> getBaseMapper() {
		return baseMapper;
	}

	@Override
	public ApiResponse<String> validAndSave(BizStock stockDto){
		RuntimeCheck.ifBlank(stockDto.getProductName(),"请输入产品名称");
		RuntimeCheck.ifNull(stockDto.getNumber(),"请输入入库数量");

		BizStock stock = findByProductName(stockDto.getProductName());
		String now = DateUtils.getNowTime();
		if (stock == null){
			stockDto.setId(genId());
			stockDto.setNumber(stockDto.getNumber());
			stockDto.setCreateTime(now);
			stockDto.setCreateUser(getOperateUser());
			save(stockDto);
			stockLogService.log(stockDto,stockDto.getNumber(),stockDto.getRemark(),"新增库存");
		}else{
			int beforeUpdate = stock.getNumber();
			stock.setNumber(stock.getNumber() + stockDto.getNumber());
			stock.setUpdateTime(now);
			stock.setUpdateUser(getOperateUser());
			update(stock);
			stockLogService.log(stock,beforeUpdate,stockDto.getRemark(),"入库");
		}
		return ApiResponse.success();
	}

	@Override
	public ApiResponse<String> validAndUpdate(BizStock stockDto){
		RuntimeCheck.ifBlank(stockDto.getProductName(),"请选择商品");
		RuntimeCheck.ifNull(stockDto.getNumber(),"请输入出库数量");
		BizStock stock = findById(stockDto.getId());
		RuntimeCheck.ifNull(stock,"商品库存不存在");

		int beforeUpdate = stock.getNumber();
		baseMapper.updateByPrimaryKeySelective(stockDto);
		stockLogService.log(stock,beforeUpdate,stockDto.getRemark(),"编辑");
		return ApiResponse.success();
	}

	public BizStock findByProductName(String productName){
		SimpleCondition condition = new SimpleCondition(BizStock.class);
		condition.eq(BizStock.InnerColumn.productName,productName);
		List<BizStock> stockList = baseMapper.selectByExample(condition);
		if (stockList.size() == 0) return null;
		return stockList.get(0);
	}
	/**
	 * 出库
	 * @param stockDto
	 * @return
	 */
	@Override
	public ApiResponse<String> outStock(BizStock stockDto) {
		BizStock stock = valid(stockDto);
		int beforeUpdate = stock.getNumber();
		stock.setNumber(stock.getNumber() - stockDto.getNumber());
		stock.setUpdateTime(DateUtils.getNowTime());
		stock.setUpdateUser(getOperateUser());
		update(stock);
		stockLogService.log(stock,beforeUpdate,stockDto.getRemark(),"出库");
		return ApiResponse.success();
	}

	private BizStock valid(BizStock stockDto){
		RuntimeCheck.ifBlank(stockDto.getProductName(),"请选择商品");
		RuntimeCheck.ifNull(stockDto.getNumber(),"请输入出库数量");
		BizStock stock = findByProductName(stockDto.getProductName());
		RuntimeCheck.ifNull(stock,"商品库存不存在");
		RuntimeCheck.ifFalse(stock.getNumber() >= stockDto.getNumber(),"商品库存不足！");

		return stock;
	}

	@Override
	public ApiResponse<String> revert(BizStock stockDto) {
		RuntimeCheck.ifBlank(stockDto.getProductName(),"请选择商品");
		RuntimeCheck.ifNull(stockDto.getNumber(),"请输入撤回数量");
		BizStock stock = findByProductName(stockDto.getProductName());
		RuntimeCheck.ifNull(stock,"商品库存不存在");

		int beforeUpdate = stock.getNumber();
		stock.setNumber(stock.getNumber() + stockDto.getNumber());
		stock.setUpdateTime(DateUtils.getNowTime());
		stock.setUpdateUser(getOperateUser());
		update(stock);
		stockLogService.log(stock,beforeUpdate,stockDto.getRemark(),"撤回");
		return ApiResponse.success();
	}

	@Override
	public ApiResponse<String> outStocks(List<BizStock> stocks) {
		for (BizStock s : stocks) {
			valid(s);
		}

		for (BizStock stockDto : stocks) {
			BizStock stock = findByProductName(stockDto.getProductName());
			int beforeUpdate = stock.getNumber();
			stock.setNumber(stock.getNumber() - stockDto.getNumber());
			stock.setUpdateTime(DateUtils.getNowTime());
			stock.setUpdateUser(getOperateUser());
			update(stock);
			stockLogService.log(stock,beforeUpdate,stockDto.getRemark(),"出库");
		}
		return ApiResponse.success();
	}
}
