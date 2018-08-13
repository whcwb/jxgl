package com.cwb.platform.biz.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import javax.persistence.*;

@Getter
@Setter
@Table(name = "biz_stock")
public class BizStock implements Serializable {
    /**
     * id
     */
    @Id
    private String id;

    /**
     * 商品编码
     */
    @Column(name = "product_code")
    private String productCode;

    /**
     * 商品名称
     */
    @Column(name = "product_name")
    private String productName;

    /**
     * 剩余数量
     */
    private Integer number;

    /**
     * 存放位置
     */
    private String position;

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
     * 修改时间
     */
    @Column(name = "update_time")
    private String updateTime;

    /**
     * 修改人
     */
    @Column(name = "update_user")
    private String updateUser;

    @Transient
    private String remark;


    public enum InnerColumn {
        id("id"),
        productCode("product_code"),
        productName("product_name"),
        count("count"),
        position("position"),
        createTime("create_time"),
        createUser("create_user"),
        updateTime("update_time"),
        updateUser("update_user");

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
