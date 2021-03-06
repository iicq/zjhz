package com.nursery.interceptor;

import com.nursery.action.DefaultAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class WebInterceptor extends DefaultAction implements Interceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void destroy() {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void init() {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        Object object = session.getAttribute(ACCOUNT);
        if(object == null && !"/web/login_login".equals(request.getRequestURI())
                && !"/web/logout_login".equals(request.getRequestURI())
                && !"/web/getVerifyCode_login".equals(request.getRequestURI())
        		) { //超时 ,排除登录、退出
            String path = request.getParameter("path");
           if(path == null || "".equals(path)){
        	   path  = (String) request.getAttribute("path");
           }
                if(path == null) {  // ajax 请求 并且返回json
                    jsonBack(TIMEOUT);
                } else {     //返回回话超时页面
                    sendDirect("/remind/session.jsp");
                }
            return null;
        } else {
        	return invocation.invoke();
        }
    }
}
