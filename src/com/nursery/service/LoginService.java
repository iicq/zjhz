package com.nursery.service;

import java.util.List;

import com.nursery.model.Account;
import com.nursery.model.Role;
import com.nursery.model.jsp.PowerVO;

public interface LoginService {

	/**
	 * 验证登陆
	 * @param username
	 * @param password
	 * @param ip 
	 * @return
	 */
	Account login(String username,String password, String ip);
	
	/**
	 * 获取权限
	 * @param userId
	 * @return
	 */
	List<PowerVO> getPower(String userId);
	
	/**
	 * 获取用户角色
	 * @param userId
	 * @return
	 */
	List<Role> getRole(String userId);

}
