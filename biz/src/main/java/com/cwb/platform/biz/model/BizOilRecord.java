package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_yljl")
public class BizOilRecord implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "yl_id")
    private String ylId;

    /**
     * 操作类型。10：充值；20：消费
     */
    @Column(name = "yl_czlx")
    private String ylCzlx;

    /**
     * 油卡卡号
     */
    @Column(name = "yk_id")
    private String ykId;

    /**
     * 油料类型。92，95，98
     */
    @Column(name = "yl_yllx")
    private String ylYllx;

    /**
     * 油料容量
     */
    @Column(name = "yl_ylrs")
    private Integer ylYlrs;

    /**
     * 金额
     */
    @Column(name = "yl_je")
    private BigDecimal ylJe;

    /**
     * 车辆id
     */
    @Column(name = "v_id")
    private String vId;

    /**
     * 车牌号
     */
    @Column(name = "v_hphm")
    private String vHphm;

    /**
     * 操作时间
     */
    @Column(name = "yl_czsj")
    private String ylCzsj;

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
    @Column(name = "yl_bz")
    private String ylBz;

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键id
     *
     * @return yl_id - 主键id
     */
    public String getYlId() {
        return ylId;
    }

    /**
     * 设置主键id
     *
     * @param ylId 主键id
     */
    public void setYlId(String ylId) {
        this.ylId = ylId;
    }

    /**
     * 获取操作类型。10：充值；20：消费
     *
     * @return yl_czlx - 操作类型。10：充值；20：消费
     */
    public String getYlCzlx() {
        return ylCzlx;
    }

    /**
     * 设置操作类型。10：充值；20：消费
     *
     * @param ylCzlx 操作类型。10：充值；20：消费
     */
    public void setYlCzlx(String ylCzlx) {
        this.ylCzlx = ylCzlx;
    }

    /**
     * 获取油卡卡号
     *
     * @return yk_id - 油卡卡号
     */
    public String getYkId() {
        return ykId;
    }

    /**
     * 设置油卡卡号
     *
     * @param ykId 油卡卡号
     */
    public void setYkId(String ykId) {
        this.ykId = ykId;
    }

    /**
     * 获取油料类型。92，95，98
     *
     * @return yl_yllx - 油料类型。92，95，98
     */
    public String getYlYllx() {
        return ylYllx;
    }

    /**
     * 设置油料类型。92，95，98
     *
     * @param ylYllx 油料类型。92，95，98
     */
    public void setYlYllx(String ylYllx) {
        this.ylYllx = ylYllx;
    }

    /**
     * 获取油料容量
     *
     * @return yl_ylrs - 油料容量
     */
    public Integer getYlYlrs() {
        return ylYlrs;
    }

    /**
     * 设置油料容量
     *
     * @param ylYlrs 油料容量
     */
    public void setYlYlrs(Integer ylYlrs) {
        this.ylYlrs = ylYlrs;
    }

    /**
     * 获取金额
     *
     * @return yl_je - 金额
     */
    public BigDecimal getYlJe() {
        return ylJe;
    }

    /**
     * 设置金额
     *
     * @param ylJe 金额
     */
    public void setYlJe(BigDecimal ylJe) {
        this.ylJe = ylJe;
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
     * 获取操作时间
     *
     * @return yl_czsj - 操作时间
     */
    public String getYlCzsj() {
        return ylCzsj;
    }

    /**
     * 设置操作时间
     *
     * @param ylCzsj 操作时间
     */
    public void setYlCzsj(String ylCzsj) {
        this.ylCzsj = ylCzsj;
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
     * @return yl_bz - 备注
     */
    public String getYlBz() {
        return ylBz;
    }

    /**
     * 设置备注
     *
     * @param ylBz 备注
     */
    public void setYlBz(String ylBz) {
        this.ylBz = ylBz;
    }

    public enum InnerColumn {
        ylId("yl_id"),
        ylCzlx("yl_czlx"),
        ykId("yk_id"),
        ylYllx("yl_yllx"),
        ylYlrs("yl_ylrs"),
        ylJe("yl_je"),
        vId("v_id"),
        vHphm("v_hphm"),
        ylCzsj("yl_czsj"),
        createUser("create_user"),
        createTime("create_time"),
        ylBz("yl_bz");

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
