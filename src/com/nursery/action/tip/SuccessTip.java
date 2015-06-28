package com.nursery.action.tip;

public class SuccessTip implements Tip {
    private boolean success;
    private Object data;//成功时回传的数据
    
    public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public SuccessTip() {
        super();
        this.success = true;
    }

    public boolean isSuccess() {
        return success;
    }

}
