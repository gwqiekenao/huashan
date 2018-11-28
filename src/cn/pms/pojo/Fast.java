package cn.pms.pojo;

import java.io.Serializable;
import java.util.Date;

public class Fast implements Serializable {
    
	 

	@Override
	public String toString() {
		return "Fast [id=" + id + ", fastType=" + fastType + ", code=" + code + ", codeName=" + codeName
				+ ", fastTypeName=" + fastTypeName + ", createUser=" + createUser + ", createTime=" + createTime
				+ ", isFlag=" + isFlag + "]";
	}

	private Integer id;

    private String fastType;

    private String code;

    private String codeName;

    private String fastTypeName;
    
    private String createUser;
    
    private Date createTime;

    private Integer isFlag;
    
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

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFastType() {
        return fastType;
    }

    public void setFastType(String fastType) {
        this.fastType = fastType == null ? null : fastType.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName == null ? null : codeName.trim();
    }

    public String getFastTypeName() {
        return fastTypeName;
    }

    public void setFastTypeName(String fastTypeName) {
        this.fastTypeName = fastTypeName == null ? null : fastTypeName.trim();
    }
}