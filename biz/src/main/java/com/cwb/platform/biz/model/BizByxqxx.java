package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_byxqxx")
public class BizByxqxx implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "byd_id")
    @GeneratedValue(generator = "JDBC")
    private String bydId;

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
     * 保养地点
     */
    @Column(name = "byd_bydz")
    private String bydBydz;

    /**
     * 保养工厂名称
     */
    @Column(name = "byd_gcmc")
    private String bydGcmc;

    /**
     * 保养费用
     */
    @Column(name = "byd_byje")
    private BigDecimal bydByje;

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
     * 备注
     */
    @Column(name = "byd_bz")
    private String bydBz;

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键id
     *
     * @return byd_id - 主键id
     */
    public String getBydId() {
        return bydId;
    }

    /**
     * 设置主键id
     *
     * @param bydId 主键id
     */
    public void setBydId(String bydId) {
        this.bydId = bydId;
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

    /**
     * 获取保养地点
     *
     * @return byd_bydz - 保养地点
     */
    public String getBydBydz() {
        return bydBydz;
    }

    /**
     * 设置保养地点
     *
     * @param bydBydz 保养地点
     */
    public void setBydBydz(String bydBydz) {
        this.bydBydz = bydBydz;
    }

    /**
     * 获取保养工厂名称
     *
     * @return byd_gcmc - 保养工厂名称
     */
    public String getBydGcmc() {
        return bydGcmc;
    }

    /**
     * 设置保养工厂名称
     *
     * @param bydGcmc 保养工厂名称
     */
    public void setBydGcmc(String bydGcmc) {
        this.bydGcmc = bydGcmc;
    }

    /**
     * 获取保养费用
     *
     * @return byd_byje - 保养费用
     */
    public BigDecimal getBydByje() {
        return bydByje;
    }

    /**
     * 设置保养费用
     *
     * @param bydByje 保养费用
     */
    public void setBydByje(BigDecimal bydByje) {
        this.bydByje = bydByje;
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
     * 获取备注
     *
     * @return byd_bz - 备注
     */
    public String getBydBz() {
        return bydBz;
    }

    /**
     * 设置备注
     *
     * @param bydBz 备注
     */
    public void setBydBz(String bydBz) {
        this.bydBz = bydBz;
    }

    public enum InnerColumn {
        bydId("byd_id"),
        vId("v_id"),
        vHphm("v_hphm"),
        bydBydz("byd_bydz"),
        bydGcmc("byd_gcmc"),
        bydByje("byd_byje"),
        createUser("create_user"),
        createTime("create_time"),
        bydBz("byd_bz");

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