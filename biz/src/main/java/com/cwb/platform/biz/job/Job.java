package com.cwb.platform.biz.job;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Job {

    /**
     * 计算车辆年审时间
     */
    @Scheduled(cron = "")
    public void annualAudit(){


    }
}
