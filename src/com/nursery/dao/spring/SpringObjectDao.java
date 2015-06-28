package com.nursery.dao.spring;

import java.util.List;
import java.util.Vector;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import com.nursery.dao.DaoException;
import com.nursery.dao.EmptyResultException;
import com.nursery.dao.Executor;
import com.nursery.dao.ObjectDao;
import com.nursery.dao.Query;

public class SpringObjectDao extends JdbcDaoSupport implements ObjectDao {
   
	Log log = LogFactory.getLog("SQL");
	
	private void showSQL(Query<?> query,Object[] param){
		try{
			log.info("语句："+query.getQueryString());
			if(param.length > 0){
				for(Object p : param){
					log.info("参数："+p.toString());
				}
			}
		}catch(Exception e){
			log.info(" 语句或参数打印出现异常，请及时处理！");
		}
	}
	
	@Override
    public <T> T getObject(Query<T> query) {
        Object[] param = checkNullParam(query.getQueryParameter());
        //showSQL(query,param);
        try {
            return getJdbcTemplate().queryForObject(query.getQueryString(),
                    new SpringObjectRowMapper<T>(query.getQueryClass()),
                    param);
        } catch (EmptyResultDataAccessException e) {
            throw new EmptyResultException(e);
        }
    }

    @Override
    public <T> List<T> listObjects(Query<T> query) {
        Object[] param = checkNullParam(query.getQueryParameter());
        //showSQL(query,param);
        return getJdbcTemplate().query(query.getQueryString(),
                new SpringObjectRowMapper<T>(query.getQueryClass()), param);
    }

    @Override
    public void execute(Executor executor) {
        Object[] param = checkNullParam(executor.getQueryParameter());
        getJdbcTemplate().update(executor.getQueryString(), param);
    }

    public void save(Object... objectArray) {
        checkNullOrEmpty(objectArray);
        Class<?> clazz = objectArray[0].getClass();
        SpringSqlCreator sqlCreator = new SpringSqlCreator(clazz);
        String sql = sqlCreator.createSaveSQL();
        for (Object userObject : objectArray) {
            getJdbcTemplate().update(sql, sqlCreator.createStatementSetter(userObject));
        }
    }

    public void update(Object... objectArray) {
        checkNullOrEmpty(objectArray);
        Class<?> clazz = objectArray[0].getClass();
        SpringSqlCreator sqlCreator = new SpringSqlCreator(clazz);
        String sql = sqlCreator.createUpdateSQL();
        for (Object userObject : objectArray) {
            getJdbcTemplate().update(sql, sqlCreator.createStatementSetter(userObject));
        }
    }

    public void delete(Object... objectArray) {
        checkNullOrEmpty(objectArray);
        Class<?> clazz = objectArray[0].getClass();
        SpringSqlCreator sqlCreator = new SpringSqlCreator(clazz);
        String sql = sqlCreator.createDeleteSQL();
        for (Object userObject : objectArray) {
            getJdbcTemplate().update(sql, sqlCreator.createStatementSetter(userObject));
        }
    }



    public void delete(Class<?> clazz, String... idArray) {
        SpringSqlCreator sqlCreator = new SpringSqlCreator(clazz);
        String sql = sqlCreator.createDeleteSQL();
        for (String id : idArray) {
            getJdbcTemplate().update(sql, id);
        }
    }

    private Object[] checkNullParam(Vector<Object> vector) {
        return vector == null ? new Object[0] : vector.toArray();
    }

    private void checkNullOrEmpty(Object... objects) {
        if(objects == null || objects.length == 0) {
            throw new DaoException("Need to save, update or delete objectArray can not be null or empty!");
        }
    }


}
