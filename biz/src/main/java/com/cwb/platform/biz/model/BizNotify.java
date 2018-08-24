package com.cwb.platform.biz.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "biz_notify")
public class BizNotify implements Serializable {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String id;

    /**
     * 类型
     */
    private String type;

    /**
     * 通知时间
     */
    private String time;

    /**
     * 内容
     */
    private String content;

    /**
     * 车辆id
     */
    @Column(name = "cl_id")
    private String clId;

    /**
     * 车牌号
     */
    private String cph;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private String createTime;

    /**
     * 创建人
     */
    @Column(name = "create_user")
    private String createUser;
    /**
     * 通知人姓名
     */
    @Column(name = "to_user_name")
    private String toUserName;
    /**
     * 通知人电话
     */
    @Column(name = "to_user_phone")
    private String toUserPhone;
    /**
     * 下次通知时间
     */
    @Column(name = "next_notify_time")
    private String nextNotifyTime;
    /**
     * 通知方式
     */
    @Column(name = "method")
    private String method;

    @Transient
    private String nextNotifyContent;

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getNextNotifyContent() {
        return nextNotifyContent;
    }

    public void setNextNotifyContent(String nextNotifyContent) {
        this.nextNotifyContent = nextNotifyContent;
    }

    private static final long serialVersionUID = 1L;

    public String getNextNotifyTime() {
        return nextNotifyTime;
    }

    public void setNextNotifyTime(String nextNotifyTime) {
        this.nextNotifyTime = nextNotifyTime;
    }

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public String getToUserPhone() {
        return toUserPhone;
    }

    public void setToUserPhone(String toUserPhone) {
        this.toUserPhone = toUserPhone;
    }

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取类型
     *
     * @return type - 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置类型
     *
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取通知时间
     *
     * @return time - 通知时间
     */
    public String getTime() {
        return time;
    }

    /**
     * 设置通知时间
     *
     * @param time 通知时间
     */
    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取内容
     *
     * @return content - 内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置内容
     *
     * @param content 内容
     */
    public void setContent(String content) {
        this.content = content;
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

    public enum InnerColumn {
        id("id"),
        type("type"),
        time("time"),
        content("content"),
        clId("cl_id"),
        cph("cph"),
        method("method"),
        createTime("create_time"),
        createUser("create_user");

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
