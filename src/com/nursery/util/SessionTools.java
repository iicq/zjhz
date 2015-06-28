package com.nursery.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.nursery.action.DefaultAction;
import com.nursery.model.Power;
import com.nursery.model.Role;
import com.nursery.model.jsp.PowerVO;
import com.nursery.service.LoginService;
import com.nursery.service.PowerService;

public class SessionTools extends DefaultAction{

	/**
	 * 判断角色是否拥有某权限
	 * @param powerId
	 * @return
	 */
	public boolean power(String powerId){
		List<Power> list = (List<Power>) getSession(ROLEPOWER);
		for(Power p : list){
			if(p.getId().equals(powerId)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 判断用户是否拥有某操作权限
	 * @param powerId 操作权限Id
	 * @return
	 */
	public boolean userPower(String powerId){
		List<Power> list = (List<Power>) getSession(MYPOWER);
		for(Power p : list){
			if(p.getId().equals(powerId)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 判断用户是否拥有某角色
	 * @param powerId
	 * @return
	 */
	public boolean role(String roleId){
		List<Role> list = (List<Role>) getSession(ADMINROLE);
		for(Role p : list){
			if(p.getId().equals(roleId)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 判断用户是不是超级管理员
	 * @return
	 */
	public boolean admin(){
		String root = getSession(ROOT).toString();
		if(root != null && root.equals(ROOT)){
			return true;
		}
		return false;
	}
	
	/**
	 * 将Long类型的时间转换成字符串
	 * @param time 时间
	 * @param format 格式 默认 yyyy-MM-dd
	 * @return
	 */
	public String showTime(Long time,String format){
		Date date = new Date(time);
		SimpleDateFormat fm = new SimpleDateFormat(format);
		return fm.format(date);
	}
	
	/**
	 * 判断是否有档期
	 * @param time
	 * @return
	 */
	public boolean havaDangqi(Long time){
		Date date = new Date();
		if(time > date.getTime()){
			return true;
		}else{
			return false;
		}
	}
	
	
	
	@Resource
	private PowerService powerService;
	
	@Resource
	private LoginService loginService;
	
}
