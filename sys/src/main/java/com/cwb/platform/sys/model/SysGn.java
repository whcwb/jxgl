package com.cwb.platform.sys.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

@Table(name = "SYS_FWGN")
public class SysGn implements Serializable {
    @Id
    @Column(name = "GNDM")
    private String gndm;

    @Column(name = "GNMC")
    private String gnmc;

    @Column(name = "FWDM")
    private String fwdm;
    /**
     * 创建时间
     */
    @Column(name = "CJSJ")
    private String cjsj;
    /**
     * 创建人
     */
    @Column(name = "CJR")
    private String cjr;

    /**
     * 修改时间
     */
    @Column(name = "XGSJ")
    private String xgsj;

    /**
     * 修改人
     */
    @Column(name = "XGR")
    private String xgr;

    @Column(name = "ZT")
    private String zt;
    /**
     * 备注
     */
    @Column(name = "BZ")
    private String bz;

    @Column(name = "URL")
    private String url;
    /**
     * 父节点
     */
    @Column(name = "FJD")
    private String fjd;

    @Column(name = "TZDZ")
    private String tzdz;
    /**
     * 图标
     */
    @Column(name = "TB")
    private String tb;

    @Column(name = "API_QZ")
    private String apiQz;

    @Column(name = "API_HZ")
    private String apiHz;

    @Column(name = "PX")
    private Float px;

    @Transient
    private String title;

    @Transient
    private String checked;

    @Transient
    private List<SysGn> children;

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public List<SysGn> getChildren() {
        return children;
    }

    public void setChildren(List<SysGn> children) {
        this.children = children;
    }

    private static final long serialVersionUID = 1L;

    public Float getPx() {
        return px;
    }

    public void setPx(Float px) {
        this.px = px;
    }

    public String getTitle() {
        return gnmc;
    }

    /**
     * @return GNDM
     */
    public String getGndm() {
        return gndm;
    }

    /**
     * @param gndm
     */
    public void setGndm(String gndm) {
        this.gndm = gndm;
    }

    /**
     * @return GNMC
     */
    public String getGnmc() {
        return gnmc;
    }

    /**
     * @param gnmc
     */
    public void setGnmc(String gnmc) {
        this.gnmc = gnmc;
    }

    /**
     * @return FWDM
     */
    public String getFwdm() {
        return fwdm;
    }

    /**
     * @param fwdm
     */
    public void setFwdm(String fwdm) {
        this.fwdm = fwdm;
    }

    /**
     * @return CJSJ
     */
    public String getCjsj() {
        return cjsj;
    }

    /**
     * @param cjsj
     */
    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    /**
     * @return CJR
     */
    public String getCjr() {
        return cjr;
    }

    /**
     * @param cjr
     */
    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    /**
     * @return XGSJ
     */
    public String getXgsj() {
        return xgsj;
    }

    /**
     * @param xgsj
     */
    public void setXgsj(String xgsj) {
        this.xgsj = xgsj;
    }

    /**
     * @return XGR
     */
    public String getXgr() {
        return xgr;
    }

    /**
     * @param xgr
     */
    public void setXgr(String xgr) {
        this.xgr = xgr;
    }

    /**
     * @return ZT
     */
    public String getZt() {
        return zt;
    }

    /**
     * @param zt
     */
    public void setZt(String zt) {
        this.zt = zt;
    }

    /**
     * @return BZ
     */
    public String getBz() {
        return bz;
    }

    /**
     * @param bz
     */
    public void setBz(String bz) {
        this.bz = bz;
    }

    /**
     * @return URL
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return FJD
     */
    public String getFjd() {
        return fjd;
    }

    /**
     * @param fjd
     */
    public void setFjd(String fjd) {
        this.fjd = fjd;
    }

    /**
     * @return TZDZ
     */
    public String getTzdz() {
        return tzdz;
    }

    /**
     * @param tzdz
     */
    public void setTzdz(String tzdz) {
        this.tzdz = tzdz;
    }

    /**
     * @return TB
     */
    public String getTb() {
        return tb;
    }

    /**
     * @param tb
     */
    public void setTb(String tb) {
        this.tb = tb;
    }

    /**
     * @return API_QZ
     */
    public String getApiQz() {
        return apiQz;
    }

    /**
     * @param apiQz
     */
    public void setApiQz(String apiQz) {
        this.apiQz = apiQz;
    }

    /**
     * @return API_HZ
     */
    public String getApiHz() {
        return apiHz;
    }

    /**
     * @param apiHz
     */
    public void setApiHz(String apiHz) {
        this.apiHz = apiHz;
    }

    public enum InnerColumn {
        gndm("GNDM"),
        gnmc("GNMC"),
        fwdm("FWDM"),
        cjsj("CJSJ"),
        cjr("CJR"),
        xgsj("XGSJ"),
        xgr("XGR"),
        zt("ZT"),
        bz("BZ"),
        url("URL"),
        fjd("FJD"),
        tzdz("TZDZ"),
        tb("TB"),
        apiQz("API_QZ"),
        apiHz("API_HZ");

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
