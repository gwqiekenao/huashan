package cn.pms.pojo;

import java.util.Date;

public class Tenderingplan {
    private Integer id;

    private Integer tenderingNum;

    private Integer useNum;

    private Double estimateMoney;

    private String price;

    private String remark;

    private Integer purchasePlanId;

    private String createUser;

    private Date createTime;

    private Integer isFlag;
    
    private Integer tenderingHeadId;

    public Integer getTenderingHeadId() {
		return tenderingHeadId;
	}

	public void setTenderingHeadId(Integer tenderingHeadId) {
		this.tenderingHeadId = tenderingHeadId;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTenderingNum() {
        return tenderingNum;
    }

    public void setTenderingNum(Integer tenderingNum) {
        this.tenderingNum = tenderingNum;
    }

    public Integer getUseNum() {
        return useNum;
    }

    public void setUseNum(Integer useNum) {
        this.useNum = useNum;
    }

    public Double getEstimateMoney() {
        return estimateMoney;
    }

    public void setEstimateMoney(Double estimateMoney) {
        this.estimateMoney = estimateMoney;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getPurchasePlanId() {
        return purchasePlanId;
    }

    public void setPurchasePlanId(Integer purchasePlanId) {
        this.purchasePlanId = purchasePlanId;
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