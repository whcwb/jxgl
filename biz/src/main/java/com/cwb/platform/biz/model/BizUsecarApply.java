package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_usecar_apply")
public class BizUsecarApply implements Serializable {
    /**
     * id
     */
    @Id
    private String id;

    /**
     * 车牌号
     */
    private String cph;

    /**
     * 车辆id
     */
    @Column(name = "cl_id")
    private String clId;

    /**
     * 申请人id
     */
    @Column(name = "sqr_id")
    private String sqrId;

    /**
     * 申请原因
     */
    private String sqyy;

    /**
     * 申请时间
     */
    private String sqsj;

    /**
     * 申请人姓名
     */
    private String sqrxm;

    /**
     * 申请时间
     */
    @Column(name = "create_time")
    private String createTime;

    /**
     * 状态
     */
    private String zt;

    /**
     * 审核人
     */
    @Column(name = "shr_id")
    private String shrId;

    /**
     * 审核时间
     */
    private String shsj;

    /**
     * 驳回原因
     */
    private String bhyy;

    private static final long serialVersionUID = 1L;


    public String getShrId() {
        return shrId;
    }

    public void setShrId(String shrId) {
        this.shrId = shrId;
    }

    public String getSqsj() {
        return sqsj;
    }

    public void setSqsj(String sqsj) {
        this.sqsj = sqsj;
    }

    /**
     * 获取id
     *
     * @return id - id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取车牌号
     *
     * @return cph - 车牌号
     */
    public String getCph() {
        return cph;
    }

    /**
     * 设置车牌号
     *
     * @param cph 车牌号
     */
    public void setCph(String cph) {
        this.cph = cph;
    }

    /**
     * 获取车辆id
     *
     * @return cl_id - 车辆id
     */
    public String getClId() {
        return clId;
    }

    /**
     * 设置车辆id
     *
     * @param clId 车辆id
     */
    public void setClId(String clId) {
        this.clId = clId;
    }

    /**
     * 获取申请人id
     *
     * @return sqr_id - 申请人id
     */
    public String getSqrId() {
        return sqrId;
    }

    /**
     * 设置申请人id
     *
     * @param sqrId 申请人id
     */
    public void setSqrId(String sqrId) {
        this.sqrId = sqrId;
    }

    /**
     * 获取申请原因
     *
     * @return sqyy - 申请原因
     */
    public String getSqyy() {
        return sqyy;
    }

    /**
     * 设置申请原因
     *
     * @param sqyy 申请原因
     */
    public void setSqyy(String sqyy) {
        this.sqyy = sqyy;
    }

    /**
     * 获取申请人姓名
     *
     * @return sqrxm - 申请人姓名
     */
    public String getSqrxm() {
        return sqrxm;
    }

    /**
     * 设置申请人姓名
     *
     * @param sqrxm 申请人姓名
     */
    public void setSqrxm(String sqrxm) {
        this.sqrxm = sqrxm;
    }

    /**
     * 获取申请时间
     *
     * @return create_time - 申请时间
     */
    public String getCreateTime() {
        return createTime;
    }

    /**
     * 设置申请时间
     *
     * @param createTime 申请时间
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取状态
     *
     * @return zt - 状态
     */
    public String getZt() {
        return zt;
    }

    /**
     * 设置状态
     *
     * @param zt 状态
     */
    public void setZt(String zt) {
        this.zt = zt;
    }

    /**
     * 获取审核时间
     *
     * @return shsj - 审核时间
     */
    public String getShsj() {
        return shsj;
    }

    /**
     * 设置审核时间
     *
     * @param shsj 审核时间
     */
    public void setShsj(String shsj) {
        this.shsj = shsj;
    }

    /**
     * 获取驳回原因
     *
     * @return bhyy - 驳回原因
     */
    public String getBhyy() {
        return bhyy;
    }

    /**
     * 设置驳回原因
     *
     * @param bhyy 驳回原因
     */
    public void setBhyy(String bhyy) {
        this.bhyy = bhyy;
    }

    public enum InnerColumn {
        id("id"),
        cph("cph"),
        clId("cl_id"),
        sqrId("sqr_id"),
        sqyy("sqyy"),
        sqrxm("sqrxm"),
        createTime("create_time"),
        zt("zt"),
        shrId("shr_id"),
        shsj("shsj"),
        bhyy("bhyy");

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
