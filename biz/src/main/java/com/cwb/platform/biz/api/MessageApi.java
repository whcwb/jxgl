package com.cwb.platform.biz.api;

import java.util.Map;

import com.cwb.platform.biz.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.RSAUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

/*
 * 业务系统对外开放的接口
 *
 */

@RestController
@RequestMapping("/pub/")
@Slf4j
public class MessageApi {
	@Autowired
	private VehicleService vehicleService;

	/**
	 * 接收车辆状态推送数据
	 * @param json
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/api/vehInfo")
	public ApiResponse<String> vehInfo(@RequestParam("data")String json)throws Exception{
		json = RSAUtils.decryptWithRSA(json);
		log.debug("车辆状态数据："+json);
		Map jsonMap = new ObjectMapper().readValue(json, Map.class);
		return vehicleService.vehInfo(jsonMap);
	}

	/**
	 * 接收车辆违法信息
	 * @param json
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/api/vehViolation")
	public ApiResponse<String> vehViolation(@RequestParam("data")String json)throws Exception{
		json = RSAUtils.decryptWithRSA(json);
		log.debug("车辆违法数据："+json);
		Map jsonMap = new ObjectMapper().readValue(json, Map.class);
		return vehicleService.vehViolation(jsonMap);
	}
}
