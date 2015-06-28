package com.nursery.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.nursery.action.DefaultAction;

public class AdminJspFilter extends DefaultAction implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException{
		HttpServletRequest request = (HttpServletRequest) arg0;
        HttpSession session = request.getSession();
        Object object = session.getAttribute(ACCOUNT);
        if(object == null && !"/oa/login.jsp".equals(request.getRequestURI())
                && !"/remind/session.jsp".equals(request.getRequestURI())) { //超时 ,排除登录、退出

				sendDirect("/remind/session.jsp");
            
        } else {
				chain.doFilter(arg0, arg1);
        }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	
}
