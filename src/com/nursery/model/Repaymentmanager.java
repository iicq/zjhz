package com.nursery.model;

public class Repaymentmanager {
	private String id;
	private String repaymentAmount;
	private String repaymentDate;
	private String loanManagerId;
	private String branchId;
	private String userId;
	//------------------------------------get and set----------------------------
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRepaymentAmount() {
		return repaymentAmount;
	}
	public void setRepaymentAmount(String repaymentAmount) {
		this.repaymentAmount = repaymentAmount;
	}
	public String getRepaymentDate() {
		return repaymentDate;
	}
	public void setRepaymentDate(String repaymentDate) {
		this.repaymentDate = repaymentDate;
	}
	public String getLoanManagerId() {
		return loanManagerId;
	}
	public void setLoanManagerId(String loanManagerId) {
		this.loanManagerId = loanManagerId;
	}
	public String getBranchId() {
		return branchId;
	}
	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
