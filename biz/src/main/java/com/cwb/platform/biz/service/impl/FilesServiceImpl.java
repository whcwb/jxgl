package com.cwb.platform.biz.service.impl;

import org.apache.commons.beanutils.BeanUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizFilesMapper;
import com.cwb.platform.biz.model.BizFiles;
import com.cwb.platform.biz.service.FilesService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.exception.RuntimeCheck;

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
    	RuntimeCheck.ifBlank(entity.getpId(), "必须指定文件主体");
    	RuntimeCheck.ifBlank(entity.getVfLocPath(), "文件路径必须存在");
    	
    	entity.setVfId(genId());
    	entity.setCreateUser(getOperateUser());
    	entity.setCreateTime(DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
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
        
        return ApiResponse.saveSuccess();
    }
}
