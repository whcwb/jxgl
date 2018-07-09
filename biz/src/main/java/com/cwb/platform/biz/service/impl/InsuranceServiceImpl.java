package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizInsuranceMapper;
import com.cwb.platform.biz.model.BizInsurance;
import com.cwb.platform.biz.model.BizInsuranceHistory;
import com.cwb.platform.biz.model.BizVehicle;
import com.cwb.platform.biz.service.InsuranceHistoryService;
import com.cwb.platform.biz.service.InsuranceService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class InsuranceServiceImpl extends BaseServiceImpl<BizInsurance,String> implements InsuranceService{
    @Autowired
    private BizInsuranceMapper entityMapper;
    @Autowired
    private InsuranceHistoryService insuranceHistoryService;
    @Autowired
    private VehicleService vehicleService;

    @Override
    protected Mapper<BizInsurance> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizInsurance.class;
    }

    @Override
    public ApiResponse<List<BizInsurance>> pager(Page<BizInsurance> pager) {
    	ApiResponse<List<BizInsurance>> result = new ApiResponse<>();
        LimitedCondition condition = getQueryCondition();
        condition.setOrderByClause("v_hphm asc,create_time desc");
        HttpServletRequest request = getRequest();
        String bxlq = request.getParameter("bxlq");// 保险临期
        if (StringUtils.isNotBlank(bxlq)){
        	DateTime maxTime = new DateTime().plusDays(60);
            String maxTimeStr = maxTime.toString("yyyy-MM-dd");
            String nowStr = new DateTime().toString("yyyy-MM-dd");
            switch(bxlq){
                case "jqx":// 交强险
                	condition.gte(BizInsurance.InnerColumn.inJqzbrq, nowStr);
                    condition.lte(BizInsurance.InnerColumn.inJqzbrq, maxTimeStr);
                    break;
                case "syx": // 商业险
                	condition.gte(BizInsurance.InnerColumn.inZbrq, nowStr);
                    condition.lte(BizInsurance.InnerColumn.inZbrq, maxTimeStr);
                    break;
                case "jqxgb":
                    condition.lte(BizInsurance.InnerColumn.inJqzbrq, nowStr);
                    break;
                case "syxgb":
                    condition.lte(BizInsurance.InnerColumn.inZbrq, nowStr);
                    break;
            }
        }

        PageInfo<BizInsurance> resultPage = findPage(pager, condition);
        afterPager(resultPage);
        result.setPage(resultPage);
        return result;
    }

    public ApiResponse<List<BizInsurance>> pagerTotal(Page<BizInsurance> pager) {
    	ApiResponse<List<BizInsurance>> result = new ApiResponse<>();
        LimitedCondition condition = getQueryCondition();
        condition.setOrderByClause("v_hphm asc,create_time desc");
        HttpServletRequest request = getRequest();
        String bxlq = request.getParameter("bxlq");// 保险临期
        if (StringUtils.isNotBlank(bxlq)){
        	DateTime minTime = new DateTime().minusDays(60);
            String minTimeStr = minTime.toString("yyyy-MM-dd");
            String nowStr = new DateTime().toString("yyyy-MM-dd");
            switch(bxlq){
                case "jqx":// 交强险
                    condition.gte(BizInsurance.InnerColumn.inJqzbrq, minTimeStr);
                    break;
                case "syx": // 商业险
                    condition.gte(BizInsurance.InnerColumn.inZbrq, minTimeStr);
                    break;
                case "jqxgb":
                    condition.gte(BizInsurance.InnerColumn.inJqzbrq, nowStr);
                    break;
                case "syxgb":
                    condition.gte(BizInsurance.InnerColumn.inZbrq, nowStr);
                    break;
            }
        }

        PageInfo<BizInsurance> resultPage = findPage(pager, condition);
        afterPager(resultPage);
        result.setPage(resultPage);
        return result;
    }

    public boolean fillPagerCondition(LimitedCondition condition){
        HttpServletRequest request = getRequest();
        String bxlq = request.getParameter("bxlq");// 保险临期
        if (StringUtils.isBlank(bxlq)){
        	return true;
        }

        DateTime minTime = new DateTime().minusDays(60);
        String minTimeStr = minTime.toString("yyyy-MM-dd");
        String nowStr = new DateTime().toString("yyyy-MM-dd");
        switch(bxlq){
            case "jqx":// 交强险
                condition.gte(BizInsurance.InnerColumn.inJqzbrq,minTimeStr);
                break;
            case "syx": // 商业险
                condition.gte(BizInsurance.InnerColumn.inZbrq,minTimeStr);
                break;
            case "jqxgb":
                condition.gte(BizInsurance.InnerColumn.inJqzbrq,nowStr);
                break;
            case "syxgb":
                condition.gte(BizInsurance.InnerColumn.inZbrq,nowStr);
                break;
        }

        return true;
    }

    /**
     * 保险信息验证同时自动填充修改项
     * @param entity
     * @return
     */
    public BizInsurance validEntity(BizInsurance entity){
    	RuntimeCheck.ifBlank(entity.getvHphm(), "请先选择车辆");
    	RuntimeCheck.ifBlank(entity.getInBdh(), "请先输入保单号");
    	//查看车辆信息是否存在
    	BizVehicle vehicle = this.vehicleService.findById(entity.getvHphm());
    	RuntimeCheck.ifNull(vehicle, "选择的车辆信息不存在");

    	entity.setvId(vehicle.getvId());
    	entity.setvHphm(vehicle.getvHphm());
    	//录入了起保日期，则自动计算终保日期，根据起保日期+1年
    	if (StringUtils.isNotBlank(entity.getInQbrq())){
    		entity.setInZbrq(DateTime.parse(entity.getInQbrq()).plusYears(1).minusDays(1).toString("yyyy-MM-dd"));
    	}
    	if (StringUtils.isNotBlank(entity.getInJqqbrq())){
    		entity.setInJqzbrq(DateTime.parse(entity.getInJqqbrq()).plusYears(1).minusDays(1).toString("yyyy-MM-dd"));
    	}

    	if (StringUtils.isNotBlank(entity.getInBxgs())){
    		String[] bxgs = entity.getInBxgs().split("-");
    		entity.setInBxdh(bxgs[0]);
    		entity.setInBxgs(bxgs[1]);
    	}
    	if (StringUtils.isNotBlank(entity.getInJqbxgs())){
    		String[] bxgs = entity.getInJqbxgs().split("-");
    		entity.setInJqbxdh(bxgs[0]);
    		entity.setInJqbxgs(bxgs[1]);
    	}

    	return entity;
    }

    @Override
    public ApiResponse<String> validAndSave(BizInsurance entity) {
        SysYh user = getCurrentUser();
    	entity = this.validEntity(entity);

        // 根据车辆id查找，如果有记录，则更新，如果没有则新增
    	List<BizInsurance> insuranceList = findEq(BizInsurance.InnerColumn.vId,entity.getvId());
    	if (insuranceList.size() > 0){
    	    BizInsurance insurance = insuranceList.get(0);
    	    entity.setInId(insurance.getInId());
    	    update(entity);
        }else{
            entity.setInId(genId());
            entity.setCreateTime(DateUtils.getNowTime());
            entity.setCreateUser(getOperateUser());
            save(entity);
        }

        // 记录历史表
        BizInsuranceHistory insuranceHistory = new BizInsuranceHistory();
        BeanUtils.copyProperties(entity,insuranceHistory,"inId","createTime","createUser");
        insuranceHistory.setInId(genId());
        insuranceHistory.setCreateTime(DateUtils.getNowTime());
        insuranceHistory.setCreateUser(user.getYhid());
        insuranceHistoryService.save(insuranceHistory);
        return ApiResponse.saveSuccess();
    }

    @Override
    public ApiResponse<String> validAndUpdate(BizInsurance entity) {
    	RuntimeCheck.ifBlank(entity.getInId(), "修改信息不存在");
    	BizInsurance exist = this.findById(entity.getInId());
    	RuntimeCheck.ifNull(exist, "修改信息不存在");
    	entity = this.validEntity(entity);

        update(entity);
        return ApiResponse.saveSuccess();
    }
}
