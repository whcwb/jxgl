package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.DriverService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.mapper.SysClkPtyhMapper;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.SimpleCondition;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.common.Mapper;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * auther chenwei
 * create at 2018/8/23
 */
@Service
public class DriverServiceImpl extends BaseServiceImpl<SysYh,String> implements DriverService {
    @Autowired
    private SysClkPtyhMapper ptyhMapper;

    @Autowired
    private VehicleService vehicleService;
    @Override
    protected Mapper<SysYh> getBaseMapper() {
        return ptyhMapper;
    }

    @Override
    public void afterPager(PageInfo<SysYh> pageInfo){
        List<String> userIds = pageInfo.getList().stream().map(p->(p.getYhid()+"-"+p.getXm())).collect(Collectors.toList());
        List<BizVehicle> cars = vehicleService.findIn(BizVehicle.InnerColumn.vLxr,userIds);
        Map<String,BizVehicle> carMap = cars.stream().collect(Collectors.toMap(p->(p.getvLxr().substring(0,p.getvLxr().indexOf("-"))),p->p));
        for (SysYh sysYh : pageInfo.getList()) {
            BizVehicle car = carMap.get(sysYh.getYhid());
            if (car == null)continue;
            sysYh.setCph(car.getvHphm());
        }
    }


    @Override
    public boolean fillPagerCondition(LimitedCondition condition){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String bind = request.getParameter("bind");
        if (StringUtils.isNotEmpty(bind)){
            SimpleCondition carCondition = new SimpleCondition(BizVehicle.class);
            carCondition.and().andIsNotNull(BizVehicle.InnerColumn.vLxr.name());
            carCondition.and().andGreaterThan(BizVehicle.InnerColumn.vLxr.name(),"1");
            List<BizVehicle> carList = vehicleService.findByCondition(carCondition);
            if (carList.size() == 0 &&  "true".equals(bind)){
                return false;
            }
            List<String> lxr = carList.stream().map(BizVehicle::getvLxr).collect(Collectors.toList());
            List<String> lxrId = new ArrayList<>();
            for (String s : lxr) {
                if (StringUtils.isEmpty(s))continue;
                String[] ss = s.split("-");
                lxrId.add(ss[0]);
            }
            if ("true".equals(bind)){
                condition.in(SysYh.InnerColumn.yhid,lxrId);
            }else if ("false".equals(bind)){
                condition.and().andNotIn(SysYh.InnerColumn.yhid.name(),lxrId);
            }
        }
        return true;
    }
}
