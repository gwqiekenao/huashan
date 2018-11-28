package cn.pms.pojo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Project {
    private Integer id;

    private String projectCode;

    private String projectName;

    private String projectType;

    private String moneyType;

    private Double contractMoney;

    private Double estimateMoney;

    private Double materialMoney;

    private String projectManager;

    private String managerTel;

    private String managerIdCard;

    private String projectAddress;

    private String projectInfo;

    private String createUser;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;

    private Integer isFlag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode == null ? null : projectCode.trim();
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType == null ? null : projectType.trim();
    }

    public String getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(String moneyType) {
        this.moneyType = moneyType == null ? null : moneyType.trim();
    }

    public Double getContractMoney() {
        return contractMoney;
    }

    public void setContractMoney(Double contractMoney) {
        this.contractMoney = contractMoney;
    }

    public Double getEstimateMoney() {
        return estimateMoney;
    }

    public void setEstimateMoney(Double estimateMoney) {
        this.estimateMoney = estimateMoney;
    }

    public Double getMaterialMoney() {
        return materialMoney;
    }

    public void setMaterialMoney(Double materialMoney) {
        this.materialMoney = materialMoney;
    }

    public String getProjectManager() {
        return projectManager;
    }

    public void setProjectManager(String projectManager) {
        this.projectManager = projectManager == null ? null : projectManager.trim();
    }

    public String getManagerTel() {
        return managerTel;
    }

    public void setManagerTel(String managerTel) {
        this.managerTel = managerTel == null ? null : managerTel.trim();
    }

    public String getManagerIdCard() {
        return managerIdCard;
    }

    public void setManagerIdCard(String managerIdCard) {
        this.managerIdCard = managerIdCard == null ? null : managerIdCard.trim();
    }

    public String getProjectAddress() {
        return projectAddress;
    }

    public void setProjectAddress(String projectAddress) {
        this.projectAddress = projectAddress == null ? null : projectAddress.trim();
    }

    public String getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(String projectInfo) {
        this.projectInfo = projectInfo == null ? null : projectInfo.trim();
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