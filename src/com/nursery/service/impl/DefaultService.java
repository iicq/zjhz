package com.nursery.service.impl;

import com.nursery.dao.ObjectDao;
import com.nursery.model.Admin;
/*import com.nursery.model.Client;*/
import com.nursery.service.LogService;
import com.nursery.service.query.AbstractPageQuery;
import com.nursery.service.query.AbstractQuery;
import com.nursery.service.query.page.MySQLPageQuery;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;


public class DefaultService {

	//系统日志
	Log log = LogFactory.getLog("Saagood");
	
    protected <T> AbstractQuery<T> createQuery(String sql, Class<T> clazz) {
        return new DefaultQuery<T>(sql, clazz);
    }

    class DefaultQuery<T> extends AbstractQuery<T> {
        DefaultQuery(String sql, Class<T> clazz) {
            super(sql);
            this.clazz = clazz;
        }

        @Override
        public Class<T> getQueryClass() {
            return clazz;
        }

        private Class<T> clazz;
    }
    
    public <T> AbstractPageQuery<T> createPageQuery(Class<T> clazz, String sql, int index, int size) {
    	return new DefaultMySQLQuery(sql, index, size, clazz);
    }
    
    
    class DefaultMySQLQuery<T> extends MySQLPageQuery<T> {
        private Class<T> queryClass;

        DefaultMySQLQuery(String sql, Class<T> queryClass) {
            super(sql);
            this.queryClass = queryClass;
        }

        DefaultMySQLQuery(String sql, int index, int size, Class<T> queryClass) {
            super(sql, size, index);
            this.queryClass = queryClass;
        }

        @Override
        public Class<T> getQueryClass() {
            return queryClass;
        }
    }
    
    protected Object getSession(String key) {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        return session.getAttribute(key);
    }
    
    protected Admin getAdmin(){
    	return (Admin) getSession("user");
    }
    /*protected Client getClient(){
    	return (Client) getSession("user");
    }*/
    
	@Resource
    public LogService logService;

    @Resource(name = "springObjectDao")
    private ObjectDao objectDao;

    public ObjectDao getObjectDao() {
        return objectDao;
    }

    public void setObjectDao(ObjectDao objectDao) {
        this.objectDao = objectDao;
    }
}
