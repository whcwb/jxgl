package com.cwb.platform.biz.service.impl;

import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizFilesMapper;
import com.cwb.platform.biz.model.BizFiles;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.FilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class FilesServiceImpl extends BaseServiceImpl<BizFiles,String> implements FilesService{
    @Autowired
    private BizFilesMapper entityMapper;

    @Override
    protected Mapper<BizFiles> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizFiles.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizFiles entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }
}
