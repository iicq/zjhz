package com.nursery.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nursery.model.Power;
import com.nursery.model.RolePower;
import com.nursery.model.jsp.PowerVO;
import com.nursery.service.PowerService;
import com.nursery.service.query.AbstractPageQuery;
import com.nursery.service.query.AbstractQuery;
import com.nursery.service.query.CountQuery;
import com.nursery.util.UUIDFactory;

@Service("powerService")
public class PowerServiceImpl extends DefaultService implements PowerService {

	@Override
	public List<PowerVO> getPowerList(Power data, int index, int size) {
		log.info("获取权限列表");
		StringBuffer sql = new StringBuffer(" select a.*,b.`name` parentName ")
								.append(" from power a ")
								.append(" left join power b on a.parent_id = b.id ")
								.append(" where 1=1 ");
		AbstractPageQuery<PowerVO> query = createPageQuery(PowerVO.class, null, index, size);
		
		if(data != null){
			if(!"".equals(data.getParentId())){
				sql.append(" and a.parent_id = ?");
				query.addParam(data.getParentId());
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public Long getPowerListCount(Power data) {
		StringBuffer sql = new StringBuffer(" select count(a.id) ")
									.append(" from power a ")
									.append(" where 1=1 ");
		
		CountQuery query = new CountQuery(null);
		
		if(data != null){
			if(!"".equals(data.getParentId())){
				sql.append(" and a.parent_id = ?");
				query.addParam(data.getParentId());
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().getObject(query);
	}

	@Override
	public List<PowerVO> getPower(Power data) {
		StringBuffer sql = new StringBuffer(" select a.*,b.`name` parentName ")
										.append(" from power a ")
										.append(" left join power b on a.parent_id = b.id ")
										.append(" where 1=1 ");
		AbstractQuery<PowerVO> query = createQuery(null, PowerVO.class);
		if(data != null){
			if(data.getId() != null && !"".equals(data.getId())){
				sql.append(" and a.id = ? ");
				query.addParam(data.getId());
			}
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name = ? ");
				query.addParam(data.getName());
			}
			if(data.getParentId() != null && !"".equals(data.getParentId())){
				sql.append(" and a.parent_id = ? ");
				query.addParam(data.getParentId());
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public void save(Power data) {
		log.info("添加权限 "+data.getName());
		data.setId(UUIDFactory.random());
		getObjectDao().save(data);
		
		RolePower rp = new RolePower();
		rp.setId(UUIDFactory.random());
		rp.setRoleId("1");
		rp.setPowerId(data.getId());
		
		getObjectDao().save(rp);
	}

	@Override
	public void update(Power data) {
		getObjectDao().update(data);
		
	}

	@Override
	public void delete(Power data) {
		List<RolePower> list =  getRoleByPowerId(data.getId());
		for(RolePower rp : list){
			getObjectDao().delete(rp);
		}
		getObjectDao().delete(data);
		
	}
	
	/**
	 * 按照权限id获取rolePower关联
	 * @param roleId
	 * @return
	 */
	private List<RolePower> getRoleByPowerId(String powerId){
		String sql = "select * from role_power where power_id = ?";
		AbstractQuery<RolePower> query = createQuery(sql, RolePower.class);
		query.addParam(powerId);
		return getObjectDao().listObjects(query);
	}

	@Override
	public List<PowerVO> getAll() {
		List<PowerVO> dataList = getPower(null);
		
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

	@Override
	public List<PowerVO> getPowerByUserId(String userId) {
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
							.append(" ) ")
							.toString();
		AbstractQuery<PowerVO> query = createQuery(sql, PowerVO.class);
		query.addParam(userId);
		return getObjectDao().listObjects(query);
	}

	@Override
	public List<Power> getPowerByRoleId(String roleId) {
		StringBuffer sql = new StringBuffer(" select a.* ")
								.append(" from power a ")
								.append(" left join role_power b on a.id = b.power_id ")
								.append(" where 1=1 ")
								.append(" and b.role_id = ? ");
		AbstractQuery<Power> query = createQuery(sql.toString(), Power.class);
		query.addParam(roleId);
		return getObjectDao().listObjects(query);
	}


}
