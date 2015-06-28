package com.nursery.model.jsp;

import java.util.List;

import com.nursery.model.Power;

public class PowerVO extends Power{

	private String parentName ;
	
	private List<PowerVO> list;
	
	

	public List<PowerVO> getList() {
		return list;
	}

	public void setList(List<PowerVO> list) {
		this.list = list;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}


	
	
}
