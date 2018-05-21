package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_veh_log")
public class BizVehLog implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "vl_id")
    private String vlId;

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
     * 续期类型。10：年审；20：保险；30：保养
     */
    @Column(name = "vl_xqlx")
    private String vlXqlx;

    /**
     * 续期时间
     */
    @Column(name = "vl_xqsj")
    private String vlXqsj;

    /**
     * 续期内容
     */
    @Column(name = "vl_text")
    private String vlText;

    /**
     * 操作人
     */
    @Column(name = "create_user")
    private String createUser;

    /**
     * 操作时间
     */
    @Column(name = "create_time")
    private String createTime;

    /**
     * 备注
     */
    @Column(name = "vl_bz")
    private String vlBz;

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键id
     *
     * @return vl_id - 主键id
     */
    public String getVlId() {
        return vlId;
    }

    /**
     * 设置主键id
     *
     * @param vlId 主键id
     */
    public void setVlId(String vlId) {
        this.vlId = vlId;
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
     * 获取续期类型。10：年审；20：保险；30：保养
     *
     * @return vl_xqlx - 续期类型。10：年审；20：保险；30：保养
     */
    public String getVlXqlx() {
        return vlXqlx;
    }

    /**
     * 设置续期类型。10：年审；20：保险；30：保养
     *
     * @param vlXqlx 续期类型。10：年审；20：保险；30：保养
     */
    public void setVlXqlx(String vlXqlx) {
        this.vlXqlx = vlXqlx;
    }

    /**
     * 获取续期时间
     *
     * @return vl_xqsj - 续期时间
     */
    public String getVlXqsj() {
        return vlXqsj;
    }

    /**
     * 设置续期时间
     *
     * @param vlXqsj 续期时间
     */
    public void setVlXqsj(String vlXqsj) {
        this.vlXqsj = vlXqsj;
    }

    /**
     * 获取续期内容
     *
     * @return vl_text - 续期内容
     */
    public String getVlText() {
        return vlText;
    }

    /**
     * 设置续期内容
     *
     * @param vlText 续期内容
     */
    public void setVlText(String vlText) {
        this.vlText = vlText;
    }

    /**
     * 获取操作人
     *
     * @return create_user - 操作人
     */
    public String getCreateUser() {
        return createUser;
    }

    /**
     * 设置操作人
     *
     * @param createUser 操作人
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    /**
     * 获取操作时间
     *
     * @return create_time - 操作时间
     */
    public String getCreateTime() {
        return createTime;
    }

    /**
     * 设置操作时间
     *
     * @param createTime 操作时间
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取备注
     *
     * @return vl_bz - 备注
     */
    public String getVlBz() {
        return vlBz;
    }

    /**
     * 设置备注
     *
     * @param vlBz 备注
     */
    public void setVlBz(String vlBz) {
        this.vlBz = vlBz;
    }

    public enum InnerColumn {
        vlId("vl_id"),
        vId("v_id"),
        vHphm("v_hphm"),
        vlXqlx("vl_xqlx"),
        vlXqsj("vl_xqsj"),
        vlText("vl_text"),
        createUser("create_user"),
        createTime("create_time"),
        vlBz("vl_bz");

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