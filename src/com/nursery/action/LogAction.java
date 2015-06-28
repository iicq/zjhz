package com.nursery.action;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.nursery.model.SLog;
import com.nursery.model.jsp.SLogVO;
import com.nursery.service.LogService;

/**
 * 客户
 * @author Gaoxiang
 *
 */
@Scope("prototype")
@Controller
public class LogAction extends DefaultAction {

	//保存
	public void save() throws IOException{
		
		try{
				logService.save(data);
				jsonBack(SUCCESS);
		}catch(Exception e){
			jsonBack(ERROR_1);
		}
		
	}
		
	//更改
	public void update() throws IOException{
		try{
			logService.update(data);
			jsonBack(SUCCESS);
		}catch(Exception e){
			jsonBack(ERROR_1);
		}
	}
	
	public void delete() throws IOException{
		
		try{
			logService.delete(data.getId());
			jsonBack(SUCCESS);
		}catch(Exception e){
			jsonBack(ERROR_1);
		}
	}
	
	//查找
	public void find() throws IOException, ServletException{
		
		dataVO = logService.findById(data.getId());
		forward(path);
	}
	
	//查找
	public void findToJson() throws IOException, ServletException{
		
		dataVO = logService.findById(data.getId());
		
		jsonBacks(dataVO);
	}
	
	//列表
	public void list() throws IOException, ServletException{
		list = logService.list(dataVO,index,size);
		total = logService.count(dataVO);
		forward(path);
	}
	
	//列表
	public void lastList() throws IOException, ServletException{
		list = logService.lastList();
		forward(path);
	}

	
	
// ------------------------- Get and Set ------------------------
	private SLog data;
	private SLogVO dataVO;
	private List<SLogVO> list;				

	@Resource
	private LogService logService;

	public SLog getData() {
		return data;
	}

	public void setData(SLog data) {
		this.data = data;
	}

	public SLogVO getDataVO() {
		return dataVO;
	}

	public void setDataVO(SLogVO dataVO) {
		this.dataVO = dataVO;
	}

	public List<SLogVO> getList() {
		return list;
	}

	public void setList(List<SLogVO> list) {
		this.list = list;
	}

	public LogService getLogService() {
		return logService;
	}

	public void setLogService(LogService logService) {
		this.logService = logService;
	}
	
}
