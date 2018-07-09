package com.cwb.platform.biz.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

@Table(name = "biz_insurance_history")
public class BizInsuranceHistory implements Serializable {
    /**
     * 主键ID
     */
    @Id
    @Column(name = "in_id")
    private String inId;

    /**
     * 保单编号
     */
    @Column(name = "in_bdh")
    private String inBdh;

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
     * 商业险保险公司
     */
    @Column(name = "in_bxgs")
    private String inBxgs;

    /**
     * 商业险保险电话
     */
    @Column(name = "in_bxdh")
    private String inBxdh;

    /**
     * 商业险起保时间
     */
    @Column(name = "in_qbrq")
    private String inQbrq;

    /**
     * 商业险终保时间。根据起保时间自动推算一年
     */
    @Column(name = "in_zbrq")
    private String inZbrq;

    /**
     * 商业险保险金额
     */
    @Column(name = "in_bxje")
    private BigDecimal inBxje;

    /**
     * 商业险险种。多个险种使用','分隔
     */
    @Column(name = "in_xz")
    private String inXz;

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
     * 交强险保单号
     */
    @Column(name = "in_jqbdh")
    private String inJqbdh;

    /**
     * 交强险保险公司
     */
    @Column(name = "in_jqbxgs")
    private String inJqbxgs;

    /**
     * 交强险保险电话
     */
    @Column(name = "in_jqbxdh")
    private String inJqbxdh;

    /**
     * 交强险起保时间
     */
    @Column(name = "in_jqqbrq")
    private String inJqqbrq;

    /**
     * 交强险终保时间。根据起保时间自动推算一年
     */
    @Column(name = "in_jqzbrq")
    private String inJqzbrq;

    /**
     * 交强险保险金额
     */
    @Column(name = "in_jqbxje")
    private BigDecimal inJqbxje;

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键ID
     *
     * @return in_id - 主键ID
     */
    public String getInId() {
        return inId;
    }

    /**
     * 设置主键ID
     *
     * @param inId 主键ID
     */
    public void setInId(String inId) {
        this.inId = inId;
    }

    /**
     * 获取保单编号
     *
     * @return in_bdh - 保单编号
     */
    public String getInBdh() {
        return inBdh;
    }

    /**
     * 设置保单编号
     *
     * @param inBdh 保单编号
     */
    public void setInBdh(String inBdh) {
        this.inBdh = inBdh;
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
     * 获取商业险保险公司
     *
     * @return in_bxgs - 商业险保险公司
     */
    public String getInBxgs() {
        return inBxgs;
    }

    /**
     * 设置商业险保险公司
     *
     * @param inBxgs 商业险保险公司
     */
    public void setInBxgs(String inBxgs) {
        this.inBxgs = inBxgs;
    }

    /**
     * 获取商业险保险电话
     *
     * @return in_bxdh - 商业险保险电话
     */
    public String getInBxdh() {
        return inBxdh;
    }

    /**
     * 设置商业险保险电话
     *
     * @param inBxdh 商业险保险电话
     */
    public void setInBxdh(String inBxdh) {
        this.inBxdh = inBxdh;
    }

    /**
     * 获取商业险起保时间
     *
     * @return in_qbrq - 商业险起保时间
     */
    public String getInQbrq() {
        return inQbrq;
    }

    /**
     * 设置商业险起保时间
     *
     * @param inQbrq 商业险起保时间
     */
    public void setInQbrq(String inQbrq) {
        this.inQbrq = inQbrq;
    }

    /**
     * 获取商业险终保时间。根据起保时间自动推算一年
     *
     * @return in_zbrq - 商业险终保时间。根据起保时间自动推算一年
     */
    public String getInZbrq() {
        return inZbrq;
    }

    /**
     * 设置商业险终保时间。根据起保时间自动推算一年
     *
     * @param inZbrq 商业险终保时间。根据起保时间自动推算一年
     */
    public void setInZbrq(String inZbrq) {
        this.inZbrq = inZbrq;
    }

    /**
     * 获取商业险保险金额
     *
     * @return in_bxje - 商业险保险金额
     */
    public BigDecimal getInBxje() {
        return inBxje;
    }

    /**
     * 设置商业险保险金额
     *
     * @param inBxje 商业险保险金额
     */
    public void setInBxje(BigDecimal inBxje) {
        this.inBxje = inBxje;
    }

    /**
     * 获取商业险险种。多个险种使用','分隔
     *
     * @return in_xz - 商业险险种。多个险种使用','分隔
     */
    public String getInXz() {
        return inXz;
    }

    /**
     * 设置商业险险种。多个险种使用','分隔
     *
     * @param inXz 商业险险种。多个险种使用','分隔
     */
    public void setInXz(String inXz) {
        this.inXz = inXz;
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
     * 获取交强险保单号
     *
     * @return in_jqbdh - 交强险保单号
     */
    public String getInJqbdh() {
        return inJqbdh;
    }

    /**
     * 设置交强险保单号
     *
     * @param inJqbdh 交强险保单号
     */
    public void setInJqbdh(String inJqbdh) {
        this.inJqbdh = inJqbdh;
    }

    /**
     * 获取交强险保险公司
     *
     * @return in_jqbxgs - 交强险保险公司
     */
    public String getInJqbxgs() {
        return inJqbxgs;
    }

    /**
     * 设置交强险保险公司
     *
     * @param inJqbxgs 交强险保险公司
     */
    public void setInJqbxgs(String inJqbxgs) {
        this.inJqbxgs = inJqbxgs;
    }

    /**
     * 获取交强险保险电话
     *
     * @return in_jqbxdh - 交强险保险电话
     */
    public String getInJqbxdh() {
        return inJqbxdh;
    }

    /**
     * 设置交强险保险电话
     *
     * @param inJqbxdh 交强险保险电话
     */
    public void setInJqbxdh(String inJqbxdh) {
        this.inJqbxdh = inJqbxdh;
    }

    /**
     * 获取交强险起保时间
     *
     * @return in_jqqbrq - 交强险起保时间
     */
    public String getInJqqbrq() {
        return inJqqbrq;
    }

    /**
     * 设置交强险起保时间
     *
     * @param inJqqbrq 交强险起保时间
     */
    public void setInJqqbrq(String inJqqbrq) {
        this.inJqqbrq = inJqqbrq;
    }

    /**
     * 获取交强险终保时间。根据起保时间自动推算一年
     *
     * @return in_jqzbrq - 交强险终保时间。根据起保时间自动推算一年
     */
    public String getInJqzbrq() {
        return inJqzbrq;
    }

    /**
     * 设置交强险终保时间。根据起保时间自动推算一年
     *
     * @param inJqzbrq 交强险终保时间。根据起保时间自动推算一年
     */
    public void setInJqzbrq(String inJqzbrq) {
        this.inJqzbrq = inJqzbrq;
    }

    /**
     * 获取交强险保险金额
     *
     * @return in_jqbxje - 交强险保险金额
     */
    public BigDecimal getInJqbxje() {
        return inJqbxje;
    }

    /**
     * 设置交强险保险金额
     *
     * @param inJqbxje 交强险保险金额
     */
    public void setInJqbxje(BigDecimal inJqbxje) {
        this.inJqbxje = inJqbxje;
    }

    public enum InnerColumn {
        inId("in_id"),
        inBdh("in_bdh"),
        vId("v_id"),
        vHphm("v_hphm"),
        inBxgs("in_bxgs"),
        inBxdh("in_bxdh"),
        inQbrq("in_qbrq"),
        inZbrq("in_zbrq"),
        inBxje("in_bxje"),
        inXz("in_xz"),
        createUser("create_user"),
        createTime("create_time"),
        inJqbdh("in_jqbdh"),
        inJqbxgs("in_jqbxgs"),
        inJqbxdh("in_jqbxdh"),
        inJqqbrq("in_jqqbrq"),
        inJqzbrq("in_jqzbrq"),
        inJqbxje("in_jqbxje");

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
