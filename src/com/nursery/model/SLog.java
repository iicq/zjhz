package com.nursery.model;

import java.io.Serializable;

public class SLog implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 
     */
    private Long setTime;

    /**
     * 
     */
    private String adminId;

    /**
     * 日志分类
     * 0 系统内容、日志
     * 1 自定义内容
     * 2 媒体 21 媒体添加 22 媒体修改 23 媒体删除 24 媒体动态记录
     * 3 客户 31 客户添加 32 客户修改 33 客户删除 34 客户动态记录 35 客户转移
     * 4 合同 41 合同添加 42 合同修改 43 合同删除 44 合同资金动态 45 合同续约
     * 5 方案 51 方案添加 52 方案修改 53 方案删除
     * 6 媒体图片 61 媒体图片添加 62 媒体图片删除 63 媒体图片设置为主图 64 媒体图片相关信息修改
     * 7 总装喷绘 71 喷绘添加 72 喷绘修改 73 喷绘删除
     */
    private Integer type;
    
    /**
     * 关联的对象的id 媒体的话是编号
     */
    private String textId;
    
    /**
     * 
     */
    private String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getSetTime() {
        return setTime;
    }

    public void setSetTime(Long setTime) {
        this.setTime = setTime;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTextId() {
		return textId;
	}

	public void setTextId(String textId) {
		this.textId = textId;
	}
    
    
}