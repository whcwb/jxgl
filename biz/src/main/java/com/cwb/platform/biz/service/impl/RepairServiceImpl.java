package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.model.BizRepairInfo;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.RepairInfoService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.biz.mapper.BizRepairMapper;
import com.cwb.platform.biz.model.BizRepair;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.biz.service.RepairService;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.commonUtil.MathUtil;
import com.cwb.platform.util.exception.RuntimeCheck;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.common.Mapper;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Service
public class RepairServiceImpl extends BaseServiceImpl<BizRepair,String> implements RepairService {
    @Autowired
    private BizRepairMapper entityMapper;
    @Autowired
    private BizVehicleMapper vehicleMapper;
    @Autowired
    private RepairInfoService repairInfoService;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    protected Mapper<BizRepair> getBaseMapper() {
        return entityMapper;
    }
    @Override
    protected Class<?> getEntityCls(){
        return BizRepair.class;
    }
    @Override
    public ApiResponse<String> removeIds(String[] ids){
        RuntimeCheck.ifEmpty(ids,"请选择数据");
        for (String id : ids) {
            removeLog(id);
        }
        return ApiResponse.success();
    }

    private void removeLog(String id){
        RuntimeCheck.ifBlank(id,"请选择记录");
        BizRepair repair = findById(id);
        RuntimeCheck.ifNull(repair,"记录不存在");
        // 修改累计维修金额
        List<BizRepairInfo> repairInfos = repairInfoService.findEq(BizRepairInfo.InnerColumn.vId,repair.getvId());
        RuntimeCheck.ifEmpty(repairInfos,"未找到维修记录");
        BizRepairInfo repairInfo = repairInfos.get(0);
        BigDecimal total = new BigDecimal(MathUtil.sub(repairInfo.getTotalMoney().doubleValue(),repair.getMoney().doubleValue()));
        repairInfo.setTotalMoney(total);
        remove(id);
        // 如果删除的记录是最后一次，则修改车辆表相关数据
        if (repair.getRepairTime().equals(repairInfo.getLastRepairTime())){
            BizRepair lastRepair = getLastRepair(repairInfo.getvId());
            if (lastRepair == null){
                BigDecimal zero = new BigDecimal(0);
                repairInfo.setLastRepairInsuranceMoney(zero);
                repairInfo.setLastRepairMoney(zero);
                repairInfo.setLastRepairProject(null);
                repairInfo.setLastRepairTime(null);
                repairInfo.setLastRepairRealMoney(zero);
            }else{
                repairInfo.setLastRepairInsuranceMoney(lastRepair.getInsuranceMoney());
                repairInfo.setLastRepairMoney(lastRepair.getMoney());
                repairInfo.setLastRepairProject(lastRepair.getProject());
                repairInfo.setLastRepairTime(lastRepair.getRepairTime());
                repairInfo.setLastRepairRealMoney(lastRepair.getRealMoney());
            }
        }
        repairInfoService.update(repairInfo);
    }

    private BizRepair getLastRepair(String vId){
        SimpleCondition condition = new SimpleCondition(BizRepair.class);
        condition.eq(BizRepair.InnerColumn.vId,vId);
        condition.setOrderByClause(BizRepair.InnerColumn.wxxWxsj.desc());
        List<BizRepair> repairList = entityMapper.selectByExampleAndRowBounds(condition,new RowBounds(0,1));
        if (repairList.size() == 0)return null;
        return repairList.get(0);
    }

    @Override
    public ApiResponse<String> validAndSave(BizRepair entity) {
        RuntimeCheck.ifBlank(entity.getvId(),"请选择车辆");
        BizVehicle car = vehicleMapper.selectByPrimaryKey(entity.getvId());
        RuntimeCheck.ifNull(car,"车辆不存在");
        entity.setvHphm(car.getvHphm());
        entity.setWxxId(genId());
        entity.setSyr(car.getvSyl());
        if (StringUtils.isEmpty(entity.getCreateTime())){
            entity.setCreateTime(DateUtils.getNowTime());
        }
        save(entity);
        repairInfoService.repair(entity);
        return ApiResponse.saveSuccess();
    }

    @Override
    public ApiResponse<List<Map<String, Object>>> statistics() {
        String sql = "select wxx_jd jd,syr,count(*) c,sum(wxx_sfje) s from biz_wxjlxq where 1=1 ";
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Map<String,String[]> paramMap = request.getParameterMap();
        if (paramMap.containsKey("syrLike")){
            String syrLike = paramMap.get("syrLike")[0];
            if (StringUtils.isNotEmpty(syrLike)){
                sql += " and syr like '%"+syrLike+"%' ";
            }
        }
        if (paramMap.containsKey("jdLike")){
            String jdLike = paramMap.get("jdLike")[0];
            if (StringUtils.isNotEmpty(jdLike)){
                sql += " and wxx_jd like '%"+jdLike+"%' ";
            }
        }
        if (paramMap.containsKey("repairTimeInRange")){
            String[] repairTimeInRange = paramMap.get("repairTimeInRange")[0].split(",");
            if (repairTimeInRange.length > 1){
                String startTime = repairTimeInRange[0];
                String endTime = repairTimeInRange[1];
                if (StringUtils.isNotEmpty(startTime) && StringUtils.isNotEmpty(endTime)){
                    sql += " and wxx_wxsj >= '"+startTime+"' and wxx_wxsj <='"+endTime+"' ";
                }
            }
        }
        sql += " group by wxx_jd,syr";
        List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
        return ApiResponse.success(list);
    }
}
