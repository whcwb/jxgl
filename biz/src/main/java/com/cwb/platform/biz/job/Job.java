package com.cwb.platform.biz.job;

import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Job {
    @Autowired
    private VehicleService vehicleService;



    /**
     * 计算车辆年审时间
     */
    @Scheduled(cron = "")
    public void annualAudit(){


    }

    /**
     * 更新车辆状态
     */
    @Scheduled(cron = "0 0 1 * * ? ")
    public void setCarStatus(){
        String today = DateUtils.getToday();
        SimpleCondition condition = new SimpleCondition(BizVehicle.class);
        condition.lte(BizVehicle.InnerColumn.vNsrq,today);
        List<BizVehicle> carList = vehicleService.findByCondition(condition);
        if (carList.size() != 0){
            for (BizVehicle vehicle : carList) {
                vehicle.setvZt("F");
                vehicleService.update(vehicle);
            }
        }

    }
}
