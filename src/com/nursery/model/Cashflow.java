package com.nursery.model;

public class Cashflow {
	private String id;
	private long operateDate;
	private Double money;
	private String receiveEmployeeId;
	private String userId;
	private String jkmj;
	private int flag;
	//-------------------------------------get and set---------------------------------------------
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReceiveEmployeeId() {
		return receiveEmployeeId;
	}
	public void setReceiveEmployeeId(String receiveEmployeeId) {
		this.receiveEmployeeId = receiveEmployeeId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getJkmj() {
		return jkmj;
	}
	public void setJkmj(String jkmj) {
		this.jkmj = jkmj;
	}
	public long getOperateDate() {
		return operateDate;
	}
	public void setOperateDate(long operateDate) {
		this.operateDate = operateDate;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}
