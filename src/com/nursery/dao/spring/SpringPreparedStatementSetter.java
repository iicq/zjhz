package com.nursery.dao.spring;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;
import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

class SpringPreparedStatementSetter implements PreparedStatementSetter {
    private static Logger logger = Logger.getLogger(SpringPreparedStatementSetter.class);
    private Object userObject;
    private Vector<Field> params;

    SpringPreparedStatementSetter(Object userObject, Vector<Field> params) {
        this.userObject = userObject;
        this.params = params;
    }

    public void setValues(PreparedStatement ps) throws SQLException {
        int count = 1;
        for(Field field : params) {
            Object object = getValue(field);
            if(field.getType().isEnum()) {
                ps.setObject(count++, object.toString());
            } else {
                ps.setObject(count++, object);
            }

        }
    }

    private Object getValue(Field field) throws SpringSQLException {
        field.setAccessible(true);
        try {
            return  field.get(userObject);
        } catch (IllegalAccessException e) {
            String reason = "When update database, get value[" + userObject.getClass() + "." + field.getName() + "] happened!";
            logger.error(reason, e);
            throw new SpringSQLException(reason, e);
        }
    }
}
