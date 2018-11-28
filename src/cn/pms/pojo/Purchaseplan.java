package cn.pms.pojo;

import java.util.Date;

public class Purchaseplan {
    private Integer id;

    private Integer materialId;

    private Integer demandNum;
    
    private Integer useNumber;

    private Double estimateMoney;

    private String provisioning;

    private String purchaseMethod;

    private String purchaseCompany;

    private String address;

    private String remark;

    private Integer purchaseId;

    private String createUser;

    private Date createTime;

    private Integer isFlag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public Integer getDemandNum() {
        return demandNum;
    }

    public void setDemandNum(Integer demandNum) {
        this.demandNum = demandNum;
    }

    public Integer getUseNumber() {
		return useNumber;
	}

	public void setUseNumber(Integer useNumber) {
		this.useNumber = useNumber;
	}

	public Double getEstimateMoney() {
        return estimateMoney;
    }

    public void setEstimateMoney(Double estimateMoney) {
        this.estimateMoney = estimateMoney;
    }

    public String getProvisioning() {
        return provisioning;
    }

    public void setProvisioning(String provisioning) {
        this.provisioning = provisioning == null ? null : provisioning.trim();
    }

    public String getPurchaseMethod() {
        return purchaseMethod;
    }

    public void setPurchaseMethod(String purchaseMethod) {
        this.purchaseMethod = purchaseMethod == null ? null : purchaseMethod.trim();
    }

    public String getPurchaseCompany() {
        return purchaseCompany;
    }

    public void setPurchaseCompany(String purchaseCompany) {
        this.purchaseCompany = purchaseCompany == null ? null : purchaseCompany.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    
    public Integer getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
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