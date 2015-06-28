package com.nursery.model;

public class Remind {
	private String id;
	private String loanManagerId;
	private String remindDate;
	private String userId;
	//------------------------------get and set--------------------------------
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLoanManagerId() {
		return loanManagerId;
	}
	public void setLoanManagerId(String loanManagerId) {
		this.loanManagerId = loanManagerId;
	}
	public String getRemindDate() {
		return remindDate;
	}
	public void setRemindDate(String remindDate) {
		this.remindDate = remindDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
