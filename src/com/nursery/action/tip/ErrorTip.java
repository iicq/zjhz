package com.nursery.action.tip;

public class ErrorTip implements Tip {
    private boolean success;
    private int code;
    private Object data;//返回的数据
    
    public ErrorTip(int code) {
        super();
        this.success = false;
        this.code = code;
    }

    public boolean isSuccess() {
        return success;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
    
}
