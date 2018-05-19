
package com.cwb.platform.biz.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cwb.platform.biz.model.BizFiles;
import com.cwb.platform.biz.service.FilesService;
import com.cwb.platform.sys.base.BaseController;
import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;

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
	 * 通用文件上传
	 * @param file
	 * @param targetPath
	 * @return
	 */
	@RequestMapping(value="/upload/{pId}/{pZtlx}/{vfDamc}", method = RequestMethod.POST)
	public ApiResponse<String> uploadFile(@PathVariable("pId")String pId, @PathVariable("pZtlx")String pZtlx, @PathVariable("vfDamc")String vfDamc, @RequestParam("file") MultipartFile file, String targetPath) {
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
		this.filesService.saveEntity(files);
		return ApiResponse.success(path);
	}
}
