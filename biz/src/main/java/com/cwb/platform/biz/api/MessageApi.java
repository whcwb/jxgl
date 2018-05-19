package com.cwb.platform.biz.api;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.cwb.platform.util.bean.ApiResponse;

import lombok.extern.slf4j.Slf4j;

/*
 * 业务系统对外开放的接口
 * 
 */

@RestController
@RequestMapping("/pub/")
@Slf4j
public class MessageApi {
	@Value("${staticPath:/}")
	private String staticPath;
	
	@Autowired
	private FilesService filesService;
	
	/**
	 * 通用文件上传
	 * @param file
	 * @param targetPath
	 * @return
	 */
	/*@RequestMapping(value="/upload/{pId}/{pZtlx}/{vfDalx}", method = RequestMethod.POST)
	public ApiResponse<String> uploadImg(@PathVariable("pId")String pId, @PathVariable("pZtlx")String pZtlx, @PathVariable("vfDalx")String vfDalx, @RequestParam("file") MultipartFile file, String targetPath, HttpServletRequest request) {
    	log.debug(request.getHeader("userid")+"========"+request.getHeader("token"));
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
		files.setVfDalx(vfDalx);
		files.setVfLocPath(locFile.getAbsolutePath());
		files.setVfNetPath(path);
		log.debug(pId+"-"+pZtlx+"-"+vfDalx+"="+path);
		return ApiResponse.success(path);
	}*/
}
