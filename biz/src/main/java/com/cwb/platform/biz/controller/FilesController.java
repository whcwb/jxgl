
package com.cwb.platform.biz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cwb.platform.biz.baidu.AiApis;
import com.cwb.platform.biz.model.BizFiles;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.FilesService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.sys.service.YhService;
import com.cwb.platform.util.bean.ApiResponse;

import tk.mybatis.mapper.entity.Example;

/**
 * 通用文件管理
 */
@RestController
@RequestMapping("/api/files")
public class FilesController extends BaseController<BizFiles, String> {

	@Autowired
	private FilesService filesService;
	@Value("${staticPath:/}")
	private String staticPath;
	private Executor mThreads = Executors.newFixedThreadPool(2);
	@Autowired
	private YhService userService;
	@Autowired
	private VehicleService vehicleService; 
	
	@Override
	protected BaseService<BizFiles, String> getBaseService() {
		return filesService;
	}
	
	/**
	 * 根据pId查询文件信息
	 * @param pId
	 * @return
	 */
	@RequestMapping(value = "/findByPId/{pId}", method = RequestMethod.GET)
	public ApiResponse<List<BizFiles>> findByPId(@PathVariable("pId")String pId){
		return ApiResponse.success(this.filesService.findEq(BizFiles.InnerColumn.pId.name(), pId));
	}
	
	/**
	 * 根据pId和档案类型查询文件信息
	 * @param pId
	 * @param vfDamc
	 * @return
	 */
	@RequestMapping(value = "/findByPId/{pId}/{vfDamc}", method = RequestMethod.GET)
	public ApiResponse<List<BizFiles>> findByPIdAndDamc(@PathVariable("pId")String pId, @PathVariable("vfDamc")String vfDamc){
		Example condition = new Example(BizFiles.class);
		condition.and().andEqualTo(BizFiles.InnerColumn.pId.name(), pId);
		condition.and().andEqualTo(BizFiles.InnerColumn.vfDamc.name(), vfDamc);
		condition.setOrderByClause(BizFiles.InnerColumn.createTime.asc());
		return ApiResponse.success(this.filesService.findByConditionParam(condition));
	}
	
	/**
	 * 通用文件上传
	 * @param file
	 * @param targetPath
	 * @return
	 */
	@RequestMapping(value="/upload/{pId}/{pZtlx}/{vfDamc}", method = RequestMethod.POST)
	public ApiResponse<String> uploadFile(@PathVariable("pId")String pId, @PathVariable("pZtlx")String pZtlx, @PathVariable("vfDamc")String vfDamc, @RequestParam("file") MultipartFile file, String targetPath,@RequestParam(name="batch", required=false) String batch) {
		if (StringUtils.isEmpty(targetPath)) targetPath = "temp";
		targetPath = targetPath + File.separator + DateTime.now().toString("yyyy-MM-dd") + File.separator;
		String fileName = file.getOriginalFilename();
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString().replaceAll("-","") + suffix;
		//本地实际路径
		String filePath = staticPath + File.separator + targetPath;
		//相对路径
		String path = targetPath + fileName;
		File locFile = new File(filePath + fileName);
		try {
			FileUtils.writeByteArrayToFile(locFile, file.getBytes());
		} catch (Exception e) {
			
		}
		
		BizFiles files = new BizFiles();
		files.setpId(pId);
		files.setpZtlx(pZtlx);
		files.setVfDamc(vfDamc);
		files.setVfLocPath(locFile.getAbsolutePath());
		files.setVfNetPath(path);
		this.filesService.saveEntity(files, batch);
		
		//如果是以下两种证件类型，则做数据自动提取
    	if ("sfzzmFile".equals(vfDamc)){
    		SysYh user = this.userService.findById(pId);
    		//身份证正面内容识别
    		try {
				JSONObject words = AiApis.idcardFromImageBytes(file.getBytes(), "front");
				words.keySet().parallelStream().forEach(key -> {
    				String value = words.getJSONObject(key.toString()).getString("words");
    				if (key.equals("住址")){
    					user.setSfzdz(value);
    				}else if (key.equals("姓名")){
    					user.setXm(value);
    				}
    				
    				userService.update(user);
    			});
			} catch (Exception e) {
				return ApiResponse.fail("身份证信息提取失败");
			}
    	}else if ("sfzfmFile".equals(vfDamc)){
    		SysYh user = this.userService.findById(pId);
    		//身份证正面内容识别
    		try {
				JSONObject words = AiApis.idcardFromImageBytes(file.getBytes(), "back");
				words.keySet().parallelStream().forEach(key -> {
    				String value = words.getJSONObject(key.toString()).getString("words");
    				if (key.equals("失效日期")){
    					//
    					user.setZjhmexp(value);
    					
    					this.userService.update(user);
    				}
    			});
			} catch (IOException e) {
			}
    	}else if ("jszzmFile".equals(vfDamc)){
    		SysYh user = this.userService.findById(pId);
    		//驾驶证正面
    		try {
				JSONObject words = AiApis.drivingLicense(file.getBytes());
				words.keySet().parallelStream().forEach(key -> {
    				String value = words.getJSONObject(key.toString()).getString("words");
    				if (key.equals("初次领证日期")){
    					//
    					user.setJszclrq(value);
    				}else if (key.equals("住址")){
    					//
    					user.setJszdz(value);
    				}else if (key.equals("有效期限")){
    					//
    					user.setJszjzrq(value);
    				}else if (key.equals("准驾车型")){
    					//
    					user.setZjcx(value);
    				}else if (key.equals("档案编号")){
    					//
    					user.setDabh(value);
    				}
    				
    				this.userService.update(user);
    			});
			} catch (IOException e) {
			}
    	}else if ("yyzFile".equals(vfDamc)){
    		BizVehicle vehicle = this.vehicleService.findById(pId);
    		vehicle.setYyzFlag(1);
    		
    		this.vehicleService.update(vehicle);
    	}
    	
		return ApiResponse.success(path);
	}
}
