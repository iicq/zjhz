package com.nursery.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nursery.model.Account;
import com.nursery.model.Admin;
import com.nursery.model.AdminRole;
import com.nursery.model.jsp.AdminVO;
import com.nursery.service.AccountService;
import com.nursery.service.AdminService;
import com.nursery.service.query.AbstractPageQuery;
import com.nursery.service.query.AbstractQuery;
import com.nursery.util.UUIDFactory;

@Service("adminService")
public class AdminServiceImpl extends DefaultService implements AdminService {

	@Override
	public AdminVO getAdminById(String dataId) {
		String sql = new StringBuffer()
		.append(" select a.*,b.id accountId,b.username,b.set_time,b.last_time,b.power,b.count ")
		.append(" from admin a ")
		.append(" left join account b on a.id = b.text_id ")
		.append(" where a.id = ? ").toString();
		AbstractQuery<AdminVO> query = createQuery(sql, AdminVO.class);
		query.addParam(dataId);
		return getObjectDao().getObject(query);
	}

	@Override
	public void save(Account account,Admin data) {
		data.setId(UUIDFactory.random());
		getObjectDao().save(data);
		
		account.setId(UUIDFactory.random());
		account.setSetTime(new Date().getTime());
		account.setPower(1);
		account.setCount(0);
		account.setTextId(data.getId());
		getObjectDao().save(account);
		
	}

	@Override
	public void update(Admin data) {
		
		getObjectDao().update(data);
		
	}

	@Override
	public List<AdminVO> getAdmin(AdminVO data,int index,int size) {
		StringBuffer sql = new StringBuffer()
		.append(" select a.*,b.id accountId,b.username,b.set_time,b.last_time,b.power,b.count ")
		.append(" from admin a ")
		.append(" left join account b on a.id = b.text_id ")
		.append(" where 1=1 and b.power = 1 and b.username is not null ");
		AbstractPageQuery<AdminVO> query = createPageQuery(AdminVO.class,null,index,size);
		if(data != null){
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name like ? ");
				query.addParam("%"+data.getName()+"%");
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public Long getAdminCount(AdminVO data) {
		StringBuffer sql = new StringBuffer(" select count(a.id) ")
		.append(" from admin a ")
		.append(" left join account b on a.id = b.text_id ")
		.append(" where 1=1 and b.power = 1 and b.username is not null ");
		AbstractQuery<Long> query = createQuery(null,Long.class);
		if(data != null){
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name like ? ");
				query.addParam("%"+data.getName()+"%");
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().getObject(query);
	}

	@Override
	public void changeRole(String adminId, String roleIds) {
		List<AdminRole> list = getRoleByAdminId(adminId);
		for(AdminRole ar : list){
			getObjectDao().delete(ar);
		}
		if(roleIds!=null){
			String[] args = roleIds.split("\\|");
			AdminRole arole = null;
			for(String s : args){
				arole = new AdminRole();
				arole.setId(UUIDFactory.random());
				arole.setAdminId(adminId);
				arole.setRoleId(s);
				getObjectDao().save(arole);
			}
		}
	}

	private List<AdminRole> getRoleByAdminId(String adminid){
		String sql = "select * from admin_role where admin_id = ?";
		AbstractQuery<AdminRole> query = createQuery(sql, AdminRole.class);
		query.addParam(adminid);
		return getObjectDao().listObjects(query);
	}

	@Override
	public void delete(String accountId) {
		Account account = accountService.getAccountById(accountId);
		account.setPower(-1);
		getObjectDao().update(account);
		
	}
	
	@Resource
	AccountService accountService;

	@Override
	public void updateAdmin(Admin admin) {
		Admin n = new Admin();
		n.setId(admin.getId());
		n.setName(admin.getName());
		n.setCard(admin.getCard());
		n.setHead(admin.getHead());
		n.setIntro(admin.getIntro());
		n.setPhone(admin.getPhone());
		getObjectDao().update(n);
	}

	@Override
	public void save(Admin data) {
		
		data.setId(UUIDFactory.random());
		getObjectDao().save(data);
		
		Account account = new Account();
		account.setId(UUIDFactory.random());
		account.setSetTime(new Date().getTime());
		account.setPower(2);
		account.setCount(0);
		account.setTextId(data.getId());
		getObjectDao().save(account);
	}

	@Override
	public void update(Account account) {
		getObjectDao().update(account);
	}

	@Override
	public List<AdminVO> getStaff(AdminVO data, int index, int size) {
		StringBuffer sql = new StringBuffer()
		.append(" select a.*,b.id accountId,b.username,b.set_time,b.last_time,b.power,b.count ")
		.append(" from admin a ")
		.append(" left join account b on a.id = b.text_id ")
		.append(" where 1=1 and b.power = 2 ");
		AbstractPageQuery<AdminVO> query = createPageQuery(AdminVO.class,null,index,size);
		if(data != null){
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name like ? ");
				query.addParam("%"+data.getName()+"%");
			}
			
		}
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public Long getStaffCount(AdminVO data) {
		StringBuffer sql = new StringBuffer(" select count(a.id) ")
		.append(" from admin a ")
		.append(" left join account b on a.id = b.text_id ")
		.append(" where 1=1 and b.power = 2");
		AbstractQuery<Long> query = createQuery(null,Long.class);
		if(data != null){
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name like ? ");
				query.addParam("%"+data.getName()+"%");
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().getObject(query);
	}

	@Override
	public AdminVO getAdminByName(String name) {
		String sql = new StringBuffer()
		.append(" select a.*,b.id accountId,b.username,b.set_time,b.last_time,b.power,b.count ")
		.append(" from admin a ")
		.append(" left join account b on a.id = b.text_id ")
		.append(" where a.name = ? limit 0,1").toString();
		AbstractQuery<AdminVO> query = createQuery(sql, AdminVO.class);
		query.addParam(name);
		List<AdminVO> data = getObjectDao().listObjects(query);
		if(data != null && data.size() > 0){
			return data.get(0);
		}
		return null;
	}

	@Override
	public void open(String accountId) {
		Account account = accountService.getAccountById(accountId);
		account.setPower(0);
		getObjectDao().update(account);
	}
}
