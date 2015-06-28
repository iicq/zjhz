package com.nursery.dao.spring;

import com.nursery.dao.DaoException;

import org.springframework.jdbc.core.PreparedStatementSetter;

import java.lang.reflect.Field;
import java.util.Vector;

class SpringSqlCreator {

    private String tableName;
    private Field[] fields;
    private Vector<Field> params;
    private Class<?> itsClass;

    public SpringSqlCreator(Class<?> clazz) {
        itsClass = clazz;
        tableName = SpringHelper.getTableName(clazz);
        fields = clazz.getDeclaredFields();
        params = new Vector<Field>();
    }

    public PreparedStatementSetter createStatementSetter(Object object) {
        return new SpringPreparedStatementSetter(object, params);
    }

    public String createDeleteSQL() {
        String idColumnName = SpringHelper.getColumnName("id");
        params.add(getFieldByName("id"));
        return "delete from " + tableName + " where " + idColumnName + "=?";
    }

    private Field getFieldByName(String name) {
        try {
            return itsClass.getDeclaredField(name);
        } catch (NoSuchFieldException e) {
            throw  new DaoException(e);
        }
    }

    public String createUpdateSQL() {
        StringBuilder buffer = new StringBuilder("update ");
        buffer.append(tableName);
        buffer.append(" set ");

        Field idField = null;
        for (int i = 0; i < fields.length; i++) {
            String fieldName = fields[i].getName();
            if(fieldName.equals("id")) {
                idField = fields[i];
            } else {
                params.add(fields[i]);
                buffer.append(SpringHelper.getColumnName(fieldName)).append("=?");
                if (i != fields.length - 1) {
                    buffer.append(",");
                }
            }
        }
        params.add(idField);
        String idColumnName = SpringHelper.getColumnName("id");
        String sql = buffer.append(" where ").append(idColumnName).append("=?").toString();
        buffer.setLength(0);
        return sql;
    }



    public String createSaveSQL() {
        StringBuilder buffer = new StringBuilder("insert into ");
		StringBuilder temp = new StringBuilder();
		buffer.append(tableName);
		buffer.append(" (");
		for(int i = 0; i < fields.length; i++) {
            params.add(fields[i]);
			buffer.append(SpringHelper.getColumnName(fields[i].getName()));
			temp.append("?");
			if(i != fields.length - 1) {
				buffer.append(",");
				temp.append(",");
			}
		}
		buffer.append(") values (");
		buffer.append(temp);
		buffer.append(")");
        String result = buffer.toString();
		buffer.setLength(0);
		temp.setLength(0);
        return result;
    }
}
