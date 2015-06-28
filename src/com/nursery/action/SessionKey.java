package com.nursery.action;

public interface SessionKey {
    public static final String USER = "user";					//用户详细信息
    public static final String ACCOUNT = "account";				//用户账号信息
    public static final String CODE = "code";					//用户登录验证码
    public static final String POWER = "power";					//权限集合
    public static final String ROLEPOWER = "rolePower";			//某角色临时权限
    public static final String MYPOWER = "myPower";				//我拥有的权限（不分组）
    public static final String ADMINROLE = "adminRole";			//某管理员拥有的角色
    public static final String ROOT = "root";					//管理员admin专属
    public static final String SESSIONTOOLS = "sessionTools";	//session工具
    
}
