package com.cwb.platform.biz.mapper;

import org.apache.ibatis.annotations.CacheNamespace;

import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.util.cache.MybatisRedisCache;

import tk.mybatis.mapper.common.Mapper;

@CacheNamespace(implementation=MybatisRedisCache.class)
public interface BizVehicleMapper extends Mapper<BizVehicle> {
}