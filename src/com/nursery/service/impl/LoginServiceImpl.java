package com.nursery.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nursery.model.Account;
import com.nursery.model.Power;
import com.nursery.model.Role;
import com.nursery.model.jsp.PowerVO;
import com.nursery.service.LoginService;
import com.nursery.service.PowerService;
import com.nursery.service.query.AbstractQuery;
import com.nursery.service.query.DefaultExecutor;

@Service("loginService")
public class LoginServiceImpl extends DefaultService implements LoginService {


	@Override
	public Account login(String username, String password,String ip) {
		log.info("用户登录。");
		String sql = " select * from account where 1=1 "
				+ " and username = ? "
				+ " and password = ? ";
		AbstractQuery<Account> query = createQuery(sql, Account.class);
		query.addParam(username);
		query.addParam(password);
		List<Account> list = getObjectDao().listObjects(query);
		if(list != null && list.size() > 0){
			log.info("用户登录成功！");
			Account account = list.get(0);
			account.setLastTime(new Date().getTime());
			account.setCount(account.getCount()+1);
			/*account.setLastIp(ip);*/
			getObjectDao().update(account);
			return account;
		}
		return null;
	}

	@Override
	public List<PowerVO> getPower(String userId) {
		
		List<PowerVO> dataList = getPowerByUserId(userId);
		
		List<PowerVO> menuList = getMenuList(dataList);
		
		if(menuList != null && menuList.size() > 0){
			
			for(PowerVO menu : menuList){
				
				menu.setList(getChildMenu(menu.getId(), dataList));
				
				if(menu.getList() != null && menu.getList().size() > 0){
					
					for(PowerVO child : menu.getList()){
						
						child.setList(getChildMenu(child.getId(), dataList));
					}
				}
			}
		}
		return menuList;
	}

	@Override
	public List<Role> getRole(String userId) {
		log.info("获取用户角色。");
		String sql = new StringBuffer(" select a.* ")
							.append(" from role a ")
							.append(" left join admin_role b on a.id = b.role_id ")
							.append(" where b.admin_id = ? ")
							.toString();
		AbstractQuery<Role> query = createQuery(sql, Role.class);
		query.addParam(userId);
		
		List<Role> list = getObjectDao().listObjects(query);
		log.info("用户角色数量："+list.size());
		return list;
	}
	
	/**
	 * 根据用户ID获取所有的角色 然后用角色查出所有权限 去除重复
	 * @param userId
	 * @return
	 */
	private List<PowerVO> getPowerByUserId(String userId){
		log.info("用户请求权限。");
		String sql = new StringBuffer(" select distinct a.* ")
							.append(" from power a  ")
							.append(" left join role_power b on a.id = b.power_id ")
							.append(" where b.role_id in ( ")
							.append(" 	select id from ( ")
							.append(" 		select a.* ")
							.append(" 		from role a ")
							.append(" 		left join admin_role b on a.id = b.role_id ")
							.append(" 		where b.admin_id = ? ")
							.append(" 	) role ")
							.append(" ) and a.menu = 1 order by a.ord")
							.toString();
		AbstractQuery<PowerVO> query = createQuery(sql, PowerVO.class);
		query.addParam(userId);
		List<PowerVO> list = getObjectDao().listObjects(query);
		log.info("用户权限数量："+list.size());
		return list;
	}
	
	
	/**
	 * 根据数据源（list） 获取父级Id为0的权限（目录权限）
	 * @param datalist
	 * @return
	 */
	private List<PowerVO> getMenuList(List<PowerVO> dataList){
		
		if(dataList != null && dataList.size() > 0){
			
			List<PowerVO> menuList = new ArrayList<PowerVO>();
			
			for(PowerVO temp : dataList){
				
				if("0".equals(temp.getParentId())){
					menuList.add(temp);
				}
			}
			return menuList;
		}else{
			return null;
		}

	}
	
	/**
	 * 根据数据源（list）和父级Id 获取子集权限
	 * @param datalist
	 * @return
	 */
	private List<PowerVO> getChildMenu(String parentId,List<PowerVO> dataList){
		
		if(dataList != null && dataList.size() > 0){
			
			List<PowerVO> childList = new ArrayList<PowerVO>();
			
			for(PowerVO temp : dataList){
				if(parentId.equals(temp.getParentId())){
					childList.add(temp);
				}
			}
			return childList;
		}else{
			return null;
		}
		
	}


}