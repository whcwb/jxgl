package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_wxjl")
public class BizRepairInfo implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "wx_id")
    private String wxId;

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
     * 最后一次维修时间
     */
    @Column(name = "wx_wxsj")
    private String lastRepairTime;

    /**
     * 最后一次维修项目
     */
    @Column(name = "wx_wxxm")
    private String lastRepairProject;

    /**
     * 最后一次应付维护费用
     */
    @Column(name = "wx_zsyfje")
    private BigDecimal lastRepairMoney;

    /**
     * 最后一次保险抵扣费用
     */
    @Column(name = "wx_zsbxje")
    private BigDecimal lastRepairInsuranceMoney;

    /**
     * 最后一次实付维护费用
     */
    @Column(name = "wx_zssfje")
    private BigDecimal lastRepairRealMoney;

    /**
     * 累计维修金额
     */
    @Column(name = "wx_wxzje")
    private BigDecimal totalMoney;

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

    @Transient
    private String ccdjrq;// 初次登记日期

    @Transient
    private String syr; // 使用人

    private static final long serialVersionUID = 1L;

    public String getCcdjrq() {
        return ccdjrq;
    }

    public void setCcdjrq(String ccdjrq) {
        this.ccdjrq = ccdjrq;
    }

    public String getSyr() {
        return syr;
    }

    public void setSyr(String syr) {
        this.syr = syr;
    }

    /**
     * 获取主键id
     *
     * @return wx_id - 主键id
     */
    public String getWxId() {
        return wxId;
    }

    /**
     * 设置主键id
     *
     * @param wxId 主键id
     */
    public void setWxId(String wxId) {
        this.wxId = wxId;
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

    public BigDecimal getLastRepairInsuranceMoney() {
        return lastRepairInsuranceMoney;
    }

    public void setLastRepairInsuranceMoney(BigDecimal lastRepairInsuranceMoney) {
        this.lastRepairInsuranceMoney = lastRepairInsuranceMoney;
    }

    public BigDecimal getLastRepairRealMoney() {
        return lastRepairRealMoney;
    }

    public void setLastRepairRealMoney(BigDecimal lastRepairRealMoney) {
        this.lastRepairRealMoney = lastRepairRealMoney;
    }

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
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
        wxId("wx_id"),
        vId("v_id"),
        vHphm("v_hphm"),
        wxWxsj("wx_wxsj"),
        wxWxxm("wx_wxxm"),
        wxZsyfje("wx_zsyfje"),
        wxZsbxje("wx_zsbxje"),
        wxZssfje("wx_zssfje"),
        wxWxzje("wx_wxzje"),
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
