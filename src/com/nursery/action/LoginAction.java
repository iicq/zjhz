package com.nursery.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.nursery.action.tip.Tip;
import com.nursery.model.Account;
import com.nursery.service.AdminService;
import com.nursery.service.LoginService;
import com.nursery.service.PowerService;
import com.nursery.util.SecurityCode;
import com.nursery.util.SessionTools;

@Scope("prototype")
@Controller
public class LoginAction extends DefaultAction {
	//获取客户端ip地址
	public static String getClientIp(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String ip = request.getHeader("x-forwarded-for");
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		ip = request.getRemoteAddr();
		}
		return ip;
		}
	//登录
	public void login() throws IOException{
		Tip tip = SUCCESS ;
		//判断验证码
		if(getSession("verifyCode") !=null && !getSession("verifyCode").toString().equals(getVerify())){
			
			tip = ERROR_3 ;
			
		}else{
			ip=getClientIp();//获得客户端IP
			//验证用户名密码
			data = loginService.login(data.getUsername(), data.getPassword(),ip);
			
			if(data != null && data.getId() != null && !"".equals(data.getId())){
				
				if(data.getPower() < 1){
					//系统不允许登陆
					tip = ERROR_1 ;
					
				}else{
					
					//记录顶级管理员信息
					if("admin".equals(data.getUsername())){
						putSession(ROOT,"root");
					}
					//添加登陆信息
					putSession(ACCOUNT,data);
					
					//获取权限
					power(data.getId());
					
					//添加用户详细信息到session
					putSession(USER,adminService.getAdminById(data.getTextId()));
					
					//返回信息
					tip = SUCCESS ;
				}
				
			}else{
				//用户名或密码错误
				tip = ERROR_2 ;
			}
		}
		
		jsonBack(tip);
	}
	
	/**
	 * 获取验证码
	 * @return
	 * @throws IOException 
	 */
	public void getVerifyCode() throws IOException {
		//获取随机数
		String verify = SecurityCode.getSecurityCode();
		//存放到session
		putSession("verifyCode", verify);
		//以base64方式编码后返回
		jsonBacks(SecurityImage.encodeImage(verify));
	}
	
	//注销
	public void logout(){
		
		removeSession(ACCOUNT);					//账号
		removeSession(USER);							//用户信息
		removeSession(POWER);						//权限
		removeSession(MYPOWER);					//我拥有的权限
		removeSession(ROLEPOWER);				//角色拥有的权限
		removeSession(ADMINROLE);				//用户拥有的角色
		removeSession(SESSIONTOOLS);			//session工具
		removeSession(ROOT);							//admin超级管理员信息"root"
		try {
			
			sendDirect("/login.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	//web注销
	/*public void webLogout(){
		System.out.println("web注销");
		removeSession(ACCOUNT);					//账号
		removeSession(USER);							//用户信息
		removeSession(POWER);						//权限
		removeSession(MYPOWER);					//我拥有的权限
		removeSession(ROLEPOWER);				//角色拥有的权限
		removeSession(ADMINROLE);				//用户拥有的角色
		removeSession(SESSIONTOOLS);			//session工具
		removeSession(ROOT);					//admin超级管理员信息"root"
		try {
			
			sendDirect("login.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}*/

	//获取权限
	public void power(String userId){
		if(userId == null){
			userId = ((Account)getSession(ACCOUNT)).getId();
		}
		putSession(POWER, loginService.getPower(userId));
		putSession(MYPOWER, powerService.getPowerByUserId(userId));
		putSession(SESSIONTOOLS, new SessionTools());
	}
	
	//刷新权限
	public void power() throws IOException{
		try {
			power(null);
			jsonBack(SUCCESS);
		} catch (Exception e) {
			jsonBack(ERROR_1);
		}
		
	}
	
	/**
	 * 因为目前只有后台，做一个首页往后台的跳转，前台完成以后删除并更改struts.xml中的配置
	 * @throws IOException
	 * @throws ServletException 
	 */
	public void tempSend() throws IOException, ServletException{
		forward("/login.jsp");
	}
	
//----------------------------------------- Get and Set ----------------------------------
	
	//账号信息
	private Account data;
	//权限Id
	private String powerId;
	//验证码
	private String verify;
	//登陆IP
	private String ip;
	


	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

	@Resource
	private LoginService loginService;
	
	@Resource
	private PowerService powerService;
	
	@Resource
	private AdminService adminService;
	

	public Account getData() {
		return data;
	}

	public void setData(Account data) {
		this.data = data;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public String getPowerId() {
		return powerId;
	}

	public void setPowerId(String powerId) {
		this.powerId = powerId;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}
	
}
