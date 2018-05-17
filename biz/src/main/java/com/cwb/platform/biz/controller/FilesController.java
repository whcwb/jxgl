
package com.cwb.platform.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
}
