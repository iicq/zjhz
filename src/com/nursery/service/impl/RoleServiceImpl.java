package com.nursery.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import com.nursery.model.AdminRole;
import com.nursery.model.Role;
import com.nursery.model.RolePower;
import com.nursery.model.jsp.RoleVO;
import com.nursery.service.RoleService;
import com.nursery.service.query.AbstractPageQuery;
import com.nursery.service.query.AbstractQuery;
import com.nursery.service.query.CountQuery;
import com.nursery.util.UUIDFactory;

@Service("roleService")
public class RoleServiceImpl extends DefaultService implements RoleService {

	@Override
	public List<RoleVO> getRoleList(Role data, int index, int size) {
		log.info("获取角色列表！");
		StringBuffer sql = new StringBuffer(" select a.*,b.powerCount   ");
						sql.append(" from role a ");
						sql.append(" left join ( ");
						sql.append(" 	select role_id,count(id) powerCount ");
						sql.append(" 	from role_power  ");
						sql.append(" 	group by role_id ");
						sql.append(" ) b on a.id = b.role_id ");
						sql.append(" where 1=1  ");
		
		AbstractPageQuery<RoleVO> query = createPageQuery(RoleVO.class, null, index, size);
		
		if(data != null ){
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name like ? ");
				query.addParam("%"+data.getName()+"%");
			}
		}
		
		query.setSQL(sql.toString());
		
		return getObjectDao().listObjects(query);
	}

	@Override
	public List<Role> getRoleListByUserId(String userId) {
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

	@Override
	public Long getRoleListCount(Role data) {
		
		StringBuffer sql = new StringBuffer(" select count(id) from role a where 1=1  ");
		
		CountQuery query = new CountQuery(null);
		
		if(data != null ){
			if(data.getName() != null && !"".equals(data.getName())){
				sql.append(" and a.name like ? ");
				query.addParam("%"+data.getName()+"%");
			}
		}
		
		query.setSQL(sql.toString());
		
		return getObjectDao().getObject(query);
	}

	@Override
	public boolean save(Role data) {
		data.setId(UUIDFactory.random());
		getObjectDao().save(data);
		log.info("添加角色："+data.getName()+"  成功");
		return true;
	}

	@Override
	public List<Role> getRole(Role data) {
		StringBuffer sql = new StringBuffer(" select a.* from role a ");
								sql.append(" where 1=1 ");
		AbstractQuery<Role> query = createQuery(null, Role.class);
		if(data != null){
			if(data.getId()!= null && !"".equals(data.getId())){
				sql.append(" and a.id = ? ");
				query.addParam(data.getId());
			}
			if(data.getName()!= null && !"".equals(data.getName())){
				sql.append(" and a.name = ? ");
				query.addParam(data.getName());
			}
		}
		query.setSQL(sql.toString());
		return getObjectDao().listObjects(query);
	}

	@Override
	public void update(Role data) {
		getObjectDao().update(data);
		
	}

	@Override
	public void delete(Role data) {
		List<AdminRole> alist = getAdminByRoleId(data.getId());
		for(AdminRole ar : alist){
			getObjectDao().delete(ar);
		}
		List<RolePower> rlist = getPowerByRoleId(data.getId());
		for(RolePower r : rlist){
			getObjectDao().delete(r);
		}
		getObjectDao().delete(data);
	}
	
	public List<AdminRole> getAdminByRoleId(String roleId){
		String sql = " select * from admin_role where role_id = ? ";
		AbstractQuery<AdminRole> query = createQuery(sql, AdminRole.class);
		query.addParam(roleId);
		return getObjectDao().listObjects(query);
	}

	@Override
	public void changePower(String roleId, String powers) {
		List<RolePower> list = getPowerByRoleId(roleId);
		for(RolePower rp : list){
			getObjectDao().delete(rp);
		}
		String[] args = powers.split("\\|");
		RolePower tempRp = null;
		for(String s : args){
			tempRp = new RolePower();
			tempRp.setId(UUIDFactory.random());
			tempRp.setRoleId(roleId);
			tempRp.setPowerId(s);
			getObjectDao().save(tempRp);
		}
	}
	
	private List<RolePower> getPowerByRoleId(String roleId){
		String sql = "select * from role_power where role_id = ?";
		AbstractQuery<RolePower> query = createQuery(sql, RolePower.class);
		query.addParam(roleId);
		return getObjectDao().listObjects(query);
	}

}
