package com.cwb.platform.biz.service.impl;

import java.io.File;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizFilesMapper;
import com.cwb.platform.biz.model.BizFiles;
import com.cwb.platform.biz.service.FilesService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.exception.RuntimeCheck;
import com.cwb.platform.util.exception.RuntimeCheckException;

import tk.mybatis.mapper.common.Mapper;

@Service
public class FilesServiceImpl extends BaseServiceImpl<BizFiles,String> implements FilesService{
    @Autowired
    private BizFilesMapper entityMapper;
    @Value("${staticPath:/}")
	private String staticPath;

    @Override
    protected Mapper<BizFiles> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizFiles.class;
    }

    @Override
    public ApiResponse<String> saveEntity(BizFiles entity, String batch) {
    	RuntimeCheck.ifBlank(entity.getpId(), "必须指定文件主体");
    	if (StringUtils.isBlank(entity.getVfNetPath()) && StringUtils.isBlank(entity.getVfLocPath())){
    		throw new RuntimeCheckException("文件路径必须存在");
    	}
    	
    	entity.setVfId(genId());
    	entity.setCreateUser(getOperateUser());
    	entity.setCreateTime(DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
    	//如果对象只有网络图片位置，没有本地存储位置，则自动将其本地存储位置补齐
    	if (StringUtils.isNotBlank(entity.getVfNetPath()) && StringUtils.isBlank(entity.getVfLocPath())){
    		//本地实际路径
    		String filePath = staticPath + File.separator + entity.getVfNetPath();
    		entity.setVfLocPath(filePath);
    	}
    	//判断是否批量上传文件
    	if (StringUtils.isBlank(batch)){
    		//如果不是批量上传
    		//查看一下一个文件主体是否已经有相同的文件类型，如果有的话，直接替换当前新的图片内容
        	BizFiles tEntity = new BizFiles();
        	tEntity.setpId(entity.getpId());
        	tEntity.setVfDamc(entity.getVfDamc());
    		BizFiles tExist = this.findOneByEntity(tEntity);
        	if (tExist == null){
        		save(entity);
        	}else{
        		//保存当前主键ID
        		String eId = tExist.getVfId();
        		//替换当前新的数据内容
        		try {
    				BeanUtils.copyProperties(tExist, entity);
    				tExist.setVfId(eId);
    				update(tExist);
    			} catch (Exception e) {
    				
    			}
        	}
    	}else{
    		save(entity);
    	}
    	
        return ApiResponse.saveSuccess();
    }
}
