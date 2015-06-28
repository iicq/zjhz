package com.nursery.service.query.page;

import com.nursery.service.query.AbstractPageQuery;

import java.util.Vector;

public abstract class OraclePageQuery<T> extends AbstractPageQuery<T> {


    public OraclePageQuery(String sql) {
        super(sql);
    }

    protected OraclePageQuery(String sql, int index, int size) {
        super(sql, index, size);
    }

    @Override
    public String getQueryString() {
        String oldSql = super.getQueryString();
        return  "select * from (select A.*, rownum as rn from (" + oldSql + ") A where rownum<=?) where rn>?";
    }

    @Override
    public Vector<Object> getQueryParameter() {
        Vector<Object> vector = super.getQueryParameter();
        vector.add(getIndex() * getSize());
        vector.add((getIndex() - 1) * getSize());
        return vector;
    }
}
