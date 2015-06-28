package com.nursery.model;

public class Reissuestockcard {
	private String id;
	private String stockNumber;
	private String rateType;
	private String operateDate;
	private String oldVoucherUseNum;
	private String newVoucherUseNum;
	private String userId;
	//--------------------------get and set-------------------------
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStockNumber() {
		return stockNumber;
	}
	public void setStockNumber(String stockNumber) {
		this.stockNumber = stockNumber;
	}
	public String getRateType() {
		return rateType;
	}
	public void setRateType(String rateType) {
		this.rateType = rateType;
	}
	public String getOperateDate() {
		return operateDate;
	}
	public void setOperateDate(String operateDate) {
		this.operateDate = operateDate;
	}
	public String getOldVoucherUseNum() {
		return oldVoucherUseNum;
	}
	public void setOldVoucherUseNum(String oldVoucherUseNum) {
		this.oldVoucherUseNum = oldVoucherUseNum;
	}
	public String getNewVoucherUseNum() {
		return newVoucherUseNum;
	}
	public void setNewVoucherUseNum(String newVoucherUseNum) {
		this.newVoucherUseNum = newVoucherUseNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
