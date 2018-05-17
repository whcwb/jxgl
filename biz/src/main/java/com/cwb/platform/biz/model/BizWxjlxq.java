package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_wxjlxq")
public class BizWxjlxq implements Serializable {
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
    private String wxxWxxm;

    /**
     * 维修详情
     */
    @Column(name = "wxx_wxxq")
    private String wxxWxxq;

    /**
     * 维修时间
     */
    @Column(name = "wxx_wxsj")
    private String wxxWxsj;

    /**
     * 维修工厂名
     */
    @Column(name = "wxx_gcmc")
    private String wxxGcmc;

    /**
     * 维修地点
     */
    @Column(name = "wxx_wxdd")
    private String wxxWxdd;

    /**
     * 维修应付金额
     */
    @Column(name = "wxx_yfje")
    private BigDecimal wxxYfje;

    /**
     * 保险报销金额
     */
    @Column(name = "wxx_bxje")
    private BigDecimal wxxBxje;

    /**
     * 维修实付金额
     */
    @Column(name = "wxx_sfje")
    private BigDecimal wxxSfje;

    /**
     * 维修状态
     */
    @Column(name = "wxx_wxzt")
    private String wxxWxzt;

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

    /**
     * 获取维修项目
     *
     * @return wxx_wxxm - 维修项目
     */
    public String getWxxWxxm() {
        return wxxWxxm;
    }

    /**
     * 设置维修项目
     *
     * @param wxxWxxm 维修项目
     */
    public void setWxxWxxm(String wxxWxxm) {
        this.wxxWxxm = wxxWxxm;
    }

    /**
     * 获取维修详情
     *
     * @return wxx_wxxq - 维修详情
     */
    public String getWxxWxxq() {
        return wxxWxxq;
    }

    /**
     * 设置维修详情
     *
     * @param wxxWxxq 维修详情
     */
    public void setWxxWxxq(String wxxWxxq) {
        this.wxxWxxq = wxxWxxq;
    }

    /**
     * 获取维修时间
     *
     * @return wxx_wxsj - 维修时间
     */
    public String getWxxWxsj() {
        return wxxWxsj;
    }

    /**
     * 设置维修时间
     *
     * @param wxxWxsj 维修时间
     */
    public void setWxxWxsj(String wxxWxsj) {
        this.wxxWxsj = wxxWxsj;
    }

    /**
     * 获取维修工厂名
     *
     * @return wxx_gcmc - 维修工厂名
     */
    public String getWxxGcmc() {
        return wxxGcmc;
    }

    /**
     * 设置维修工厂名
     *
     * @param wxxGcmc 维修工厂名
     */
    public void setWxxGcmc(String wxxGcmc) {
        this.wxxGcmc = wxxGcmc;
    }

    /**
     * 获取维修地点
     *
     * @return wxx_wxdd - 维修地点
     */
    public String getWxxWxdd() {
        return wxxWxdd;
    }

    /**
     * 设置维修地点
     *
     * @param wxxWxdd 维修地点
     */
    public void setWxxWxdd(String wxxWxdd) {
        this.wxxWxdd = wxxWxdd;
    }

    /**
     * 获取维修应付金额
     *
     * @return wxx_yfje - 维修应付金额
     */
    public BigDecimal getWxxYfje() {
        return wxxYfje;
    }

    /**
     * 设置维修应付金额
     *
     * @param wxxYfje 维修应付金额
     */
    public void setWxxYfje(BigDecimal wxxYfje) {
        this.wxxYfje = wxxYfje;
    }

    /**
     * 获取保险报销金额
     *
     * @return wxx_bxje - 保险报销金额
     */
    public BigDecimal getWxxBxje() {
        return wxxBxje;
    }

    /**
     * 设置保险报销金额
     *
     * @param wxxBxje 保险报销金额
     */
    public void setWxxBxje(BigDecimal wxxBxje) {
        this.wxxBxje = wxxBxje;
    }

    /**
     * 获取维修实付金额
     *
     * @return wxx_sfje - 维修实付金额
     */
    public BigDecimal getWxxSfje() {
        return wxxSfje;
    }

    /**
     * 设置维修实付金额
     *
     * @param wxxSfje 维修实付金额
     */
    public void setWxxSfje(BigDecimal wxxSfje) {
        this.wxxSfje = wxxSfje;
    }

    /**
     * 获取维修状态
     *
     * @return wxx_wxzt - 维修状态
     */
    public String getWxxWxzt() {
        return wxxWxzt;
    }

    /**
     * 设置维修状态
     *
     * @param wxxWxzt 维修状态
     */
    public void setWxxWxzt(String wxxWxzt) {
        this.wxxWxzt = wxxWxzt;
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
