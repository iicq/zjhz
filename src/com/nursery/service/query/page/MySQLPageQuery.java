package com.nursery.service.query.page;

import com.nursery.service.query.AbstractPageQuery;

import java.util.Vector;

public abstract class MySQLPageQuery<T> extends AbstractPageQuery<T> {

    public MySQLPageQuery(String sql) {
        super(sql);
    }

    protected MySQLPageQuery(String sql, int index, int size) {
        super(sql, index, size);
    }

    @Override
    public String getQueryString() {
        String oldSql = super.getQueryString();
        return  "select A.* from (" + oldSql + ") A limit ?,?";
    }

    @Override
    public Vector<Object> getQueryParameter() {
        Vector<Object> vector = super.getQueryParameter();
        vector.add((getIndex() - 1) * getSize());
        vector.add(getSize());
        return vector;
    }
}
