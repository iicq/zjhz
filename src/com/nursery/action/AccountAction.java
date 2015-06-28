package com.nursery.action;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nursery.model.Account;
import com.nursery.service.AccountService;

@Scope("prototype")
@Controller
public class AccountAction extends DefaultAction{

	/**
	 * 更改密码
	 * @throws IOException
	 */
	public void change() throws IOException{
		Account account = accountService.getAccountById(data.getId());
		if(oldPassword.equals(account.getPassword())){
			if(accountService.changePassword(data.getId(),newPassword)){
				jsonBack(SUCCESS);
			}
		}else{
			jsonBack(ERROR_1);
		}
	}
	

	
	
	
// ---------------------------- get and set -------------------------
	private Account data;
	private String oldPassword;		//旧密码
	private String newPassword;		//新密码
	
	@Resource
	AccountService accountService;

	public Account getData() {
		return data;
	}

	public void setData(Account data) {
		this.data = data;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
	
}
