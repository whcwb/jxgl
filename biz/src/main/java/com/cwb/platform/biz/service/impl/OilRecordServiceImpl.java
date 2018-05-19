package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.model.BizOilCard;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizOilRecordMapper;
import com.cwb.platform.biz.model.BizOilRecord;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.OilRecordService;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

@Service
public class OilRecordServiceImpl extends BaseServiceImpl<BizOilRecord,String> implements OilRecordService {
    @Autowired
    private BizOilRecordMapper entityMapper;

    @Override
    protected Mapper<BizOilRecord> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizOilRecord.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizOilRecord entity) {
        save(entity);
        return ApiResponse.saveSuccess();
    }

    @Override
    public void chargeLog(BizOilCard card) {
        BizOilRecord record = new BizOilRecord();
        record.setCreateTime(DateUtils.getNowTime());
        record.setCreateUser(getOperateUser());
        record.setYlId(genId());
        record.setYlCzlx("10");
        record.setYkId(card.getYkId());

        entityMapper.insertSelective(record);
    }
}
