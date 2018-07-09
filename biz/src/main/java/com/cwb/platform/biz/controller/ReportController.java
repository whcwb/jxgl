package com.cwb.platform.biz.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.util.bean.ApiResponse;

/**
 * 统计报表
 * @author Lee
 *
 */
@RestController
@RequestMapping("/api/report")
public class ReportController {

	@Autowired
    private VehicleService vehicleService;
	
	/**
	 * 按责任人统计车辆数量
	 * @return
	 */
	@PostMapping("/zrr")
	public ApiResponse<List<Map<String,String>>> zrr(){
		return this.vehicleService.reportZrr();
	}
}
