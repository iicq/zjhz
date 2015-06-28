package com.nursery.service.query;

import com.nursery.dao.Query;

public abstract class AbstractQuery<T> extends DefaultExecutor implements Query<T> {

    public AbstractQuery(String sql) {
        super(sql);
    }
}
