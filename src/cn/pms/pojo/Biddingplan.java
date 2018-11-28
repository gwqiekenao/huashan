package cn.pms.pojo;

import java.util.Date;

public class Biddingplan {
    private Integer id;

    private Integer tenderingHeadInfoId;

    private String biddingName;

    private String methods;

    private String createUser;

    private Date createTime;

    private Integer isFlag;

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
        this.biddingName = biddingName == null ? null : biddingName.trim();
    }

    public String getMethods() {
        return methods;
    }

    public void setMethods(String methods) {
        this.methods = methods == null ? null : methods.trim();
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