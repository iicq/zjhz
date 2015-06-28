package com.nursery.service;

import java.util.List;

import com.nursery.model.Power;
import com.nursery.model.jsp.PowerVO;

public interface PowerService {

	/**
	 * 按条件获取powerlist
	 * @param data	查询条件
	 * @param index	索引页
	 * @param size 数据大小
	 * @return
	 */
	public List<PowerVO> getPowerList(Power data,int index,int size);
	
	/**
	 * 按条件获取行数
	 * @param data
	 * @return
	 */
	public Long getPowerListCount(Power data);
	
	/**
	 * 按条件获取权限
	 * @param data
	 * @return
	 */
	public List<PowerVO> getPower(Power data);

	/**
	 * 保存权限信息
	 * @param data
	 */
	public void save(Power data);

	/**
	 * 更改权限
	 * @param data
	 */
	public void update(Power data);

	/**
	 * 删除权限
	 * @param data
	 */
	public void delete(Power data);

	/**
	 * 无条件查询出所有权限，然后分组
	 * @return
	 */
	public List<PowerVO> getAll();
	
	/**
	 * 不分组获取用户拥有的权限
	 * @param userId
	 * @return
	 */
	public List<PowerVO> getPowerByUserId(String userId);
	
	/**
	 * 根据角色id获取权限
	 * @return
	 */
	public List<Power> getPowerByRoleId(String roleId);

}
