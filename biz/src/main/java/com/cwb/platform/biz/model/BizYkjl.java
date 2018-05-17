package com.cwb.platform.biz.model;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Table(name = "biz_ykjl")
public class BizYkjl implements Serializable {
    /**
     * 油卡卡号
     */
    @Id
    @Column(name = "yk_id")
    private String ykId;

    /**
     * 发卡公司
     */
    @Column(name = "yk_fkgs")
    private String ykFkgs;

    /**
     * 最后一次用卡时间
     */
    @Column(name = "yk_zsyksj")
    private String ykZsyksj;

    /**
     * 卡余额
     */
    @Column(name = "yk_ye")
    private BigDecimal ykYe;

    /**
     * 最后一次用卡车牌号
     */
    @Column(name = "yk_zshphm")
    private String ykZshphm;

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
     * 获取发卡公司
     *
     * @return yk_fkgs - 发卡公司
     */
    public String getYkFkgs() {
        return ykFkgs;
    }

    /**
     * 设置发卡公司
     *
     * @param ykFkgs 发卡公司
     */
    public void setYkFkgs(String ykFkgs) {
        this.ykFkgs = ykFkgs;
    }

    /**
     * 获取最后一次用卡时间
     *
     * @return yk_zsyksj - 最后一次用卡时间
     */
    public String getYkZsyksj() {
        return ykZsyksj;
    }

    /**
     * 设置最后一次用卡时间
     *
     * @param ykZsyksj 最后一次用卡时间
     */
    public void setYkZsyksj(String ykZsyksj) {
        this.ykZsyksj = ykZsyksj;
    }

    /**
     * 获取卡余额
     *
     * @return yk_ye - 卡余额
     */
    public BigDecimal getYkYe() {
        return ykYe;
    }

    /**
     * 设置卡余额
     *
     * @param ykYe 卡余额
     */
    public void setYkYe(BigDecimal ykYe) {
        this.ykYe = ykYe;
    }

    /**
     * 获取最后一次用卡车牌号
     *
     * @return yk_zshphm - 最后一次用卡车牌号
     */
    public String getYkZshphm() {
        return ykZshphm;
    }

    /**
     * 设置最后一次用卡车牌号
     *
     * @param ykZshphm 最后一次用卡车牌号
     */
    public void setYkZshphm(String ykZshphm) {
        this.ykZshphm = ykZshphm;
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
        ykId("yk_id"),
        ykFkgs("yk_fkgs"),
        ykZsyksj("yk_zsyksj"),
        ykYe("yk_ye"),
        ykZshphm("yk_zshphm"),
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
