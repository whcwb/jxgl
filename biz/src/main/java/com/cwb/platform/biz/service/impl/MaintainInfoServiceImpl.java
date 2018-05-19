package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizMaintainInfoMapper;
import com.cwb.platform.biz.model.BizMaintain;
import com.cwb.platform.biz.model.BizMaintainInfo;
import com.cwb.platform.biz.service.MaintainInfoService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Service
public class MaintainInfoServiceImpl extends BaseServiceImpl<BizMaintainInfo,String> implements MaintainInfoService {
    @Autowired
    private BizMaintainInfoMapper entityMapper;

    @Override
    protected Mapper<BizMaintainInfo> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizMaintainInfo.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizMaintainInfo entity) {
        entity.setvId(genId());
        save(entity);
        return ApiResponse.saveSuccess();
    }

    @Override
    public void maintain(BizMaintain record) {
        BizMaintainInfo info = new BizMaintainInfo();
        info.setvId(record.getvId());
        info.setByByje(record.getBydByje());
        info.setByBysj(DateUtils.getNowTime());
        info.setUpdateTime(DateUtils.getNowTime());
        info.setUpdateUser(getOperateUser());
        List<BizMaintainInfo> maintainInfos = findEq(BizMaintainInfo.InnerColumn.vId,record.getvId());
        if (maintainInfos.size() == 0){
            info.setById(genId());
            entityMapper.insertSelective(info);
        }else{
            info.setById(maintainInfos.get(0).getById());
            entityMapper.updateByPrimaryKeySelective(info);
        }
    }
}
