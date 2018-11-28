package cn.pms.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BiddingPlanCustom {
	
	private Integer id;

    private Integer tenderingHeadInfoId;

    private String biddingName;

    private String methods;

    private String createUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;

    private Integer isFlag;
    
    private String tenderingCode;
    
    private String tenderingName;
    
    private Double estimateMoeny;

    private Date startTime;

    private Date endTime;

    private String remark;
    
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTenderingHeadInfoId() {
		return tenderingHeadInfoId;
	}

	public void setTenderingHeadInfoId(Integer tenderingHeadInfoId) {
		this.tenderingHeadInfoId = tenderingHeadInfoId;
	}

	public String getBiddingName() {
		return biddingName;
	}

	public void setBiddingName(String biddingName) {
		this.biddingName = biddingName;
	}

	public String getMethods() {
		return methods;
	}

	public void setMethods(String methods) {
		this.methods = methods;
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

	public String getTenderingCode() {
		return tenderingCode;
	}

	public void setTenderingCode(String tenderingCode) {
		this.tenderingCode = tenderingCode;
	}

	public String getTenderingName() {
		return tenderingName;
	}

	public void setTenderingName(String tenderingName) {
		this.tenderingName = tenderingName;
	}

	public Double getEstimateMoeny() {
		return estimateMoeny;
	}

	public void setEstimateMoeny(Double estimateMoeny) {
		this.estimateMoeny = estimateMoeny;
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
		this.remark = remark;
	}

}
