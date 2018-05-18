package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.service.OilRecordService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizOilCardMapper;
import com.cwb.platform.biz.model.BizOilCard;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.OilCardService;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.math.BigDecimal;

@Service
public class OilCardServiceImpl extends BaseServiceImpl<BizOilCard,String> implements OilCardService {
    @Autowired
    private BizOilCardMapper entityMapper;
    @Autowired
    private OilRecordService cardRecordService;

    @Override
    protected Mapper<BizOilCard> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizOilCard.class;
    }

    @Override
    public ApiResponse<String> validAndSave(BizOilCard entity) {
        entity.setCreateTime(DateUtils.getNowTime());
        save(entity);
        return ApiResponse.saveSuccess();
    }

    @Override
    public ApiResponse<String> charge(String cardId, Float amount) {
        RuntimeCheck.ifBlank(cardId,"请选择油卡");
        RuntimeCheck.ifNull(amount,"请输入充值金额");
        BizOilCard card = entityMapper.selectByPrimaryKey(cardId);
        RuntimeCheck.ifNull(card,"油卡不存在");
        BigDecimal result = card.getYkYe().add(new BigDecimal(amount));
        card.setYkYe(result);
        entityMapper.updateByPrimaryKeySelective(card);
        cardRecordService.chargeLog(card);
        return ApiResponse.success();
    }
}
