package com.cwb.platform.biz.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import javax.persistence.*;

@Getter
@Setter
@Table(name = "biz_stock_log")
public class BizStockLog implements Serializable {
    /**
     * id
     */
    @Id
    private String id;

    /**
     * 库存id
     */
    @Column(name = "stock_id")
    private String stockId;

    /**
     * 更新之前数量
     */
    @Column(name = "before_update")
    private Integer beforeUpdate;

    /**
     * 更新之后数量
     */
    @Column(name = "after_update")
    private Integer afterUpdate;

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
     * 备注
     */
    private String remark;

    /**
     * 商品名称
     */
    @Column(name = "product_name")
    private String productName;

    /**
     * 商品编码
     */
    @Column(name = "product_code")
    private String productCode;

    /**
     * 操作类型
     */
    @Column(name = "type")
    private String type;

    private static final long serialVersionUID = 1L;


    public enum InnerColumn {
        id("id"),
        stockId("stock_id"),
        beforeUpdate("before_update"),
        afterUpdate("after_update"),
        createTime("create_time"),
        createUser("create_user"),
        type("type"),
        remark("remark"),
        productName("product_name"),
        productCode("product_code");

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
