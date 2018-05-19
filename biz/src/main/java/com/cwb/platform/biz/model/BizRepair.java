package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_wxjlxq")
public class BizRepair implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "wxx_id")
    private String wxxId;

    /**
     * 车辆id
     */
    @Column(name = "v_id")
    private String vId;

    /**
     * 车牌号码
     */
    @Column(name = "v_hphm")
    private String vHphm;

    /**
     * 维修项目
     */
    @Column(name = "wxx_wxxm")
    private String project;

    /**
     * 维修详情
     */
    @Column(name = "wxx_wxxq")
    private String detail;

    /**
     * 维修时间
     */
    @Column(name = "wxx_wxsj")
    private String repairTime;

    /**
     * 维修工厂名
     */
    @Column(name = "wxx_gcmc")
    private String factoryName;

    /**
     * 维修地点
     */
    @Column(name = "wxx_wxdd")
    private String address;

    /**
     * 维修应付金额
     */
    @Column(name = "wxx_yfje")
    private BigDecimal money;

    /**
     * 保险报销金额
     */
    @Column(name = "wxx_bxje")
    private BigDecimal insuranceMoney;

    /**
     * 维修实付金额
     */
    @Column(name = "wxx_sfje")
    private BigDecimal realMoney;

    /**
     * 维修状态
     */
    @Column(name = "wxx_wxzt")
    private String status;

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

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键id
     *
     * @return wxx_id - 主键id
     */
    public String getWxxId() {
        return wxxId;
    }

    /**
     * 设置主键id
     *
     * @param wxxId 主键id
     */
    public void setWxxId(String wxxId) {
        this.wxxId = wxxId;
    }

    /**
     * 获取车辆id
     *
     * @return v_id - 车辆id
     */
    public String getvId() {
        return vId;
    }

    /**
     * 设置车辆id
     *
     * @param vId 车辆id
     */
    public void setvId(String vId) {
        this.vId = vId;
    }

    /**
     * 获取车牌号码
     *
     * @return v_hphm - 车牌号码
     */
    public String getvHphm() {
        return vHphm;
    }

    /**
     * 设置车牌号码
     *
     * @param vHphm 车牌号码
     */
    public void setvHphm(String vHphm) {
        this.vHphm = vHphm;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getRepairTime() {
        return repairTime;
    }

    public void setRepairTime(String repairTime) {
        this.repairTime = repairTime;
    }

    public String getFactoryName() {
        return factoryName;
    }

    public void setFactoryName(String factoryName) {
        this.factoryName = factoryName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getInsuranceMoney() {
        return insuranceMoney;
    }

    public void setInsuranceMoney(BigDecimal insuranceMoney) {
        this.insuranceMoney = insuranceMoney;
    }

    public BigDecimal getRealMoney() {
        return realMoney;
    }

    public void setRealMoney(BigDecimal realMoney) {
        this.realMoney = realMoney;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public enum InnerColumn {
        wxxId("wxx_id"),
        vId("v_id"),
        vHphm("v_hphm"),
        wxxWxxm("wxx_wxxm"),
        wxxWxxq("wxx_wxxq"),
        wxxWxsj("wxx_wxsj"),
        wxxGcmc("wxx_gcmc"),
        wxxWxdd("wxx_wxdd"),
        wxxYfje("wxx_yfje"),
        wxxBxje("wxx_bxje"),
        wxxSfje("wxx_sfje"),
        wxxWxzt("wxx_wxzt"),
        createUser("create_user"),
        createTime("create_time");

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
