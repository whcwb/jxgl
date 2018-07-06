package com.cwb.platform.biz.service.impl;

import com.cwb.platform.biz.mapper.BizMaintainInfoMapper;
import com.cwb.platform.biz.mapper.BizRepairInfoMapper;
import com.cwb.platform.biz.mapper.BizVehicleMapper;
import com.cwb.platform.biz.model.*;
import com.cwb.platform.biz.service.TransitionLogService;
import com.cwb.platform.biz.service.UsecarService;
import com.cwb.platform.biz.service.VehLogService;
import com.cwb.platform.biz.service.VehicleService;
import com.cwb.platform.sys.base.BaseServiceImpl;
import com.cwb.platform.sys.base.LimitedCondition;
import com.cwb.platform.sys.model.SysYh;
import com.cwb.platform.sys.model.SysZdxm;
import com.cwb.platform.sys.service.YhService;
import com.cwb.platform.sys.service.ZdxmService;
import com.cwb.platform.util.bean.ApiResponse;
import com.cwb.platform.util.bean.SimpleCondition;
import com.cwb.platform.util.commonUtil.DateUtils;
import com.cwb.platform.util.commonUtil.HttpUtil;
import com.cwb.platform.util.exception.RuntimeCheck;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.Years;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

//import com.cwb.platform.biz.model.BizVehicleChange;
//import com.cwb.platform.biz.service.VehicleChangeService;

@Service
public class VehicleServiceImpl extends BaseServiceImpl<BizVehicle,String> implements VehicleService{
    @Autowired
    private BizVehicleMapper entityMapper;
    @Autowired
    private BizMaintainInfoMapper maintainInfoMapper;
    @Autowired
    private BizRepairInfoMapper repairInfoMapper;
    @Autowired
    private UsecarService usecarService;
    @Autowired
    private YhService userService;
    @Autowired
    private VehLogService vehLogService;
    @Autowired
    private ZdxmService zdxmService;
    @Autowired
    private TransitionLogService transitionLogService;
//    @Autowired
//    private VehicleChangeService vehChangeService;


    private static final String QZBF = "强制报废"; // 强制报废

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

    /**
     * 计算车辆年审时间
     * @param entity
     * @return
     */
    public String getNsrq(BizVehicle entity, int plusYear){
    	String nsrq = null;
	    /*
		  	车辆类型为小型汽车的车辆，且使用性质为非营运的车辆：距注册日期6年以内的每2年检验1次；超过6年的，每年检验1次；超过15年的，每6个月检验1次。
			           车辆类型为中型汽车、大型汽车的车辆，且使用性质为非营运的车辆：距注册日期10年以内每年检验1次；超过10年的，每6个月检验1次。
			           使用性质为营运的车辆：距注册日期5年以内每年检验1次；超过5年的，每6个月检验1次。超过10年的状态为“需强制报废”。
		*/
		if (StringUtils.isNotBlank(entity.getvSyxz())){
			//车辆初次登记日期
			DateTime ccdjrqDate = DateTime.parse(entity.getvCcdjrq());
			if (plusYear != 0){
				ccdjrqDate = ccdjrqDate.plusYears(plusYear);
			}
			//一次性计算出初登日期后15年的每年的年审时间
			List<DateTime> dateLists = Lists.newArrayList();
			for (int i=1; i<=15; i++){
				dateLists.add(ccdjrqDate.plusYears(i));
			}

			//计算初登日期和当前时间相差多少年
			int year = Years.yearsBetween(ccdjrqDate, DateTime.now()).getYears();
			//年审检验步长
			float step = 0;
			//计算出初登日期到今年的日期
			DateTime nsrqDate = ccdjrqDate.plusYears(year).dayOfMonth().withMaximumValue();
			if ("10".equals(entity.getvSyxz())){
				//非营运机动车
				if ("20".equals(entity.getvHpzl())){
					//小型汽车年审
					if (year < 6){
	    				//6年以内每2年检验1次
						int xorYear = year % 2;
						if (xorYear != 0){
							step = 1;
						}else{
							step = 2;
						}
						/*nsrq = nsrqDate.toString("yyyy-MM-dd");
						int xorYear = year % 2;
						if (xorYear != 0){
							nsrq = nsrqDate.plusYears(2).toString("yyyy-MM-dd");
						}*/
	    			}else if (year >= 6 && year <= 15){
	    				//超过6年小于15年的每1年检验1次
	    				step = 1;
	    				//nsrq = nsrqDate.plusYears(1).toString("yyyy-MM-dd");
	    			}else if (year > 15){
	    				//超过15年的每6个月检验1次
	    				step = 0.5f;
	    				//nsrq = nsrqDate.plusYears(1).plusMonths(6).toString("yyyy-MM-dd");
	    			}
				}else{
					//非小型汽车年审
					if (year <= 10){
	    				//10年以内每年检验1次
						step = 1;
						//nsrq = nsrqDate.plusYears(1).toString("yyyy-MM-dd");
	    			}else if (year > 10){
	    				//超过10年的每6个月检验1次
	    				step = 0.5f;
	    				//nsrq = nsrqDate.plusMonths(6).toString("yyyy-MM-dd");
	    			}
				}
			}else if ("20".equals(entity.getvSyxz())){
				//营运机动车或是非小型车辆，每年一审
				if (year <= 5){
					//5年以内每年检验1次
					step = 1;
					//nsrq = nsrqDate.plusYears(1).toString("yyyy-MM-dd");
				}else if (year > 5){
					//超过5年的每6个月检验1次
					step = 0.5f;
					//nsrq = nsrqDate.plusMonths(6).toString("yyyy-MM-dd");
				}else if (year >= 10){
					//超过10年的状态为“需强制报废”
					step = -1;
				}
			}

			if (step == -1){
				nsrq = QZBF;
			}else{
				//根据当前年份找到最近一次需年审的时间，必须要大于当前时间，之前的都认为已年审
				for (int i=0; i<dateLists.size(); i++){
					DateTime tmp = dateLists.get(i);
					if (tmp.isAfter(DateTime.now()) && step == 2){
						int tmpIndex = i + 1;
						if (tmpIndex >= dateLists.size()){
							nsrq = QZBF;
						}else{
							nsrq = dateLists.get(i + 1).toString("yyyy-MM-dd");
						}
						break;
					}else if (tmp.isAfter(DateTime.now()) && step == 1){
						nsrq = tmp.toString("yyyy-MM-dd");
						break;
					}else if (tmp.isAfter(DateTime.now()) && step == 0.5){
						nsrq = tmp.plusMonths(6).toString("yyyy-MM-dd");
						break;
					}
				}
			}

			entity.setvNsrq(nsrq);
		}

		return nsrq;
    }

    public static void main(String[] args){
    	BizVehicle entity = new BizVehicle();
    	entity.setvSyxz("10");
    	entity.setvCcdjrq("2012-07-10");
    	entity.setvHpzl("20");
    	VehicleServiceImpl veh = new VehicleServiceImpl();
    	System.out.println(veh.getNsrq(entity, 0));
    }

    @Override
    public ApiResponse<String> validAndSave(BizVehicle entity) {
    	valid(entity, false);

    	entity.setvHphm(entity.getvHphm().toUpperCase());
        entity.setCreateTime(DateUtils.getNowTime());
        entity.setCreateUser(getOperateUser());
        entity.setvId(genId());
        entity.setvNsrq(getNsrq(entity, 0));
        entity.setYyzFlag(0);
        entity.setvRkzt("in"); // 新增车辆时默认是入库状态
        save(entity);

        // 初始化保养信息
        BizMaintainInfo maintainInfo = new BizMaintainInfo();
        maintainInfo.setById(genId());
        maintainInfo.setvId(entity.getvId());
        maintainInfo.setvHphm(entity.getvHphm());
        maintainInfoMapper.insertSelective(maintainInfo);

        // 初始化维修信息
        BizRepairInfo repairInfo = new BizRepairInfo();
        repairInfo.setvHphm(entity.getvHphm());
        repairInfo.setvId(entity.getvId());
        repairInfo.setWxId(genId());
        repairInfo.setTotalMoney(new BigDecimal(0));
        repairInfoMapper.insertSelective(repairInfo);
        return ApiResponse.saveSuccess();
    }

    @Override
    public ApiResponse<String> validAndUpdate(BizVehicle entity){
    	valid(entity, true);

    	//如果责任人和责任人联系电话发生了变更，则记录表更记录表中
//    	if (!StringUtils.isAnyEmpty(entity.getvZrr(), entity.getvZrrlxdh())){
//    		BizVehicle exist = this.findById(entity.getvId());
//    		if (!StringUtils.isAnyEmpty(exist.getvZrr(), exist.getvZrrlxdh()) && (!entity.getvZrr().equals(exist.getvZrr()) || !entity.getvZrrlxdh().equals(exist.getvZrrlxdh()))){
//    			BizVehicleChange change = new BizVehicleChange();
//    			change.setChgId(genId());
//    			change.setCreateTime(DateUtils.getNowTime());
//    			change.setCreateUser(getOperateUser());
//    			change.setChgOzrr(exist.getvZrr());
//    			change.setChgOzrrlxdh(exist.getvZrrlxdh());
//    			change.setChgNzrr(entity.getvZrr());
//    			change.setChgNzrrlxdh(entity.getvZrrlxdh());
//    			change.setvId(exist.getvId());
//    			change.setvHphm(exist.getvHphm());
//    			this.vehChangeService.save(change);
//    		}
//    	}
    	entity.setvNsrq(getNsrq(entity, 0));
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
    public void fuel(BizOilRecord record) {
        BizVehicle car = new BizVehicle();
        car.setvId(record.getvId());
        car.setLastFuelCapacity(record.getYlYlrs());
        car.setLastFuelMoney(record.getYlJe());
        car.setLastFuelTime(DateUtils.getNowTime());
        entityMapper.updateByPrimaryKeySelective(car);
    }

	@Override
	public ApiResponse<String> allocPerson(BizVehicle entity) {
		if (StringUtils.isNotBlank(entity.getvLxr())){
			//查看用户信息是否存在
			String[] lxrxx = entity.getvLxr().split("-");
			SysYh user = this.userService.findById(lxrxx[0]);
			RuntimeCheck.ifNull(user, "使用人信息不存在");

			entity.setvLxr(user.getYhid()+"-"+user.getXm());
			entity.setvLxdh(user.getSjh());
		}else{
			entity.setvLxdh("");
		}

		entity.setUpdateTime(DateUtils.getNowTime());
        entity.setUpdateUser(getOperateUser());
        update(entity);
		return ApiResponse.saveSuccess();
	}

    @Override
    public ApiResponse<List<BizVehicle>> notUseCarList() {
        List<BizVehicle> cars = null;
        List<BizUsecar> usecars = usecarService.getNotReturnList();
		//查询全库车辆还是数据太多，目前加入redis缓存，解决一部分速度，后期调整方式，不全库查询
        if (usecars.size() != 0){
        	//List<String> excludeCarIds = usecars.stream().map(BizUsecar::getvId).collect(Collectors.toList());
        	List<String> excludeCarIds = new ArrayList<String>();
        	for (int i=0; i<usecars.size(); i++){
        		BizUsecar item = usecars.get(i);
        		excludeCarIds.add(item.getvId());
        	}

            //查询哪些车辆未被使用
            Example condition = new Example(BizVehicle.class);
            condition.and().andNotIn(BizVehicle.InnerColumn.vId.name(), excludeCarIds);
            cars = findByConditionParam(condition);
        }else{
        	cars = findAll();
        }

        return ApiResponse.success(cars);
    }

    @Override
    public boolean fillPagerCondition(LimitedCondition condition){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String lqnj = request.getParameter("lqnj");
        if ("lqnj".equals(lqnj)){ // 临期年审
            DateTime now = new DateTime();
            Date minDate = now.minusMonths(1).toDate();
            minDate.setDate(1);
            Date maxDate = now.plusMonths(1).toDate();
            maxDate.setDate(1);
            String minLimit = DateUtils.getDateStr(minDate,"yyyy-MM-dd");
            String maxLimit = DateUtils.getDateStr(maxDate,"yyyy-MM-dd");
            condition.gte(BizVehicle.InnerColumn.vNsrq,minLimit);
            condition.lte(BizVehicle.InnerColumn.vNsrq,maxLimit);
            condition.setOrderByClause("v_nsrq asc");
        }else if ("qzbf".equals(lqnj)){ // 强制报废
            condition.eq(BizVehicle.InnerColumn.vNsrq,QZBF);
        }else if ("yqns".equals(lqnj)){ // 逾期年审
            DateTime now = new DateTime();
            String nowStr = now.toString("yyyy-MM-dd");
            condition.lte(BizVehicle.InnerColumn.vNsrq,nowStr);
        }

        return true;
    }

    /**
     * 车辆删除之后，删除与车辆相关联的最后一次维修记录，最后一次保养记录等
     * @param ids
     */
	@Override
    public void afterRemove(String[] ids){
        SimpleCondition condition = new SimpleCondition(BizRepairInfo.class);
        condition.in(BizRepairInfo.InnerColumn.vId, Arrays.asList(ids));
        repairInfoMapper.deleteByExample(condition);

        condition = new SimpleCondition(BizMaintainInfo.class);
        condition.in(BizMaintainInfo.InnerColumn.vId,Arrays.asList(ids));
        maintainInfoMapper.deleteByExample(condition);
    }

	@Override
	public ApiResponse<String> clnsUpdate(BizVehLog entity) {
		RuntimeCheck.ifBlank(entity.getVlXqsj(), "本次年审时间不能为空");
//		RuntimeCheck.ifBlank(entity.getVlText(), "年审内容不能为空");
		RuntimeCheck.ifBlank(entity.getVlBz(), "下次年审时间不能为空");

		BizVehicle exist = this.findById(entity.getvId());
		RuntimeCheck.ifNull(exist, "车辆信息不存在");
		//保存年审操作记录
		entity.setVlId(genId());
		entity.setVlXqlx("10");
		entity.setCreateTime(DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
		entity.setCreateUser(getOperateUser());
		this.vehLogService.save(entity);
		//更新车辆年审时间
		exist.setvNsrq(entity.getVlBz());
		exist.setUpdateTime(DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
		exist.setUpdateUser(getOperateUser());
		update(exist);

		return ApiResponse.success("车辆年审更新成功");
	}

	@Override
	public ApiResponse<String> sendSms(String vehId) {
		BizVehicle exist = this.findById(vehId);
		RuntimeCheck.ifNull(exist, "车辆信息不存在");
		RuntimeCheck.ifNull(exist.getvZrrlxdh(), "请先维护责任人联系电话");
		List<SysZdxm> nstels = this.zdxmService.findEq(SysZdxm.InnerColumn.zdlmdm.name(), "NSTEL");
		RuntimeCheck.ifTrue(CollectionUtils.isEmpty(nstels), "请先在字典管理维护客服电话");

		//发送短信是通知到车辆负责人，不是使用人
		Map<String, String> params = Maps.newConcurrentMap();
		DateTime nsDate = DateTime.now().parse(exist.getvNsrq());
		params.put("SpCode", "239118");
		params.put("LoginName", "wh_tmjx");
		params.put("Password", "tmjx2017");
		params.put("MessageContent", exist.getvHphm()+"车主，您好！您的爱车于"+nsDate.toString("yyyy年MM月")+"需年审，请在收到短信后5天内前往总校办公室找车管专员领取车辆年审资料及时办理年审业务，如有疑问请拨打"+nstels.get(0).getZdmc());
		params.put("UserNumber", exist.getvZrrlxdh());
		params.put("SerialNumber", String.valueOf(DateTime.now().getMillis()));
		params.put("ScheduleTime", "");
		params.put("f", "1");

		String smsResult = HttpUtil.post("https://api.ums86.com:9600/sms/Api/Send.do", params, "gbk");
		if (smsResult.indexOf("result=0") != -1){
			return ApiResponse.success("短信发送成功");
		}

		return ApiResponse.fail("短信发送失败");
	}

	@Override
	public ApiResponse<List<Map<String, String>>> reportZrr() {
		return ApiResponse.success(this.entityMapper.reportZrr());
	}

    @Override
    public ApiResponse<String> uploadBill(String clId, String filePath, String type) {
	    RuntimeCheck.ifBlank(clId,"请选择车辆");
	    RuntimeCheck.ifBlank(filePath,"请上传文件");
	    RuntimeCheck.ifBlank(type,"请选择单据类型");

	    BizVehicle car = findById(clId);
	    RuntimeCheck.ifNull(car,"车辆不存在");

	    car.setvRkzt(type);
	    update(car);

	    // 记录出入库流水
        transitionLogService.log(car,filePath,type);
        return ApiResponse.success();
    }
}
