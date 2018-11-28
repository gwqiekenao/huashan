package cn.pms.pojo;

import java.util.Date;
import java.util.List;

public class Purchaseheadinfo {
    private Integer id;

    private String purchaseCode;

    private String purchaseName;

    private Integer projectId;

    private String moneyType;

    private Double estimateMoney;

    private String purchaseType;

    private String purchaseRemark;

    private String createUser;

    private Date createTime;

    private Integer isFlag;
    
    private List<Purchaseplan> purchaseplanList;//附加对象,采购行表(一对多)
    
    private Project projects;//附加对象,项目表  

	public List<Purchaseplan> getPurchaseplanList() {
		return purchaseplanList;
	}

	public void setPurchaseplanList(List<Purchaseplan> purchaseplanList) {
		this.purchaseplanList = purchaseplanList;
	}



	public Project getProjects() {
		return projects;
	}

	public void setProjects(Project projects) {
		this.projects = projects;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPurchaseCode() {
        return purchaseCode;
    }

    public void setPurchaseCode(String purchaseCode) {
        this.purchaseCode = purchaseCode == null ? null : purchaseCode.trim();
    }

    public String getPurchaseName() {
        return purchaseName;
    }

    public void setPurchaseName(String purchaseName) {
        this.purchaseName = purchaseName == null ? null : purchaseName.trim();
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(String moneyType) {
        this.moneyType = moneyType == null ? null : moneyType.trim();
    }

    public Double getEstimateMoney() {
        return estimateMoney;
    }

    public void setEstimateMoney(Double estimateMoney) {
        this.estimateMoney = estimateMoney;
    }

    public String getPurchaseType() {
        return purchaseType;
    }

    public void setPurchaseType(String purchaseType) {
        this.purchaseType = purchaseType == null ? null : purchaseType.trim();
    }

    public String getPurchaseRemark() {
        return purchaseRemark;
    }

    public void setPurchaseRemark(String purchaseRemark) {
        this.purchaseRemark = purchaseRemark == null ? null : purchaseRemark.trim();
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