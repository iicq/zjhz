package com.nursery.service;

import com.nursery.model.Account;

public interface AccountService {

	/**
	 * 根据账号Id获取账号登陆信息
	 * @param accountId
	 * @return
	 */
	public Account getAccountById(String accountId);
	
	/**
	 * 验证登陆用户名是否有重复
	 * @param userName
	 * @return
	 */
	public boolean checkUserName(String userName);
	
	/**
	 * 更改密码
	 * @param oldPassword 旧密码
	 * @param newPassword 新密码
	 * @return
	 */
	public boolean changePassword(String id,String newPassword);
}
