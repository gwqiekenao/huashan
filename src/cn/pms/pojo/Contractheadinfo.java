package cn.pms.pojo;

import java.util.Date;

public class Contractheadinfo {
    private Integer id;

    private Integer tenderingHeadInfoId;

    private String contractCode;

    private String contractName;

    private String contractType;
    
    private Integer supplierId;

	private String companyName;

    private Double contractMoney;

    private String moneyType;

    private Date startTime;

    private Date endTime;

    private Integer userId;

    private String createUser;

    private Date createTime;

    private Integer isFlag;
    
    private Supplier supplier;//附加对象,供应商对象
    private Tenderingheadinfo tenderingheadinfo;//附加对象,招标头表对象
    private Fast fast;//附加对象,快编码对象..加错了

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

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

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode == null ? null : contractCode.trim();
    }

    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName == null ? null : contractName.trim();
    }

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType == null ? null : contractType.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public Double getContractMoney() {
        return contractMoney;
    }

    public void setContractMoney(Double contractMoney) {
        this.contractMoney = contractMoney;
    }

    public String getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(String moneyType) {
        this.moneyType = moneyType == null ? null : moneyType.trim();
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public Tenderingheadinfo getTenderingheadinfo() {
		return tenderingheadinfo;
	}

	public void setTenderingheadinfo(Tenderingheadinfo tenderingheadinfo) {
		this.tenderingheadinfo = tenderingheadinfo;
	}

	public Fast getFast() {
		return fast;
	}

	public void setFast(Fast fast) {
		this.fast = fast;
	}
    
}