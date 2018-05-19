package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_byxx")
public class BizMaintainInfo implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "by_id")
    private String byId;

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
     * 最后一次保养时间
     */
    @Column(name = "by_bysj")
    private String byBysj;

    /**
     * 最后一次保养金额
     */
    @Column(name = "by_byje")
    private BigDecimal byByje;

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

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键id
     *
     * @return by_id - 主键id
     */
    public String getById() {
        return byId;
    }

    /**
     * 设置主键id
     *
     * @param byId 主键id
     */
    public void setById(String byId) {
        this.byId = byId;
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
     * 获取最后一次保养时间
     *
     * @return by_bysj - 最后一次保养时间
     */
    public String getByBysj() {
        return byBysj;
    }

    /**
     * 设置最后一次保养时间
     *
     * @param byBysj 最后一次保养时间
     */
    public void setByBysj(String byBysj) {
        this.byBysj = byBysj;
    }

    /**
     * 获取最后一次保养金额
     *
     * @return by_byje - 最后一次保养金额
     */
    public BigDecimal getByByje() {
        return byByje;
    }

    /**
     * 设置最后一次保养金额
     *
     * @param byByje 最后一次保养金额
     */
    public void setByByje(BigDecimal byByje) {
        this.byByje = byByje;
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
        byId("by_id"),
        vId("v_id"),
        vHphm("v_hphm"),
        byBysj("by_bysj"),
        byByje("by_byje"),
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
