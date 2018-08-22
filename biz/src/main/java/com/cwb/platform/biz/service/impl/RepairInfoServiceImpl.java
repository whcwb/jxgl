package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizRepairInfoMapper;
import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.biz.model.BizRepairInfo;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.RepairInfoService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.util.ContextUtil;
import com.cwb.platform.util.bean.ApiResponse;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.common.Mapper;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class RepairInfoServiceImpl extends BaseServiceImpl<BizRepairInfo,String> implements RepairInfoService {
    @Autowired
    private BizRepairInfoMapper entityMapper;

    @Autowired
    private VehicleService vehicleService;
    @Override
    protected Mapper<BizRepairInfo> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizRepairInfo.class;
    }

    @Override
    public boolean fillPagerCondition(LimitedCondition condition){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String syr = request.getParameter("syrLike");
        if (StringUtils.isNotEmpty(syr)){
            List<BizVehicle> vehicles = vehicleService.findLike(BizVehicle.InnerColumn.vSyl,syr);
            if (vehicles.size() == 0)return false;
            List<String> carIds = vehicles.stream().map(BizVehicle::getvId).collect(Collectors.toList());
            condition.in(BizRepairInfo.InnerColumn.vId,carIds);
        }
        return true;
    }

    @Override
    public void afterPager(PageInfo<BizRepairInfo> pageInfo){
        List<String> carIds = pageInfo.getList().stream().map(BizRepairInfo::getvId).collect(Collectors.toList());
        if (carIds.size() == 0)return;
        List<BizVehicle> cars = vehicleService.findIn(BizVehicle.InnerColumn.vId,carIds);
        if (cars.size() == 0)return;

        Map<String,BizVehicle> carMap = cars.stream().collect(Collectors.toMap(BizVehicle::getvId,p->p));

        for (BizRepairInfo repairInfo : pageInfo.getList()) {
            String carId = repairInfo.getvId();
            if (StringUtils.isEmpty(carId))continue;
            BizVehicle vehicle = carMap.get(carId);
            if (vehicle == null)continue;
            repairInfo.setCcdjrq(vehicle.getvCcdjrq());
            repairInfo.setSyr(vehicle.getvSyl());
        }
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
            info.setLastRepairTime(record.getRepairTime());
            entityMapper.insertSelective(info);
        }else{
            info.setWxId(repairInfoList.get(0).getWxId());
            info.setTotalMoney(repairInfoList.get(0).getTotalMoney().add(record.getRealMoney()));
            info.setLastRepairInsuranceMoney(record.getInsuranceMoney());
            info.setLastRepairMoney(record.getMoney());
            info.setLastRepairProject(record.getProject());
            info.setLastRepairRealMoney(record.getRealMoney());
            info.setLastRepairTime(record.getRepairTime());
            entityMapper.updateByPrimaryKeySelective(info);
        }
    }
}
