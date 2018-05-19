package com.cwb.platform.biz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cwb.platform.biz.mapper.BizVehicleExtraMapper;
import com.cwb.platform.biz.model.*;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.exception.RuntimeCheck;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

@Service
public class VehicleServiceImpl extends BaseServiceImpl<BizVehicle,String> implements VehicleService{
    @Autowired
    private BizVehicleMapper entityMapper;
    @Autowired
    private BizVehicleExtraMapper extraMapper;

    @Override
    protected Mapper<BizVehicle> getBaseMapper() {
        return entityMapper;
    }

    @Override
    protected Class<?> getEntityCls(){
        return BizVehicle.class;
    }
    
    /**
     * 检验VIN格式
     * @param vin
     * @return
     */
    public  boolean checkVIN(String vin) {
        Map<Integer, Integer> vinMapWeighting = null;
        Map<Character, Integer> vinMapValue = null;
        vinMapWeighting = new HashMap<Integer, Integer>();
        vinMapValue = new HashMap<Character, Integer>();
        vinMapWeighting.put(1, 8);
        vinMapWeighting.put(2, 7);
        vinMapWeighting.put(3, 6);
        vinMapWeighting.put(4, 5);
        vinMapWeighting.put(5, 4);
        vinMapWeighting.put(6, 3);
        vinMapWeighting.put(7, 2);
        vinMapWeighting.put(8, 10);
        vinMapWeighting.put(9, 0);
        vinMapWeighting.put(10, 9);
        vinMapWeighting.put(11, 8);
        vinMapWeighting.put(12, 7);
        vinMapWeighting.put(13, 6);
        vinMapWeighting.put(14, 5);
        vinMapWeighting.put(15, 4);
        vinMapWeighting.put(16, 3);
        vinMapWeighting.put(17, 2);

        vinMapValue.put('0', 0);
        vinMapValue.put('1', 1);
        vinMapValue.put('2', 2);
        vinMapValue.put('3', 3);
        vinMapValue.put('4', 4);
        vinMapValue.put('5', 5);
        vinMapValue.put('6', 6);
        vinMapValue.put('7', 7);
        vinMapValue.put('8', 8);
        vinMapValue.put('9', 9);
        vinMapValue.put('A', 1);
        vinMapValue.put('B', 2);
        vinMapValue.put('C', 3);
        vinMapValue.put('D', 4);
        vinMapValue.put('E', 5);
        vinMapValue.put('F', 6);
        vinMapValue.put('G', 7);
        vinMapValue.put('H', 8);
        vinMapValue.put('J', 1);
        vinMapValue.put('K', 2);
        vinMapValue.put('M', 4);
        vinMapValue.put('L', 3);
        vinMapValue.put('N', 5);
        vinMapValue.put('P', 7);
        vinMapValue.put('R', 9);
        vinMapValue.put('S', 2);
        vinMapValue.put('T', 3);
        vinMapValue.put('U', 4);
        vinMapValue.put('V', 5);
        vinMapValue.put('W', 6);
        vinMapValue.put('X', 7);
        vinMapValue.put('Y', 8);
        vinMapValue.put('Z', 9);
        boolean reultFlag = false;
        String uppervin = vin.toUpperCase();
        //排除字母O、I
        if (vin == null || uppervin.indexOf("O") >= 0|| uppervin.indexOf("I") >= 0) {
            reultFlag = false;
        } else {
            //1:长度为17
            if (vin.length() == 17) {
                char[] vinArr = uppervin.toCharArray();
                int amount = 0;
                for (int i = 0; i < vinArr.length; i++) {
                    //VIN码从从第一位开始，码数字的对应值×该位的加权值，计算全部17位的乘积值相加
                    amount += vinMapValue.get(vinArr[i])*vinMapWeighting.get(i + 1);
                }
                //乘积值相加除以11、若余数为10，即为字母Ｘ
                if (amount % 11 == 10) {
                    if (vinArr[8] == 'X') {
                        reultFlag = true;
                    } else {
                        reultFlag = false;
                    }

                } else {
                    //VIN码从从第一位开始，码数字的对应值×该位的加权值，
                	//计算全部17位的乘积值相加除以11，所得的余数，即为第九位校验值
                    if (amount % 11 != vinMapValue.get(vinArr[8])) {
                        reultFlag = false;
                    } else {
                        reultFlag = true;
                    }
                }
            }
            //1:长度不为17
            if (!vin.equals("") && vin.length() != 17) {
                reultFlag = false;
            }
        }
        return reultFlag;
    }
    
    public void valid(BizVehicle entity, boolean update){
    	RuntimeCheck.ifBlank(entity.getvHphm(), "车牌号码不能为空");
    	RuntimeCheck.ifBlank(entity.getvCcdjrq(), "注册登记日期不能为空");
    	//判断车牌号是否已存在
    	List<BizVehicle> vehicleList = null;
    	if (update){
    		Example eTmp = new Example(BizVehicle.class);
    		eTmp.and().andEqualTo(BizVehicle.InnerColumn.vHphm.name(), entity.getvHphm());
    		eTmp.and().andNotEqualTo(BizVehicle.InnerColumn.vId.name(), entity.getvId());
    		vehicleList = this.entityMapper.selectByExample(eTmp);
    	}else{
    		vehicleList = this.findEq(BizVehicle.InnerColumn.vHphm.name(), entity.getvHphm());	
    	}
    	
    	RuntimeCheck.ifFalse(CollectionUtils.isEmpty(vehicleList), "车牌号已存在");
    	if (StringUtils.isNotBlank(entity.getvCjh())){
    		RuntimeCheck.ifFalse(checkVIN(entity.getvCjh()), "车架号格式不正确");
    	}
    }

    @Override
    public ApiResponse<String> validAndSave(BizVehicle entity) {
    	valid(entity, false);
    	
    	entity.setvHphm(entity.getvHphm().toUpperCase());
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        entity.setvId(genId());
        save(entity);
        /*BizVehicleExtra extra = new BizVehicleExtra();
        extra.setvId(entity.getvId());
        extra.setvHphm(entity.getvHphm());
        extraMapper.insertSelective(extra);*/
        return ApiResponse.saveSuccess();
    }

    @Override
    public ApiResponse<String> validAndUpdate(BizVehicle entity){
    	valid(entity, true);
    	
    	entity.setvHphm(entity.getvHphm().toUpperCase());
        entity.setUpdateTime(DateUtils.getNowTime());
        entity.setUpdateUser(getOperateUser());
        update(entity);
        return ApiResponse.saveSuccess();
    }

    /**
     * 加油，更新最后一次加油信息
     * @param record
     */
    @Override
    public void fuel(String carId,BizOilRecord record) {
        RuntimeCheck.ifNull(carId,"请选择车辆");
        BizVehicleExtra extra = extraMapper.selectByPrimaryKey(carId);
        if (extra == null)return;
        extra.setLastFuelCapacity(record.getYlYlrs());
        extra.setLastFuelMoney(record.getYlJe());
        extra.setLastFuelTime(DateUtils.getNowTime());
        extraMapper.updateByPrimaryKeySelective(extra);
    }

    @Override
    public void repair(String carId, BizWxjlxq record) {
        RuntimeCheck.ifNull(carId,"请选择车辆");
        BizVehicleExtra extra = extraMapper.selectByPrimaryKey(carId);
        if (extra == null)return;
        extra.setLastRepairMoney(record.getWxxYfje());
        extra.setLastRepairProject(record.getWxxWxxm());
        extra.setLastRepairRealMoney(record.getWxxSfje());
        extra.setLastRepairTime(DateUtils.getNowTime());
        extraMapper.updateByPrimaryKeySelective(extra);
    }

    @Override
    public void maintain(String carId, BizByxqxx record) {
        RuntimeCheck.ifNull(carId,"请选择车辆");
        BizVehicleExtra extra = extraMapper.selectByPrimaryKey(carId);
        if (extra == null)return;
        extra.setLastMaintainMoney(record.getBydByje());
        extra.setLastMaintainTime(DateUtils.getNowTime());
        extraMapper.updateByPrimaryKeySelective(extra);
    }
}
