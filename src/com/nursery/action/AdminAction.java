package com.nursery.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nursery.action.tip.Tip;
import com.nursery.model.Account;
import com.nursery.model.Admin;
import com.nursery.model.Role;
import com.nursery.model.jsp.AdminVO;
import com.nursery.model.jsp.HeadImage;
import com.nursery.service.AccountService;
import com.nursery.service.AdminService;
import com.nursery.service.RoleService;
import com.nursery.util.CardOperation;
import com.nursery.util.ExcelException;
import com.nursery.util.ExcelUtil;
import com.nursery.util.ExportScheme;
import com.nursery.util.ImageHelper;
import com.opensymphony.xwork2.ActionContext;

@Scope("prototype")
@Controller
public class AdminAction extends DefaultAction {
	public void test() throws IOException{
		System.out.println("进入了action！");
		try {
			cardWriteStatus= CardOperation.open_Machine(2);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonBack(ERROR_2);
		}
		
		
	}
	//保存
	public void save() throws IOException{
		try{
			if(accountService.checkUserName(account.getUsername())){
				Account accdata = accountService.getAccountById(account.getId());
				accdata.setUsername(account.getUsername());
				accdata.setPassword(account.getPassword());
				accdata.setPower(1);
				adminService.update(accdata);
				jsonBack(SUCCESS);
			}else{
				jsonBack(ERROR_2);
			}
			
		}catch(Exception e){
			System.out.println(e);
			e.printStackTrace();
			jsonBack(ERROR_1);
		}
		
	}
	//更改账户信息，密码
	public void update() throws IOException{
		try{
			Account accdata = accountService.getAccountById(account.getId());
			accdata.setPassword(account.getPassword());
			adminService.update(accdata);
			jsonBack(SUCCESS);
		}catch(Exception e){
			jsonBack(ERROR_1);
		}
	}
	
	public void delete() throws IOException{
		
		try{
			adminService.delete(accountId);
			jsonBack(SUCCESS);
		}catch(Exception e){
			jsonBack(ERROR_1);
		}
	}
	
	public void open() throws IOException{
		
		try{
			adminService.open(accountId);
			jsonBack(SUCCESS);
		}catch(Exception e){
			jsonBack(ERROR_1);
		}
	}
	
	//查找
	public void find() throws IOException, ServletException{
		
		dataVO = adminService.getAdminById(data.getId());
		
		forward(path);
	}
	
	//查找
	public void findToJson() throws IOException, ServletException{
		
		dataVO = adminService.getAdminById(data.getId());
		
		jsonBacks(dataVO);
	}
	
	//根据员工姓名查找员工信息，有多个选择第一个
	public void findByNameToJson(){
		
		dataVO = adminService.getAdminByName(data.getName());
		
		jsonBacks(dataVO);
	}
	//列表
	public void list() throws IOException, ServletException{
		list = adminService.getAdmin(dataVO,index,size);
		total = adminService.getAdminCount(dataVO);
		forward(path);
	}
	public void downExcel()throws IOException{ 
		list = adminService.getAdmin(dataVO,1,6339);
		LinkedHashMap<String, String> fieldMap = new LinkedHashMap<String, String>(); 
		fieldMap.put("id","标号");
		fieldMap.put("name", "姓名");
		
		String sheetName = "用户表";
		OutputStream out = System.out;
		try {
			String savePath = ServletActionContext.getServletContext().getRealPath("/oa/temporaryFile/");
			ExcelUtil.listToExcel(list, fieldMap, sheetName, out);
			fileName ="business.xls";
			ExportScheme.exportScheme(new FileInputStream(savePath + File.separator + "business.xls"),fileName);
		} catch (ExcelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void findRole() throws IOException, ServletException{
		putSession(ADMINROLE,roleService.getRoleListByUserId(accountId));
		dataVO = adminService.getAdminById(data.getId());
		roleList = roleService.getRole(null);
		forward(path);
	}
	
	public void changeRole() throws IOException{
		try {
			adminService.changeRole(accountId, roleIds);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			jsonBack(ERROR_1);
		}
		
	}
	
	
	
	/**
	 * 修改头像
	 * @throws Exception 
	 */
	public void head() throws Exception{
		Admin admin = (Admin) getSession(USER);
		Tip tip;
        if(file == null) {
        	tip = ERROR_1;
        }else if(!checkFileType(fileFileName)) {
        	tip = ERROR_2;
        }else if(file.length() > MAX_SIZE) {
        	tip = ERROR_3;
        } else {
        	//上传地址
            String url = SAVE_HEAD + System.currentTimeMillis() + fileFileName.substring(fileFileName.lastIndexOf("."));
            String realPath = ServletActionContext.getServletContext().getRealPath(url);
            
            if(img != null){
            	ImageHelper.cutImage(file, realPath,img.getX1(), img.getY1(),img.getW(), img.getH());
            }else{
            	tip = ERROR_4;
            }
            
            admin.setHead(url);
            adminService.updateAdmin(admin);
            putSession(USER, admin);
            
            tip = SUCCESS;
        }
        jsonBack(tip);
	}
	
    /**
     * 文件类型判断
     *
     * @param fileName
     * @return
     */
    private boolean checkFileType(String fileName) {
        Iterator<String> type = Arrays.asList(ALLOW_FILES).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }
    
	
// ------------------------- Get and Set ------------------------
	private Admin data;						
	private AdminVO dataVO;				
	private String accountId;				
	private Account account;				//用户账号信息
	private List<AdminVO> list;				//管理员列表
	private List<Role> roleList;				//角色列表
	private String roleIds;					//选中的roleIds
	private File file;								//头像上传
	private String fileFileName;			//文件名
	private String fileContentType;		//文件类型
	private HeadImage img;					//图片裁剪相关属性
	private String fileName;
    private static String[] ALLOW_FILES = {".png", ".jpg", ".jpeg"};		// 文件允许格式
    private static int MAX_SIZE = 3 * 1024 * 1024;							// 文件大小限制，单位KB
    private static String SAVE_HEAD = "/upload/headimage/";				// 保存路径
    //磁卡写入状态
  	private int cardWriteStatus;
	@Resource
	private AdminService adminService;

	@Resource
	private RoleService roleService;
	
	@Resource
	private AccountService accountService;
	
	
	
	public int getCardWriteStatus() {
		return cardWriteStatus;
	}
	public void setCardWriteStatus(int cardWriteStatus) {
		this.cardWriteStatus = cardWriteStatus;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public HeadImage getImg() {
		return img;
	}
	public void setImg(HeadImage img) {
		this.img = img;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public AccountService getAccountService() {
		return accountService;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public AdminVO getDataVO() {
		return dataVO;
	}
	public void setDataVO(AdminVO dataVO) {
		this.dataVO = dataVO;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Admin getData() {
		return data;
	}

	public void setData(Admin data) {
		this.data = data;
	}

	public List<AdminVO> getList() {
		return list;
	}

	public void setList(List<AdminVO> list) {
		this.list = list;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	
}
