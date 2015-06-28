package com.nursery.service;

import java.util.List;

import com.nursery.model.Role;
import com.nursery.model.jsp.RoleVO;

public interface RoleService {


	/**
	 * 按条件获取角色
	 * @param role 条件对象	
	 * @param index 分页起始
	 * @param size 分页大小
	 * @return
	 */
	public List<RoleVO> getRoleList(Role data,int index,int size);
	
	/**
	 * 按条件获取角色数量 
	 * @param role
	 * @return
	 */
	public Long getRoleListCount(Role data);
	
	/**
	 * 根据用户Id获取用户拥有的角色
	 * @param userId
	 * @return
	 */
	public List<Role> getRoleListByUserId(String userId);

	/**
	 * 添加角色
	 * @param data 数据
	 * @return
	 */
	public boolean save(Role data);
	
	/**
	 * 按条件获取角色
	 * @param data
	 * @return
	 */
	public List<Role> getRole(Role data);
	
	/**
	 * 更改角色
	 * @param data
	 */
	public void update(Role data);

	/**
	 * 删除角色
	 * @param data
	 */
	public void delete(Role data);
	
	/**
	 * 重新给角色赋权限
	 * @param roleId
	 * @param powers
	 */
	public void changePower(String roleId,String powers);
}
