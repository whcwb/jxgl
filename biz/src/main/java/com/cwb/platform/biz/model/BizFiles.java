package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_files")
public class BizFiles implements Serializable {
    /**
     * 主键ID
     */
    @Id
    @Column(name = "vf_id")
    @GeneratedValue(generator = "JDBC")
    private String vfId;

    /**
     * 主体ID
     */
    @Column(name = "p_id")
    private String pId;

    /**
     * 主体类型。10：人员；20：车辆；30：保险；40：违法
     */
    @Column(name = "p_ztlx")
    private String pZtlx;

    /**
     * 档案类型
     */
    @Column(name = "vf_dalx")
    private String vfDalx;

    /**
     * 档案名称
     */
    @Column(name = "vf_damc")
    private String vfDamc;

    /**
     * 档案本地存储路径
     */
    @Column(name = "vf_loc_path")
    private String vfLocPath;

    /**
     * 档案网络路径
     */
    @Column(name = "vf_net_path")
    private String vfNetPath;

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
     * 获取主键ID
     *
     * @return vf_id - 主键ID
     */
    public String getVfId() {
        return vfId;
    }

    /**
     * 设置主键ID
     *
     * @param vfId 主键ID
     */
    public void setVfId(String vfId) {
        this.vfId = vfId;
    }

    /**
     * 获取主体ID
     *
     * @return p_id - 主体ID
     */
    public String getpId() {
        return pId;
    }

    /**
     * 设置主体ID
     *
     * @param pId 主体ID
     */
    public void setpId(String pId) {
        this.pId = pId;
    }

    /**
     * 获取主体类型。10：人员；20：车辆；30：保险；40：违法
     *
     * @return p_ztlx - 主体类型。10：人员；20：车辆；30：保险；40：违法
     */
    public String getpZtlx() {
        return pZtlx;
    }

    /**
     * 设置主体类型。10：人员；20：车辆；30：保险；40：违法
     *
     * @param pZtlx 主体类型。10：人员；20：车辆；30：保险；40：违法
     */
    public void setpZtlx(String pZtlx) {
        this.pZtlx = pZtlx;
    }

    /**
     * 获取档案类型
     *
     * @return vf_dalx - 档案类型
     */
    public String getVfDalx() {
        return vfDalx;
    }

    /**
     * 设置档案类型
     *
     * @param vfDalx 档案类型
     */
    public void setVfDalx(String vfDalx) {
        this.vfDalx = vfDalx;
    }

    /**
     * 获取档案名称
     *
     * @return vf_damc - 档案名称
     */
    public String getVfDamc() {
        return vfDamc;
    }

    /**
     * 设置档案名称
     *
     * @param vfDamc 档案名称
     */
    public void setVfDamc(String vfDamc) {
        this.vfDamc = vfDamc;
    }

    /**
     * 获取档案本地存储路径
     *
     * @return vf_loc_path - 档案本地存储路径
     */
    public String getVfLocPath() {
        return vfLocPath;
    }

    /**
     * 设置档案本地存储路径
     *
     * @param vfLocPath 档案本地存储路径
     */
    public void setVfLocPath(String vfLocPath) {
        this.vfLocPath = vfLocPath;
    }

    /**
     * 获取档案网络路径
     *
     * @return vf_net_path - 档案网络路径
     */
    public String getVfNetPath() {
        return vfNetPath;
    }

    /**
     * 设置档案网络路径
     *
     * @param vfNetPath 档案网络路径
     */
    public void setVfNetPath(String vfNetPath) {
        this.vfNetPath = vfNetPath;
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
        vfId("vf_id"),
        pId("p_id"),
        pZtlx("p_ztlx"),
        vfDalx("vf_dalx"),
        vfDamc("vf_damc"),
        vfLocPath("vf_loc_path"),
        vfNetPath("vf_net_path"),
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