package com.cwb.platform.biz.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.CacheNamespace;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.util.cache.MybatisRedisCache;

import tk.mybatis.mapper.common.Mapper;

@CacheNamespace(implementation=MybatisRedisCache.class)
public interface BizVehicleMapper extends Mapper<BizVehicle> {
	
	@Select("select v_zrr as zrr,count(1) as num from biz_vehicle where v_zrr is not null and v_zrr<>'' group by v_zrr")
	@ResultType(value=Map.class)
	public List<Map<String, String>> reportZrr();
}