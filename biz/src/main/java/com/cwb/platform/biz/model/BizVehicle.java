package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_vehicle")
public class BizVehicle implements Serializable {
    /**
     * 主键ID
     */
    @Id
    @Column(name = "v_id")
    private String vId;

    /**
     * 车牌号
     */
    @Column(name = "v_hphm")
    private String vHphm;

    /**
     * 车辆类型
     */
    @Column(name = "v_hpzl")
    private String vHpzl;

    /**
     * 车辆品牌
     */
    @Column(name = "v_clph")
    private String vClph;

    /**
     * 车辆型号
     */
    @Column(name = "v_cllx")
    private String vCllx;

    /**
     * 注册登记日期
     */
    @Column(name = "v_ccdjrq")
    private String vCcdjrq;

    /**
     * 年审时间.通过登记日期自动计算
     */
    @Column(name = "v_nsrq")
    private String vNsrq;

    /**
     * 所有人
     */
    @Column(name = "v_syl")
    private String vSyl;

    /**
     * 使用性质
     */
    @Column(name = "v_syxz")
    private String vSyxz;

    /**
     * 车架号
     */
    @Column(name = "v_cjh")
    private String vCjh;

    /**
     * 发动机号
     */
    @Column(name = "v_fdjh")
    private String vFdjh;

    /**
     * 状态
     */
    @Column(name = "v_zt")
    private String vZt;

    /**
     * 所属公司代码
     */
    @Column(name = "v_gsdm")
    private String vGsdm;

    /**
     * 所属公司名称
     */
    @Column(name = "v_gsmc")
    private String vGsmc;

    /**
     * 使用人
     */
    @Column(name = "v_lxr")
    private String vLxr;

    /**
     * 使用人联系电话
     */
    @Column(name = "v_lxdh")
    private String vLxdh;

    /**
     * 责任人
     */
    @Column(name = "v_zrr")
    private String vZrr;

    /**
     * 责任人联系电话
     */
    @Column(name = "v_zrrlxdh")
    private String vZrrlxdh;

    /**
     * 保单号码
     */
    @Column(name = "v_bdhm")
    private String vBdhm;

    /**
     * 创建人
     */
    @Column(name = "create_user")
    private String createUser;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private String createTime;

    /**
     * 修改人
     */
    @Column(name = "update_user")
    private String updateUser;

    /**
     * 修改时间
     */
    @Column(name = "update_time")
    private String updateTime;

    /**
     * 最后一次加油时间
     */
    @Column(name = "last_fuel_time")
    private String lastFuelTime;
    /**
     * 最后一次加油金额
     */
    @Column(name = "last_fuel_money")
    private BigDecimal lastFuelMoney;
    /**
     * 最后一次加油容量
     */
    @Column(name = "last_fuel_capacity")
    private Integer lastFuelCapacity;

    /**
     * 是否上传运营证。0未上传；1已上传
     */
    @Column(name = "yyz_flag")
    private Integer yyzFlag;

    /**
     * 入库状态：（in:入库，out:出库）
     */
    @Column(name = "v_rkzt")
    private String vRkzt;

    public String getvRkzt() {
        return vRkzt;
    }

    public void setvRkzt(String vRkzt) {
        this.vRkzt = vRkzt;
    }

    public Integer getYyzFlag() {
		return yyzFlag;
	}

	public void setYyzFlag(Integer yyzFlag) {
		this.yyzFlag = yyzFlag;
	}

	public String getvZrr() {
		return vZrr;
	}

	public void setvZrr(String vZrr) {
		this.vZrr = vZrr;
	}

	public String getvZrrlxdh() {
		return vZrrlxdh;
	}

	public void setvZrrlxdh(String vZrrlxdh) {
		this.vZrrlxdh = vZrrlxdh;
	}

	public String getLastFuelTime() {
        return lastFuelTime;
    }

    public void setLastFuelTime(String lastFuelTime) {
        this.lastFuelTime = lastFuelTime;
    }

    public BigDecimal getLastFuelMoney() {
        return lastFuelMoney;
    }

    public void setLastFuelMoney(BigDecimal lastFuelMoney) {
        this.lastFuelMoney = lastFuelMoney;
    }

    public Integer getLastFuelCapacity() {
        return lastFuelCapacity;
    }

    public void setLastFuelCapacity(Integer lastFuelCapacity) {
        this.lastFuelCapacity = lastFuelCapacity;
    }

    private static final long serialVersionUID = 1L;


    /**
     * 获取主键ID
     *
     * @return v_id - 主键ID
     */
    public String getvId() {
        return vId;
    }

    /**
     * 设置主键ID
     *
     * @param vId 主键ID
     */
    public void setvId(String vId) {
        this.vId = vId;
    }

    /**
     * 获取车牌号
     *
     * @return v_hphm - 车牌号
     */
    public String getvHphm() {
        return vHphm;
    }

    /**
     * 设置车牌号
     *
     * @param vHphm 车牌号
     */
    public void setvHphm(String vHphm) {
        this.vHphm = vHphm;
    }

    /**
     * 获取车辆类型
     *
     * @return v_hpzl - 车辆类型
     */
    public String getvHpzl() {
        return vHpzl;
    }

    /**
     * 设置车辆类型
     *
     * @param vHpzl 车辆类型
     */
    public void setvHpzl(String vHpzl) {
        this.vHpzl = vHpzl;
    }

    /**
     * 获取车辆品牌
     *
     * @return v_clph - 车辆品牌
     */
    public String getvClph() {
        return vClph;
    }

    /**
     * 设置车辆品牌
     *
     * @param vClph 车辆品牌
     */
    public void setvClph(String vClph) {
        this.vClph = vClph;
    }

    /**
     * 获取车辆型号
     *
     * @return v_cllx - 车辆型号
     */
    public String getvCllx() {
        return vCllx;
    }

    /**
     * 设置车辆型号
     *
     * @param vCllx 车辆型号
     */
    public void setvCllx(String vCllx) {
        this.vCllx = vCllx;
    }

    /**
     * 获取注册登记日期
     *
     * @return v_ccdjrq - 注册登记日期
     */
    public String getvCcdjrq() {
        return vCcdjrq;
    }

    /**
     * 设置注册登记日期
     *
     * @param vCcdjrq 注册登记日期
     */
    public void setvCcdjrq(String vCcdjrq) {
        this.vCcdjrq = vCcdjrq;
    }

    /**
     * 获取年审时间.通过登记日期自动计算
     *
     * @return v_nsrq - 年审时间.通过登记日期自动计算
     */
    public String getvNsrq() {
        return vNsrq;
    }

    /**
     * 设置年审时间.通过登记日期自动计算
     *
     * @param vNsrq 年审时间.通过登记日期自动计算
     */
    public void setvNsrq(String vNsrq) {
        this.vNsrq = vNsrq;
    }

    /**
     * 获取所有人
     *
     * @return v_syl - 所有人
     */
    public String getvSyl() {
        return vSyl;
    }

    /**
     * 设置所有人
     *
     * @param vSyl 所有人
     */
    public void setvSyl(String vSyl) {
        this.vSyl = vSyl;
    }

    /**
     * 获取使用性质
     *
     * @return v_syxz - 使用性质
     */
    public String getvSyxz() {
        return vSyxz;
    }

    /**
     * 设置使用性质
     *
     * @param vSyxz 使用性质
     */
    public void setvSyxz(String vSyxz) {
        this.vSyxz = vSyxz;
    }

    /**
     * 获取车架号
     *
     * @return v_cjh - 车架号
     */
    public String getvCjh() {
        return vCjh;
    }

    /**
     * 设置车架号
     *
     * @param vCjh 车架号
     */
    public void setvCjh(String vCjh) {
        this.vCjh = vCjh;
    }

    /**
     * 获取发动机号
     *
     * @return v_fdjh - 发动机号
     */
    public String getvFdjh() {
        return vFdjh;
    }

    /**
     * 设置发动机号
     *
     * @param vFdjh 发动机号
     */
    public void setvFdjh(String vFdjh) {
        this.vFdjh = vFdjh;
    }

    /**
     * 获取状态
     *
     * @return v_zt - 状态
     */
    public String getvZt() {
        return vZt;
    }

    /**
     * 设置状态
     *
     * @param vZt 状态
     */
    public void setvZt(String vZt) {
        this.vZt = vZt;
    }

    /**
     * 获取所属公司代码
     *
     * @return v_gsdm - 所属公司代码
     */
    public String getvGsdm() {
        return vGsdm;
    }

    /**
     * 设置所属公司代码
     *
     * @param vGsdm 所属公司代码
     */
    public void setvGsdm(String vGsdm) {
        this.vGsdm = vGsdm;
    }

    /**
     * 获取所属公司名称
     *
     * @return v_gsmc - 所属公司名称
     */
    public String getvGsmc() {
        return vGsmc;
    }

    /**
     * 设置所属公司名称
     *
     * @param vGsmc 所属公司名称
     */
    public void setvGsmc(String vGsmc) {
        this.vGsmc = vGsmc;
    }

    /**
     * 获取使用人
     *
     * @return v_lxr - 使用人
     */
    public String getvLxr() {
        return vLxr;
    }

    /**
     * 设置使用人
     *
     * @param vLxr 使用人
     */
    public void setvLxr(String vLxr) {
        this.vLxr = vLxr;
    }

    /**
     * 获取使用人联系电话
     *
     * @return v_lxdh - 使用人联系电话
     */
    public String getvLxdh() {
        return vLxdh;
    }

    /**
     * 设置使用人联系电话
     *
     * @param vLxdh 使用人联系电话
     */
    public void setvLxdh(String vLxdh) {
        this.vLxdh = vLxdh;
    }

    /**
     * 获取保单号码
     *
     * @return v_bdhm - 保单号码
     */
    public String getvBdhm() {
        return vBdhm;
    }

    /**
     * 设置保单号码
     *
     * @param vBdhm 保单号码
     */
    public void setvBdhm(String vBdhm) {
        this.vBdhm = vBdhm;
    }

    /**
     * 获取创建人
     *
     * @return create_user - 创建人
     */
    public String getCreateUser() {
        return createUser;
    }

    /**
     * 设置创建人
     *
     * @param createUser 创建人
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public String getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取修改人
     *
     * @return update_user - 修改人
     */
    public String getUpdateUser() {
        return updateUser;
    }

    /**
     * 设置修改人
     *
     * @param updateUser 修改人
     */
    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    /**
     * 获取修改时间
     *
     * @return update_time - 修改时间
     */
    public String getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置修改时间
     *
     * @param updateTime 修改时间
     */
    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public enum InnerColumn {
        vId("v_id"),
        vHphm("v_hphm"),
        vHpzl("v_hpzl"),
        vClph("v_clph"),
        vCllx("v_cllx"),
        vCcdjrq("v_ccdjrq"),
        vNsrq("v_nsrq"),
        vSyl("v_syl"),
        vSyxz("v_syxz"),
        vCjh("v_cjh"),
        vFdjh("v_fdjh"),
        vZt("v_zt"),
        vGsdm("v_gsdm"),
        vGsmc("v_gsmc"),
        vLxr("v_lxr"),
        vLxdh("v_lxdh"),
        vZrr("v_zrr"),
        vZrrlxdh("v_zrrlxdh"),
        vBdhm("v_bdhm"),
        createUser("create_user"),
        createTime("create_time"),
        updateUser("update_user"),
        updateTime("update_time");

        private final String column;

        public String value() {
            return this.column;
        }

        public String getValue() {
            return this.column;
        }

        InnerColumn(String column) {
            this.column = column;
        }

        public String desc() {
            return this.column + " DESC";
        }

        public String asc() {
            return this.column + " ASC";
        }
    }
}
