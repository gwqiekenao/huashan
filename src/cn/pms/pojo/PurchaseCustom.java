package cn.pms.pojo;

import java.util.Date;

public class PurchaseCustom {
	
	@Override
	public String toString() {
		return "PurchaseCustom [purchaseCode=" + purchaseCode + ", purchaseName=" + purchaseName + ", purchaseType="
				+ purchaseType + ", projectName=" + projectName + ", eachPageNum=" + eachPageNum + ", nowPageNum="
				+ nowPageNum + "]";
	}

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
	
    private String projectCode;

    private String projectName;
	
    private Integer eachPageNum;
    
    private Integer nowPageNum;
    
    private Integer dataNum;
    
    private Integer pageData; 
    
    private Integer endPageData;
    
    private Integer pageCount;

	public Integer getDataNum() {
		return dataNum;
	}

	public void setDataNum(Integer dataNum) {
		this.dataNum = dataNum;
	}

	public Integer getPageData() {
		return pageData;
	}

	public void setPageData(Integer pageData) {
		this.pageData = pageData;
	}

	public Integer getEndPageData() {
		return endPageData;
	}

	public void setEndPageData(Integer endPageData) {
		this.endPageData = endPageData;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
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
		this.purchaseCode = purchaseCode;
	}

	public String getPurchaseName() {
		return purchaseName;
	}

	public void setPurchaseName(String purchaseName) {
		this.purchaseName = purchaseName;
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
		this.moneyType = moneyType;
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
		this.purchaseType = purchaseType;
	}

	public String getPurchaseRemark() {
		return purchaseRemark;
	}

	public void setPurchaseRemark(String purchaseRemark) {
		this.purchaseRemark = purchaseRemark;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
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

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getEachPageNum() {
		return eachPageNum;
	}

	public void setEachPageNum(Integer eachPageNum) {
		this.eachPageNum = eachPageNum;
	}

	public Integer getNowPageNum() {
		return nowPageNum;
	}

	public void setNowPageNum(Integer nowPageNum) {
		this.nowPageNum = nowPageNum;
	}
    
    
}
