package com.nursery.service;

import java.util.List;

import com.nursery.model.Account;
import com.nursery.model.Admin;
import com.nursery.model.jsp.AdminVO;

public interface AdminService {

	/**
	 * 根据Id获取admin信息
	 * @param dataId
	 * @return
	 */
	public AdminVO getAdminById(String dataId);
	
	/**
	 * 获取管理员列表
	 * @param data
	 * @param size 
	 * @param index 
	 * @return
	 */
	public List<AdminVO> getAdmin(AdminVO data, int index, int size);
	
	/**
	 * 获取总行数
	 * @param data
	 * @return
	 */
	public Long getAdminCount(AdminVO data);
	
	/**
	 * 获取员工列表
	 * @param data
	 * @param size 
	 * @param index 
	 * @return
	 */
	public List<AdminVO> getStaff(AdminVO data, int index, int size);
	
	/**
	 * 获取总行数
	 * @param data
	 * @return
	 */
	public Long getStaffCount(AdminVO data);
	
	
	/**
	 * 保存
	 * @param data
	 */
	public void save(Account account,Admin data);
	
	/**
	 * 给员工添加账号、密码信息
	 * @param data
	 */
	public void update(Account account);
	
	/**
	 * 保存
	 * @param data
	 */
	public void save(Admin data);
	
	/**
	 * 编辑
	 * @param data
	 */
	public void update(Admin data);
	
	/**
	 * 更改用户拥有的角色
	 * @param adminid
	 * @param roleIds
	 */
	public void changeRole(String adminId,String roleIds);

	/**
	 * 删除admin
	 * @param accountId
	 */
	public void delete(String accountId);
	
	/**
	 * 更改用户信息（Session中获取的是VO类，转成Model类）
	 * @param url
	 * @param admin
	 */
	public void updateAdmin(Admin admin);

	/**
	 * 根据员工姓名查找员工信息 有多条取第一条
	 * @param name
	 * @return
	 */
	public AdminVO getAdminByName(String name);

	public void open(String accountId);
}