package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.model.BizOilCard;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizOilRecordMapper;
import com.cwb.platform.biz.model.BizOilRecord;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.OilRecordService;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class OilRecordServiceImpl extends BaseServiceImpl<BizOilRecord,String> implements OilRecordService {
    @Autowired
    private BizOilRecordMapper entityMapper;
    @Autowired
    private VehicleService vehicleService;

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
        entity.setYlId(genId());
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        String carId = entity.getvId();
        RuntimeCheck.ifBlank(carId,"请选择车辆");
        BizVehicle car = vehicleService.findById(carId);
        RuntimeCheck.ifNull(car,"未找到车辆");
        entity.setvHphm(car.getvHphm());
        save(entity);
        vehicleService.fuel(entity);
        return ApiResponse.saveSuccess();
    }

    @Override
    public void chargeLog(BizOilCard card, BigDecimal amount) {
        BizOilRecord record = new BizOilRecord();
        record.setCreateTime(DateUtils.getNowTime());
        record.setCreateUser(getOperateUser());
        record.setYlId(genId());
        record.setYlCzlx("10");
        record.setYkId(card.getYkId());
        record.setYlJe(amount);
        entityMapper.insertSelective(record);
    }

    @Override
    public ApiResponse<List<BizVehicle>> list(BizVehicle entity, String jysj, Page<BizVehicle> pager) {
        LimitedCondition condition = vehicleService.getQueryCondition();
        PageInfo<BizVehicle> resultPage = vehicleService.findPage(pager, condition);
        ApiResponse<List<BizVehicle>> result = new ApiResponse<>();
        result.setPage(resultPage);
        return result;
    }
}
