package com.cwb.platform.biz.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "biz_wfxx")
public class BizWfxx implements Serializable {
    /**
     * 违法编号
     */
    @Id
    @Column(name = "wf_id")
    private String wfId;

    /**
     * 违法时间
     */
    @Column(name = "wf_wfsj")
    private String wfWfsj;

    /**
     * 违法地点
     */
    @Column(name = "wf_wfdz")
    private String wfWfdz;

    /**
     * 违法行为
     */
    @Column(name = "wf_wfxw")
    private String wfWfxw;

    /**
     * 车辆ID
     */
    @Column(name = "v_id")
    private String vId;

    /**
     * 车牌号码
     */
    @Column(name = "v_hphm")
    private String vHphm;
    /**
     * 车架号
     */
    @Column(name = "v_cjh")
    private String vCjh;

    /**
     * 违法记分
     */
    @Column(name = "wf_wfjf")
    private Integer wfWfjf;

    /**
     * 违法金额
     */
    @Column(name = "wf_wfje")
    private Integer wfWfje;

    /**
     * 违法状态
     */
    @Column(name = "wf_wfzt")
    private String wfWfzt;

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


    @Transient
    private String sendSms;
    @Transient
    private String fzr;
    @Transient
    private String fzrlxfs;

    public String getvCjh() {
        return vCjh;
    }

    public void setvCjh(String vCjh) {
        this.vCjh = vCjh;
    }

    public String getFzr() {
        return fzr;
    }

    public void setFzr(String fzr) {
        this.fzr = fzr;
    }

    public String getFzrlxfs() {
        return fzrlxfs;
    }

    public void setFzrlxfs(String fzrlxfs) {
        this.fzrlxfs = fzrlxfs;
    }

    private static final long serialVersionUID = 1L;

    public String getSendSms() {
        return sendSms;
    }

    public void setSendSms(String sendSms) {
        this.sendSms = sendSms;
    }

    /**
     * 获取违法编号
     *
     * @return wf_id - 违法编号
     */
    public String getWfId() {
        return wfId;
    }

    /**
     * 设置违法编号
     *
     * @param wfId 违法编号
     */
    public void setWfId(String wfId) {
        this.wfId = wfId;
    }

    /**
     * 获取违法时间
     *
     * @return wf_wfsj - 违法时间
     */
    public String getWfWfsj() {
        return wfWfsj;
    }

    /**
     * 设置违法时间
     *
     * @param wfWfsj 违法时间
     */
    public void setWfWfsj(String wfWfsj) {
        this.wfWfsj = wfWfsj;
    }

    /**
     * 获取违法地点
     *
     * @return wf_wfdz - 违法地点
     */
    public String getWfWfdz() {
        return wfWfdz;
    }

    /**
     * 设置违法地点
     *
     * @param wfWfdz 违法地点
     */
    public void setWfWfdz(String wfWfdz) {
        this.wfWfdz = wfWfdz;
    }

    /**
     * 获取违法行为
     *
     * @return wf_wfxw - 违法行为
     */
    public String getWfWfxw() {
        return wfWfxw;
    }

    /**
     * 设置违法行为
     *
     * @param wfWfxw 违法行为
     */
    public void setWfWfxw(String wfWfxw) {
        this.wfWfxw = wfWfxw;
    }

    /**
     * 获取车辆ID
     *
     * @return v_id - 车辆ID
     */
    public String getvId() {
        return vId;
    }

    /**
     * 设置车辆ID
     *
     * @param vId 车辆ID
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
     * 获取违法记分
     *
     * @return wf_wfjf - 违法记分
     */
    public Integer getWfWfjf() {
        return wfWfjf;
    }

    /**
     * 设置违法记分
     *
     * @param wfWfjf 违法记分
     */
    public void setWfWfjf(Integer wfWfjf) {
        this.wfWfjf = wfWfjf;
    }

    /**
     * 获取违法金额
     *
     * @return wf_wfje - 违法金额
     */
    public Integer getWfWfje() {
        return wfWfje;
    }

    /**
     * 设置违法金额
     *
     * @param wfWfje 违法金额
     */
    public void setWfWfje(Integer wfWfje) {
        this.wfWfje = wfWfje;
    }

    /**
     * 获取违法状态
     *
     * @return wf_wfzt - 违法状态
     */
    public String getWfWfzt() {
        return wfWfzt;
    }

    /**
     * 设置违法状态
     *
     * @param wfWfzt 违法状态
     */
    public void setWfWfzt(String wfWfzt) {
        this.wfWfzt = wfWfzt;
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
        wfId("wf_id"),
        wfWfsj("wf_wfsj"),
        wfWfdz("wf_wfdz"),
        wfWfxw("wf_wfxw"),
        vId("v_id"),
        vHphm("v_hphm"),
        wfWfjf("wf_wfjf"),
        wfWfje("wf_wfje"),
        wfWfzt("wf_wfzt"),
        vCjh("v_cjh"),
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
