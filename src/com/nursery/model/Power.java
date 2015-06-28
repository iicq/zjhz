package com.nursery.model;

import java.io.Serializable;

public class Power implements Serializable {

    private String id;
    private String name;
    private String parentId;
    private String intro;
    private String url;					//权限url
    private String icon;				//权限图标
    private int menu;					//权限类型 0，操作权限（列表菜单下隐藏），1，菜单权限
    private int ord;						//权限排序

	public int getOrd() {
		return ord;
	}

	public void setOrd(int ord) {
		this.ord = ord;
	}

	public int getMenu() {
		return menu;
	}

	public void setMenu(int menu) {
		this.menu = menu;
	}

	public String getIcon() {
		return icon;
	}

	public Power setIcon(String icon) {
		this.icon = icon;
		return this;
	}

	public String getId() {
        return id;
    }

    public Power setId(String id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Power setName(String name) {
        this.name = name;
        return this;
    }

    public String getParentId() {
        return parentId;
    }

    public Power setParentId(String parentId) {
        this.parentId = parentId;
        return this;
    }

	public String getIntro() {
		return intro;
	}

	public Power setIntro(String intro) {
		this.intro = intro;
		return this;
	}

	public String getUrl() {
		return url;
	}

	public Power setUrl(String url) {
		this.url = url;
		return this;
	}
    
    
}