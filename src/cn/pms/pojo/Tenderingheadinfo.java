package cn.pms.pojo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Tenderingheadinfo {
    private Integer id;

    private String tenderingCode;

    private Integer purchaseId;

    private String tenderingType;

    private String tenderingName;

    private Double planMoney;

    private Double estimateMoeny;

    private String moneyType;

    private Date buyStart;

    private Date buyEnd;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startTime;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endTime;

    private String remark;

    private String createUser;
    
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private Integer isFlag;
    
    private String purchaseType;
    
    private List<Tenderingplan> tenderingplanList;//附加对象,招标行表

    public String getPurchaseType() {
		return purchaseType;
	}

	public void setPurchaseType(String purchaseType) {
		this.purchaseType = purchaseType == null ? null : purchaseType.trim();
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenderingCode() {
        return tenderingCode;
    }

    public void setTenderingCode(String tenderingCode) {
        this.tenderingCode = tenderingCode == null ? null : tenderingCode.trim();
    }

    public Integer getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Integer purchaseId) {
        this.purchaseId = purchaseId;
    }

    public String getTenderingType() {
        return tenderingType;
    }

    public void setTenderingType(String tenderingType) {
        this.tenderingType = tenderingType == null ? null : tenderingType.trim();
    }

    public String getTenderingName() {
        return tenderingName;
    }

    public void setTenderingName(String tenderingName) {
        this.tenderingName = tenderingName == null ? null : tenderingName.trim();
    }

    public Double getPlanMoney() {
        return planMoney;
    }

    public void setPlanMoney(Double planMoney) {
        this.planMoney = planMoney;
    }

    public Double getEstimateMoeny() {
        return estimateMoeny;
    }

    public void setEstimateMoeny(Double estimateMoeny) {
        this.estimateMoeny = estimateMoeny;
    }

    public String getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(String moneyType) {
        this.moneyType = moneyType == null ? null : moneyType.trim();
    }

    public Date getBuyStart() {
        return buyStart;
    }

    public void setBuyStart(Date buyStart) {
        this.buyStart = buyStart;
    }

    public Date getBuyEnd() {
        return buyEnd;
    }

    public void setBuyEnd(Date buyEnd) {
        this.buyEnd = buyEnd;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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

	public List<Tenderingplan> getTenderingplanList() {
		return tenderingplanList;
	}

	public void setTenderingplanList(List<Tenderingplan> tenderingplanList) {
		this.tenderingplanList = tenderingplanList;
	}
    
}