package com.cwb.platform.biz.service;

import com.cwb.platform.sys.base.BaseService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.model.BizFiles;

public interface FilesService extends BaseService<BizFiles,String>{
	
    ApiResponse<String> saveEntity(BizFiles entity, String batch);
}
