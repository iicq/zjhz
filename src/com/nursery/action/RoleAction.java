package com.nursery.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nursery.model.Role;
import com.nursery.model.jsp.PowerVO;
import com.nursery.model.jsp.RoleVO;
import com.nursery.service.PowerService;
import com.nursery.service.RoleService;

@Scope("prototype")
@Controller
public class RoleAction extends DefaultAction{

	/**
	 * 获取角色列表
	 * @throws ServletException 
	 * @throws IOException 
	 */
	public void list() throws IOException, ServletException{
		//获取数据
		list = roleService.getRoleList(data,index,size);
		//获取行数
		total = roleService.getRoleListCount(data);
		//跳转
		forward(path);
	}
	
	public void save() throws IOException{
		//判断重名
		List<Role> list = roleService.getRole(new Role().setName(data.getName()));
		if(list != null && list.size() > 0){
			jsonBack(ERROR_1);
		}else{
			roleService.save(data);
			jsonBack(SUCCESS);
		}
		
	}
	
	public void find() throws IOException, ServletException{
		List<Role> list = roleService.getRole(new Role().setId(data.getId()));
		if(list != null && list.size() > 0){
			data = list.get(0);
		}
		forward(path);
	}

	public void update() throws IOException{
		
		try {
			roleService.update(data);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			jsonBack(ERROR_1);
		}
	
	}
	
	public void delete() throws IOException{
		try {
			roleService.delete(data);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			jsonBack(ERROR_1);
		}
	}
	
	
	public void givePower() throws IOException, ServletException{
		List<Role> list = roleService.getRole(new Role().setId(data.getId()));
		if(list != null && list.size() > 0){
			data = list.get(0);
		}
		powerVO = powerService.getAll();
		putSession(ROLEPOWER, powerService.getPowerByRoleId(data.getId()));
		forward(path);
	}
	
	public void changePower() throws IOException{
		try {
			roleService.changePower(data.getId(), powers);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			jsonBack(ERROR_1);
		}
		
	}
	
	
// ----------------------------- Get and Set ----------------------------
	private Role data;
	
	//更改角色拥有的权限时，获取到的id
	private String powers;
	
	private List<RoleVO> list;
	
	private List<PowerVO> powerVO;
	
	@Resource
	private PowerService powerService;
	
	@Resource
	private RoleService roleService;
	
	
	
	public String getPowers() {
		return powers;
	}

	public void setPowers(String powers) {
		this.powers = powers;
	}

	public List<PowerVO> getPowerVO() {
		return powerVO;
	}

	public void setPowerVO(List<PowerVO> powerVO) {
		this.powerVO = powerVO;
	}

	public PowerService getPowerService() {
		return powerService;
	}

	public void setPowerService(PowerService powerService) {
		this.powerService = powerService;
	}

	public Role getData() {
		return data;
	}

	public void setData(Role data) {
		this.data = data;
	}

	public List<RoleVO> getList() {
		return list;
	}

	public void setList(List<RoleVO> list) {
		this.list = list;
	}
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
}
