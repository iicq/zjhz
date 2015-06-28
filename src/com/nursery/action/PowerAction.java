package com.nursery.action;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.nursery.model.Power;
import com.nursery.model.jsp.PowerVO;
import com.nursery.service.PowerService;


@Scope("prototype")
@Controller
public class PowerAction extends DefaultAction{

	//获取权限列表
	public void list() throws IOException, ServletException{
		
		list = powerService.getPowerList(data,index, size);
		
		total = powerService.getPowerListCount(data);
		
		forward(path);
	}
	
	
	public void save() throws IOException{
		//判断重名
		List<PowerVO> list = powerService.getPower(new Power().setName(data.getName()));
		if(list != null && list.size() > 0){
			jsonBack(ERROR_1);
		}else{
			powerService.save(data);
			jsonBack(SUCCESS);
		}
		
	}
	
	public void find() throws IOException, ServletException{
		List<PowerVO> list = powerService.getPower(new Power().setId(data.getId()));
		if(list != null && list.size() > 0){
			dataVO = list.get(0);
		}
		listVO = powerService.getAll();
		forward(path);
	}

	public void update() throws IOException{
		
		try {
			powerService.update(data);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			jsonBack(ERROR_1);
		}
	
	}
	
	public void delete() throws IOException{
		List<PowerVO> list = powerService.getPower(new Power().setId(data.getId()));
		List<PowerVO> listemp = powerService.getPower(new Power().setParentId(list.get(0).getId()));
		if(listemp !=null && listemp.size()>0){
			jsonBack(ERROR_1);
		}else{
			try {
				powerService.delete(data);
				jsonBack(SUCCESS);
			} catch (Exception e) {
				jsonBack(ERROR_2);
			}
		}

	}
	
	public void getAll() throws IOException, ServletException{
		list = powerService.getAll();
		forward(path);
	}
	

	
//---------------------------- Get and Set ---------------------
	
	private Power data;
	
	private Power dataVO;
	
	private List<PowerVO> list;
	
	private List<PowerVO> listVO;

	@Resource
	private PowerService powerService;
	
	
	
	public List<PowerVO> getListVO() {
		return listVO;
	}


	public void setListVO(List<PowerVO> listVO) {
		this.listVO = listVO;
	}


	public PowerService getPowerService() {
		return powerService;
	}


	public void setPowerService(PowerService powerService) {
		this.powerService = powerService;
	}


	public Power getDataVO() {
		return dataVO;
	}


	public void setDataVO(Power dataVO) {
		this.dataVO = dataVO;
	}


	public Power getData() {
		return data;
	}

	public void setData(Power data) {
		this.data = data;
	}

	public List<PowerVO> getList() {
		return list;
	}

	public void setList(List<PowerVO> list) {
		this.list = list;
	}
	
	
}
