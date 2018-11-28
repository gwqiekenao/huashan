package cn.pms.pojo;

public class Userandrole {
    private Integer id;

    private Integer userId;

    private Integer roleId;

    @Override
	public String toString() {
		return "Userandrole [id=" + id + ", userId=" + userId + ", roleId=" + roleId + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}