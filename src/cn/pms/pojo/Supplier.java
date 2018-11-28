package cn.pms.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Supplier {
    private Integer id;

    private String supplierCode;

    private String supplieName;

    private String supplierType;

    private String license;

    private String organiztion;

    private String stateTax;

    private String landTax;

    private String createUser;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;

    private Integer isFlag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSupplierCode() {
        return supplierCode;
    }

    public void setSupplierCode(String supplierCode) {
        this.supplierCode = supplierCode == null ? null : supplierCode.trim();
    }

    public String getSupplieName() {
        return supplieName;
    }

    public void setSupplieName(String supplieName) {
        this.supplieName = supplieName == null ? null : supplieName.trim();
    }

    public String getSupplierType() {
        return supplierType;
    }

    public void setSupplierType(String supplierType) {
        this.supplierType = supplierType == null ? null : supplierType.trim();
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license == null ? null : license.trim();
    }

    public String getOrganiztion() {
        return organiztion;
    }

    public void setOrganiztion(String organiztion) {
        this.organiztion = organiztion == null ? null : organiztion.trim();
    }

    public String getStateTax() {
        return stateTax;
    }

    public void setStateTax(String stateTax) {
        this.stateTax = stateTax == null ? null : stateTax.trim();
    }

    public String getLandTax() {
        return landTax;
    }

    public void setLandTax(String landTax) {
        this.landTax = landTax == null ? null : landTax.trim();
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsFlag() {
        return isFlag;
    }

    public void setIsFlag(Integer isFlag) {
        this.isFlag = isFlag;
    }
}