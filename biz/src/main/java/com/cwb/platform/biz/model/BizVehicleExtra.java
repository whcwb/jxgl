package com.cwb.platform.biz.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

@Table(name = "biz_vehicle")
public class BizVehicleExtra implements Serializable {
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
     * 最后一次维修时间
     */
    @Column(name = "last_repair_time")
    private String lastRepairTime;
    /**
     * 最后一次维修项目
     */
    @Column(name = "last_repair_project")
    private String lastRepairProject;
    /**
     * 最后一次应付维修金额
     */
    @Column(name = "last_repair_money")
    private BigDecimal lastRepairMoney;
    /**
     * 最后一次实付维修金额
     */
    @Column(name = "last_repair_real_money")
    private BigDecimal lastRepairRealMoney;
    /**
     * 累计维修金额
     */
    @Column(name = "total_repairMoney")
    private BigDecimal totalRepairMoney;
    /**
     * 最后一次保养时间
     */
    @Column(name = "last_maintain_time")
    private String lastMaintainTime;
    /**
     * 最后一次保养金额
     */
    @Column(name = "last_maintain_money")
    private BigDecimal lastMaintainMoney;

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

    public String getLastRepairTime() {
        return lastRepairTime;
    }

    public void setLastRepairTime(String lastRepairTime) {
        this.lastRepairTime = lastRepairTime;
    }

    public String getLastRepairProject() {
        return lastRepairProject;
    }

    public void setLastRepairProject(String lastRepairProject) {
        this.lastRepairProject = lastRepairProject;
    }

    public BigDecimal getLastRepairMoney() {
        return lastRepairMoney;
    }

    public void setLastRepairMoney(BigDecimal lastRepairMoney) {
        this.lastRepairMoney = lastRepairMoney;
    }

    public BigDecimal getLastRepairRealMoney() {
        return lastRepairRealMoney;
    }

    public void setLastRepairRealMoney(BigDecimal lastRepairRealMoney) {
        this.lastRepairRealMoney = lastRepairRealMoney;
    }

    public BigDecimal getTotalRepairMoney() {
        return totalRepairMoney;
    }

    public void setTotalRepairMoney(BigDecimal totalRepairMoney) {
        this.totalRepairMoney = totalRepairMoney;
    }

    public String getLastMaintainTime() {
        return lastMaintainTime;
    }

    public void setLastMaintainTime(String lastMaintainTime) {
        this.lastMaintainTime = lastMaintainTime;
    }

    public BigDecimal getLastMaintainMoney() {
        return lastMaintainMoney;
    }

    public void setLastMaintainMoney(BigDecimal lastMaintainMoney) {
        this.lastMaintainMoney = lastMaintainMoney;
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
        vBdhm("v_bdhm");

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
