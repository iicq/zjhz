package com.nursery.service.query;

import org.springframework.stereotype.Service;

import com.nursery.service.query.page.MySQLPageQuery;
import com.nursery.service.query.page.OraclePageQuery;

@Service
public class PageQueryFactory {

    public static final String ORACLE_DIALECT = "oracle";
    public static final String MYSQL_DIALECT = "mysql";

    public <T> AbstractPageQuery<T> createPageQuery(Class<T> clazz, String sql, int index, int size) {
        if(ORACLE_DIALECT.equals(getDialect())) {
            return new DefaultOracleQuery(sql, index, size, clazz);
        }
        if(MYSQL_DIALECT.equals(getDialect())) {
            return new DefaultMySQLQuery(sql, index, size, clazz);
        }
        throw new UnsupportedOperationException("Unknown dialect[" + getDialect() + "]");
    }
    class DefaultOracleQuery<T> extends OraclePageQuery<T> {
        private Class<T> queryClass;

        DefaultOracleQuery(String sql, Class<T> queryClass) {
            super(sql);
            this.queryClass = queryClass;
        }

        DefaultOracleQuery(String sql, int index, int size, Class<T> queryClass) {
            super(sql, size, index);
            this.queryClass = queryClass;
        }

        @Override
        public Class<T> getQueryClass() {
            return queryClass;
        }
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

    public String getDialect() {
        return dialect;
    }

    public void setDialect(String dialect) {
        this.dialect = dialect;
    }

    private String dialect;
}
