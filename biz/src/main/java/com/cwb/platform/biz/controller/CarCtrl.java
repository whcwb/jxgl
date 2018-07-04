package com.cwb.platform.biz.controller;


import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cwb.platform.biz.baidu.AiApis;
import com.cwb.platform.biz.model.BizVehLog;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.model.BizVehicleChange;
import com.cwb.platform.biz.service.VehLogService;
import com.cwb.platform.biz.service.VehicleChangeService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.Page;


/**
 * 车辆管理业务处理
 * @author Lee
 *
 */
@SuppressWarnings("unchecked")
@RestController
@RequestMapping("/api/car")
public class CarCtrl extends BaseController<BizVehicle,String> {
    @Autowired
    private VehicleService vehicleService;
    @Autowired
    private VehLogService vehLogService;
    @Autowired
    private VehicleChangeService vehChangeService;
    
    @Override
    protected BaseService<BizVehicle, String> getBaseService() {
        return vehicleService;
    }
    
    /**
     * 给车辆分配人员信息
     */
    @PostMapping("/allocPerson")
	public ApiResponse<String> allocPerson(BizVehicle entity){
		return this.vehicleService.allocPerson(entity);
	}
    
    /**
     * 发送年审通知短信
     * @param vehId
     * @return
     */
    @GetMapping("/sendSms/{vehId}")
	public ApiResponse<String> sendSms(@PathVariable("vehId") String vehId){
    	this.vehicleService.reportZrr();
		return this.vehicleService.sendSms(vehId);
	}
    
    /**
     * 打印年审资料
     * @param vehId
     * @return
     */
    @GetMapping("/print/{vehId}")
	public ApiResponse<String> print(@PathVariable("vehId") String vehId){    	
		return ApiResponse.success();
	}
    
    /**
     * 扫描行驶证自动提取证件内容
     * @param file
     * @param targetPath
     * @return
     */
	@RequestMapping(value="/scanXszFile", method = RequestMethod.POST)
	public ApiResponse<BizVehicle> scanXszFile(@RequestParam("file") MultipartFile file, String targetPath) {
    	BizVehicle scanResult = new BizVehicle();
		try {
			JSONObject words = AiApis.vehicleLicenseFromImageBytes(file.getBytes());
			words.keySet().parallelStream().forEach(key -> {
				String value = words.getJSONObject(key.toString()).getString("words");
				if (key.equals("车辆识别代号")){
					scanResult.setvCjh(value);
				}else if (key.equals("品牌型号")){
					scanResult.setvClph(value);
				}else if (key.equals("发证日期")){
					
				}else if (key.equals("住址")){
					
				}else if (key.equals("车辆类型")){
					if (value.indexOf("小型") != -1){
						scanResult.setvHpzl("20");
					}else{
						scanResult.setvHpzl("10");
					}
				}else if (key.equals("所有人")){
					scanResult.setvSyl(value);
				}else if (key.equals("使用性质")){
					scanResult.setvSyxz("10");
				}else if (key.equals("发动机号码")){
					scanResult.setvFdjh(value);
				}else if (key.equals("号牌号码")){
					scanResult.setvHphm(value);
				}else if (key.equals("注册日期")){
					scanResult.setvCcdjrq(value.substring(0, 4) + "-" + value.substring(4, 6) + "-" + value.substring(6));
				}
			});
			
			if (StringUtils.isEmpty(scanResult.getvHpzl())){
				scanResult.setvHpzl("20");
			}
		} catch (Exception e) {
			
		}
		return ApiResponse.success(scanResult);
	}
    
    @PostMapping(value="/clnsPager")
	public ApiResponse<List<BizVehLog>> pager(BizVehLog entity, Page<BizVehLog> pager){
		return this.vehLogService.pager(pager);
	}
    
    @PostMapping(value="/zrrChangePager")
	public ApiResponse<List<BizVehicleChange>> zrrChangePager(BizVehicleChange entity, Page<BizVehicleChange> pager){
		return this.vehChangeService.pager(pager);
	}

    /**
     * 车辆年审更新
     * @param entity
     * @return
     */
    @PostMapping("/clnsUpdate")
	public ApiResponse<String> clnsUpdate(BizVehLog entity){
		return this.vehicleService.clnsUpdate(entity);
	}

    /**
     * 未借出车辆列表
     */
    @RequestMapping("notUseCarList")
    public ApiResponse<List<BizVehicle>> notUseCarList(){
        return vehicleService.notUseCarList();
    }
    
    /**
     * 产权管理
     * @param entity
     * @param pager
     * @return
     */
    @PostMapping("/chanquanPager")
	public ApiResponse<List<BizVehicle>> chanquanPager(BizVehicle entity, Page<BizVehicle> pager){
		return getBaseService().pager(pager);
	}
}
