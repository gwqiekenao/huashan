package cn.pms.pojo;

import java.util.Date;

public class Role {
    

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", createTime=" + createTime + ", isFlag=" + isFlag + "]";
	}

	private Integer id;

    private String roleName;

    private Date createTime;

    private Integer isFlag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
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