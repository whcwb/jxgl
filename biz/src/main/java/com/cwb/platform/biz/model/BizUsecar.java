package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_usecar")
public class BizUsecar implements Serializable {
    /**
     * 主键id
     */
    @Id
    @Column(name = "uc_id")
    private String ucId;

    /**
     * 车牌id
     */
    @Column(name = "v_id")
    private String vId;

    /**
     * 车牌号码
     */
    @Column(name = "v_hphm")
    private String vHphm;

    /**
     * 出车时间
     */
    @Column(name = "uc_ccsj")
    private String ucCcsj;

    /**
     * 出车事由
     */
    @Column(name = "uc_ccsy")
    private String ucCcsy;

    /**
     * 借用人id
     */
    @Column(name = "uc_jyrid")
    private String ucJyrid;

    /**
     * 借用人
     */
    @Column(name = "uc_jyr")
    private String ucJyr;

    /**
     * 预计还车时间
     */
    @Column(name = "uc_yjhcsj")
    private String ucYjhcsj;

    /**
     * 出车前里程数
     */
    @Column(name = "uc_cclcs")
    private Integer ucCclcs;

    /**
     * 还车里程数
     */
    @Column(name = "un_hclcs")
    private Integer unHclcs;

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

    /**
     * 备注
     */
    @Column(name = "uc_bz")
    private String ucBz;

    private static final long serialVersionUID = 1L;

    /**
     * 获取主键id
     *
     * @return uc_id - 主键id
     */
    public String getUcId() {
        return ucId;
    }

    /**
     * 设置主键id
     *
     * @param ucId 主键id
     */
    public void setUcId(String ucId) {
        this.ucId = ucId;
    }

    /**
     * 获取车牌id
     *
     * @return v_id - 车牌id
     */
    public String getvId() {
        return vId;
    }

    /**
     * 设置车牌id
     *
     * @param vId 车牌id
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
     * 获取出车时间
     *
     * @return uc_ccsj - 出车时间
     */
    public String getUcCcsj() {
        return ucCcsj;
    }

    /**
     * 设置出车时间
     *
     * @param ucCcsj 出车时间
     */
    public void setUcCcsj(String ucCcsj) {
        this.ucCcsj = ucCcsj;
    }

    /**
     * 获取出车事由
     *
     * @return uc_ccsy - 出车事由
     */
    public String getUcCcsy() {
        return ucCcsy;
    }

    /**
     * 设置出车事由
     *
     * @param ucCcsy 出车事由
     */
    public void setUcCcsy(String ucCcsy) {
        this.ucCcsy = ucCcsy;
    }

    /**
     * 获取借用人id
     *
     * @return uc_jyrid - 借用人id
     */
    public String getUcJyrid() {
        return ucJyrid;
    }

    /**
     * 设置借用人id
     *
     * @param ucJyrid 借用人id
     */
    public void setUcJyrid(String ucJyrid) {
        this.ucJyrid = ucJyrid;
    }

    /**
     * 获取借用人
     *
     * @return uc_jyr - 借用人
     */
    public String getUcJyr() {
        return ucJyr;
    }

    /**
     * 设置借用人
     *
     * @param ucJyr 借用人
     */
    public void setUcJyr(String ucJyr) {
        this.ucJyr = ucJyr;
    }

    /**
     * 获取预计还车时间
     *
     * @return uc_yjhcsj - 预计还车时间
     */
    public String getUcYjhcsj() {
        return ucYjhcsj;
    }

    /**
     * 设置预计还车时间
     *
     * @param ucYjhcsj 预计还车时间
     */
    public void setUcYjhcsj(String ucYjhcsj) {
        this.ucYjhcsj = ucYjhcsj;
    }

    /**
     * 获取出车前里程数
     *
     * @return uc_cclcs - 出车前里程数
     */
    public Integer getUcCclcs() {
        return ucCclcs;
    }

    /**
     * 设置出车前里程数
     *
     * @param ucCclcs 出车前里程数
     */
    public void setUcCclcs(Integer ucCclcs) {
        this.ucCclcs = ucCclcs;
    }

    /**
     * 获取还车里程数
     *
     * @return un_hclcs - 还车里程数
     */
    public Integer getUnHclcs() {
        return unHclcs;
    }

    /**
     * 设置还车里程数
     *
     * @param unHclcs 还车里程数
     */
    public void setUnHclcs(Integer unHclcs) {
        this.unHclcs = unHclcs;
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

    /**
     * 获取备注
     *
     * @return uc_bz - 备注
     */
    public String getUcBz() {
        return ucBz;
    }

    /**
     * 设置备注
     *
     * @param ucBz 备注
     */
    public void setUcBz(String ucBz) {
        this.ucBz = ucBz;
    }

    public enum InnerColumn {
        ucId("uc_id"),
        vId("v_id"),
        vHphm("v_hphm"),
        ucCcsj("uc_ccsj"),
        ucCcsy("uc_ccsy"),
        ucJyrid("uc_jyrid"),
        ucJyr("uc_jyr"),
        ucYjhcsj("uc_yjhcsj"),
        ucCclcs("uc_cclcs"),
        unHclcs("un_hclcs"),
        createUser("create_user"),
        createTime("create_time"),
        updateUser("update_user"),
        updateTime("update_time"),
        ucBz("uc_bz");

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
