package com.nursery.service.query;


public class CountQuery extends AbstractQuery<Long> {
    @Override
    public Class<Long> getQueryClass() {
        return Long.class;
    }

    public CountQuery(String sql) {
        super(sql);
    }
}
