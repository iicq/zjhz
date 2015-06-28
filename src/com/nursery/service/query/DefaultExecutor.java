package com.nursery.service.query;

import com.nursery.dao.Executor;

import java.util.Vector;

public class DefaultExecutor implements Executor {
    private String sql;
    private Vector<Object> params;

    public DefaultExecutor(String sql) {
        this.sql = sql;
    }

    public void setSQL(String sql) {
        this.sql = sql;
    }

    public void addParam(Object object) {
        noNullParam();
        params.add(object);
    }

    private void noNullParam() {
        if(params == null) {
            params = new Vector<Object>();
        }
    }
    @Override
    public String getQueryString() {
        return sql;
    }

    @Override
    public Vector<Object> getQueryParameter() {
        noNullParam();
        return params;
    }
}
