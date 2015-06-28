package com.nursery.service.impl;

import org.springframework.stereotype.Service;

import com.nursery.model.Account;
import com.nursery.service.AccountService;
import com.nursery.service.query.AbstractQuery;

@Service("accountService")
public class AccountServiceImpl extends DefaultService implements AccountService {

	@Override
	public Account getAccountById(String accountId) {
		String sql = " select * from account where id = ? ";
		AbstractQuery<Account> query = createQuery(sql,Account.class);
		query.addParam(accountId);
		return getObjectDao().getObject(query);
	}

	@Override
	public boolean checkUserName(String userName) {
		String sql = " select count(id) from account where username = ? ";
		AbstractQuery<Integer> query = createQuery(sql,Integer.class);
		query.addParam(userName);
		Integer account = getObjectDao().getObject(query);
		return account == 0 ? true : false;
	}

	@Override
	public boolean changePassword(String id,String newPassword) {
		Account account = getAccountById(id);
		account.setPassword(newPassword);
		try{
			getObjectDao().update(account);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
