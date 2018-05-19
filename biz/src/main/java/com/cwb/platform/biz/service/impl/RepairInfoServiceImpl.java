package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizRepairInfoMapper;
import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.biz.model.BizRepairInfo;
import com.cwb.platform.biz.service.RepairInfoService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.math.BigDecimal;
import java.util.List;

@Service
public class RepairInfoServiceImpl extends BaseServiceImpl<BizRepairInfo,String> implements RepairInfoService {
    @Autowired
    private BizRepairInfoMapper entityMapper;

    @Override
    protected Mapper<BizRepairInfo> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizRepairInfo.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizRepairInfo entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }

    @Override
    public void repair(BizRepair record) {
        BizRepairInfo info = new BizRepairInfo();
        List<BizRepairInfo> repairInfoList = findEq(BizRepairInfo.InnerColumn.vId,record.getvId());
        if (repairInfoList.size() == 0){
            info.setvId(record.getvId());
            info.setWxId(genId());
            info.setvHphm(record.getvHphm());
            info.setTotalMoney(record.getRealMoney());
            info.setLastRepairInsuranceMoney(record.getInsuranceMoney());
            info.setLastRepairMoney(record.getMoney());
            info.setLastRepairProject(record.getProject());
            info.setLastRepairRealMoney(record.getRealMoney());
            info.setLastRepairTime(DateUtils.getNowTime());
            entityMapper.insertSelective(info);
        }else{
            info.setWxId(repairInfoList.get(0).getWxId());
            info.setTotalMoney(repairInfoList.get(0).getTotalMoney().add(record.getRealMoney()));
            info.setLastRepairInsuranceMoney(record.getInsuranceMoney());
            info.setLastRepairMoney(record.getMoney());
            info.setLastRepairProject(record.getProject());
            info.setLastRepairRealMoney(record.getRealMoney());
            info.setLastRepairTime(DateUtils.getNowTime());
            entityMapper.updateByPrimaryKeySelective(info);
        }
    }
}
