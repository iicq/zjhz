package com.nursery.dao.spring;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


class SpringObjectRowMapper<T> implements RowMapper<T> {
    protected static Logger logger = Logger.getLogger(SpringObjectRowMapper.class);

    private Class<T> clazz;

    protected SpringObjectRowMapper(Class<T> clazz) {
        this.clazz = clazz;
    }

    public T mapRow(ResultSet rs, int rowNum) throws SQLException {
        try {
            return mapRowForSimple(rs);
        } catch (UnsupportedOperationException e) {
            return mapRowForBean(rs);
        }
    }

    protected T mapRowForSimple(ResultSet rs) throws SQLException {
        Object value = rs.getObject(1);
        if(clazz == int.class || clazz == Integer.class) {
            return (T) Integer.valueOf(value.toString());
        } else if(clazz == boolean.class || clazz == Boolean.class) {
            return (T) (value.toString().equals("1") ? Boolean.TRUE : Boolean.FALSE);
        } else if(value instanceof Clob) {
            String clobString = getClobString((Clob) value);
            return (T) clobString;
        } else if(clazz == float.class || clazz == Float.class){
            return (T) Float.valueOf(value.toString());
        } else if(clazz == long.class || clazz == Long.class){
            return (T) Long.valueOf(value.toString());
       } else if(clazz == String.class){
            return (T) value;
        } else if(clazz == Vector.class) {
            Vector<Object> vector = new Vector<Object>();
            for(int i = 1; true ; i++) {
                try {
                    Object object = rs.getObject(i);
                    vector.add(object);
                } catch (SQLException e) {
                    e.printStackTrace();
                    break;
                }

            }
            return (T) vector;
        }
        throw new UnsupportedOperationException();
    }

    protected T mapRowForBean(ResultSet rs) throws SQLException {
        T t = createT();
        for(Class c = clazz; c != Object.class; c = c.getSuperclass()) {
            mapRowForBean2(rs, c, t);
        }
        return t;
    }

    private void mapRowForBean2(ResultSet rs, Class<?> clazz, T t) throws SQLException {
        Field[] fields = clazz.getDeclaredFields();
        for(Field field : fields) {
            Object object;
            try {
                object = rs.getObject(field.getName());
            } catch (SQLException e) {
                // this property not be find from database
                String column = SpringHelper.getColumnName(field.getName());
                try {
                    object = rs.getObject(column);
                } catch (SQLException e1) {
                    continue;
                }
            }
            if(object == null) {
                continue;
            }
            try {
                setValue(t, field, object);
            } catch (IllegalAccessException e) {
                String reason = "When query database, get value[" + clazz.getName() + "] happened!";
                logger.error(reason, e);
                throw new SpringSQLException(reason, e);
            }
        }
    }

    private T createT() throws SpringSQLException {
        try {
            return clazz.newInstance();
        } catch (InstantiationException e) {
            String reason = "When query database, get value[" + clazz.getName() + "] happened!";
            logger.error(reason, e);
            throw new SpringSQLException(reason, e);
        } catch (IllegalAccessException e) {
            String reason = "When query database, get value[" + clazz.getName() + "] happened!";
            logger.error(reason, e);
            throw new SpringSQLException(reason, e);
        }
    }

    private static void setValue(Object o, Field field, Object value) throws IllegalAccessException, SQLException {
        field.setAccessible(true);
        Class<?> clazz = field.getType();
        if(clazz.isEnum()) {
            try {
                Method method = clazz.getMethod("valueOf", String.class);
                Object object = method.invoke(clazz, value.toString());
                field.set(o, object);
            } catch (NoSuchMethodException e) {
                //
            } catch (InvocationTargetException e) {
                //
            }

        } else if(clazz == int.class || clazz == Integer.class) {
            field.set(o, new Integer(value.toString()));
        } else if(clazz == boolean.class || clazz == Boolean.class) {
            if("0".equals(value)) {
                field.set(o,  false);
            } else {
                field.set(o,  true);
            }
        } else if(value instanceof Clob) {
            String clobString = getClobString((Clob) value);
            field.set(o, clobString);
        } else if(clazz == float.class || clazz == Float.class){
            field.set(o, new Float(value.toString()));
        } else if(clazz == long.class || clazz == Long.class){
            field.set(o, new Long(value.toString()));
        } else {
            field.set(o, value.toString());
        }
    }


    private static String getClobString(Clob clob) throws SQLException {
        Reader reader = clob.getCharacterStream();
        try {
            return getReaderString(reader);
        } catch (IOException e) {
            throw new SpringSQLException("Read clob string error", e);
        }
    }


    private static String getReaderString(Reader reader) throws IOException {
        StringBuffer buffer = new StringBuffer();
        try {
            char[] chars = new char[1024 * 4];
            int len;
            while((len = reader.read(chars)) != -1) {
                buffer.append(chars, 0, len);
            }
            String result = buffer.toString();
            buffer.setLength(0);
            return result;
        } finally {
            if(reader != null) reader.close();
        }
    }

}
