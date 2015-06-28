package com.nursery.model;

import java.io.Serializable;
import java.util.Date;

public class Account implements Serializable {

    private String id;								//id
    private String username;					//用户名
    private String password;					//密码
    private Long setTime;							//建立时间
    private Long lastTime;						//最后一次登陆时间
    private Integer count;						//总计登陆次数
    private Integer power;						//身份权限 0，客户，1，管理员 2 员工 -1 不需登录
    private String textId;						//身份详细信息
    private String lastIp;							//最后一次登陆的IP
    
    
    public String getTextId() {
		return textId;
	}

	public void setTextId(String textId) {
		this.textId = textId;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getSetTime() {
		return setTime;
	}

	public void setSetTime(Long setTime) {
		this.setTime = setTime;
	}

	public Long getLastTime() {
		return lastTime;
	}

	public void setLastTime(Long lastTime) {
		this.lastTime = lastTime;
	}

	public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}
    
}