package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_vehicle_change")
public class BizVehicleChange implements Serializable {
    @Id
    @Column(name = "chg_id")
    @GeneratedValue(generator = "JDBC")
    private String chgId;

    @Column(name = "create_time")
    private String createTime;

    @Column(name = "create_user")
    private String createUser;

    @Column(name = "chg_ozrr")
    private String chgOzrr;

    @Column(name = "chg_ozrrlxdh")
    private String chgOzrrlxdh;

    @Column(name = "chg_ojz")
    private String chgOjz;

    @Column(name = "chg_nzrr")
    private String chgNzrr;

    @Column(name = "chg_nzrrlxdh")
    private String chgNzrrlxdh;

    @Column(name = "chg_njz")
    private String chgNjz;

    @Column(name = "v_id")
    private String vId;

    @Column(name = "v_hphm")
    private String vHphm;

    private static final long serialVersionUID = 1L;


    public String getChgOjz() {
        return chgOjz;
    }

    public void setChgOjz(String chgOjz) {
        this.chgOjz = chgOjz;
    }

    public String getChgNjz() {
        return chgNjz;
    }

    public void setChgNjz(String chgNjz) {
        this.chgNjz = chgNjz;
    }

    /**
     * @return chg_id
     */
    public String getChgId() {
        return chgId;
    }

    /**
     * @param chgId
     */
    public void setChgId(String chgId) {
        this.chgId = chgId;
    }

    /**
     * @return create_time
     */
    public String getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * @return create_user
     */
    public String getCreateUser() {
        return createUser;
    }

    /**
     * @param createUser
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    /**
     * @return chg_ozrr
     */
    public String getChgOzrr() {
        return chgOzrr;
    }

    /**
     * @param chgOzrr
     */
    public void setChgOzrr(String chgOzrr) {
        this.chgOzrr = chgOzrr;
    }

    /**
     * @return chg_ozrrlxdh
     */
    public String getChgOzrrlxdh() {
        return chgOzrrlxdh;
    }

    /**
     * @param chgOzrrlxdh
     */
    public void setChgOzrrlxdh(String chgOzrrlxdh) {
        this.chgOzrrlxdh = chgOzrrlxdh;
    }

    /**
     * @return chg_nzrr
     */
    public String getChgNzrr() {
        return chgNzrr;
    }

    /**
     * @param chgNzrr
     */
    public void setChgNzrr(String chgNzrr) {
        this.chgNzrr = chgNzrr;
    }

    /**
     * @return chg_nzrrlxdh
     */
    public String getChgNzrrlxdh() {
        return chgNzrrlxdh;
    }

    /**
     * @param chgNzrrlxdh
     */
    public void setChgNzrrlxdh(String chgNzrrlxdh) {
        this.chgNzrrlxdh = chgNzrrlxdh;
    }

    /**
     * @return v_id
     */
    public String getvId() {
        return vId;
    }

    /**
     * @param vId
     */
    public void setvId(String vId) {
        this.vId = vId;
    }

    /**
     * @return v_hphm
     */
    public String getvHphm() {
        return vHphm;
    }

    /**
     * @param vHphm
     */
    public void setvHphm(String vHphm) {
        this.vHphm = vHphm;
    }

    public enum InnerColumn {
        chgId("chg_id"),
        createTime("create_time"),
        createUser("create_user"),
        chgOzrr("chg_ozrr"),
        chgOzrrlxdh("chg_ozrrlxdh"),
        chgNzrr("chg_nzrr"),
        chgNzrrlxdh("chg_nzrrlxdh"),
        vId("v_id"),
        vHphm("v_hphm");

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
