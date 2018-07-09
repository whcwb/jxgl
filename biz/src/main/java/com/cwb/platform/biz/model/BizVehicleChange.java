package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_vehicle_change")
public class BizVehicleChange implements Serializable {
    /**
     * 主键
     */
    @Id
    @Column(name = "chg_id")
    private String chgId;

    /**
     * 车辆主键
     */
    @Column(name = "v_id")
    private String vId;

    /**
     * 车牌号码
     */
    @Column(name = "v_hphm")
    private String vHphm;

    /**
     * 原车辆责任人
     */
    @Column(name = "chg_ozrr")
    private String chgOzrr;

    /**
     * 原责任人联系电话
     */
    @Column(name = "chg_ozrrlxdh")
    private String chgOzrrlxdh;

    /**
     * 新车辆责任人
     */
    @Column(name = "chg_nzrr")
    private String chgNzrr;

    /**
     * 新责任人联系电话
     */
    @Column(name = "chg_nzrrlxdh")
    private String chgNzrrlxdh;

    /**
     * 操作人
     */
    @Column(name = "create_user")
    private String createUser;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private String createTime;
    
    /**
     * 新车辆价值
     */
    @Column(name = "chg_njz")
    private Integer chgNjz;
    
    /**
     * 旧车辆价值
     */
    @Column(name = "chg_ojz")
    private Integer chgOjz;

    private static final long serialVersionUID = 1L;

    /**
     * 设置主键
     *
     * @param chgId 主键
     */
    public void setChgId(String chgId) {
        this.chgId = chgId;
    }

    /**
     * 设置车辆主键
     *
     * @param vId 车辆主键
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
     * 获取原车辆责任人
     *
     * @return chg_ozrr - 原车辆责任人
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
     * 设置原车辆责任人
     *
     * @param chgOzrr 原车辆责任人
     */
    public void setChgOzrr(String chgOzrr) {
        this.chgOzrr = chgOzrr;
    }

    /**
     * 获取原责任人联系电话
     *
     * @return chg_ozrrlxdh - 原责任人联系电话
     */
    public String getChgOzrrlxdh() {
        return chgOzrrlxdh;
    }

    /**
     * 设置原责任人联系电话
     *
     * @param chgOzrrlxdh 原责任人联系电话
     */
    public void setChgOzrrlxdh(String chgOzrrlxdh) {
        this.chgOzrrlxdh = chgOzrrlxdh;
    }

    /**
     * 获取新车辆责任人
     *
     * @return chg_nzrr - 新车辆责任人
     */
    public String getChgNzrr() {
        return chgNzrr;
    }

    /**
     * 设置新车辆责任人
     *
     * @param chgNzrr 新车辆责任人
     */
    public void setChgNzrr(String chgNzrr) {
        this.chgNzrr = chgNzrr;
    }

    /**
     * 获取新责任人联系电话
     *
     * @return chg_nzrrlxdh - 新责任人联系电话
     */
    public String getChgNzrrlxdh() {
        return chgNzrrlxdh;
    }

    /**
     * 设置新责任人联系电话
     *
     * @param chgNzrrlxdh 新责任人联系电话
     */
    public void setChgNzrrlxdh(String chgNzrrlxdh) {
        this.chgNzrrlxdh = chgNzrrlxdh;
    }

    public Integer getChgNjz() {
		return chgNjz;
	}

	public void setChgNjz(Integer chgNjz) {
		this.chgNjz = chgNjz;
	}

	public Integer getChgOjz() {
		return chgOjz;
	}

	public void setChgOjz(Integer chgOjz) {
		this.chgOjz = chgOjz;
	}

	public String getChgId() {
		return chgId;
	}

	public String getvId() {
		return vId;
	}

	public String getChgOzrr() {
		return chgOzrr;
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

    public enum InnerColumn {
        chgId("chg_id"),
        chgOzrr("chg_ozrr"),
        chgOzrrlxdh("chg_ozrrlxdh"),
        chgNzrr("chg_nzrr"),
        chgNzrrlxdh("chg_nzrrlxdh"),
        createUser("create_user"),
        createTime("create_time"),
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