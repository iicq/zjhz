package com.nursery.service.query;

import com.nursery.dao.PageQuery;


public abstract class AbstractPageQuery<T> extends AbstractQuery<T> implements PageQuery<T> {
    public AbstractPageQuery(String sql) {
        this(sql, 0, 0, true);
    }
    public AbstractPageQuery(String sql, int size, int index) {
        this(sql, index, size, true);
    }

    protected AbstractPageQuery(String sql, int index, int size, boolean page) {
        super(sql);
        this.index = index;
        this.size = size;
        this.page = page;
    }

    private int index;
    private int size;
    private boolean page;

    public boolean isPage() {
        return page;
    }

    public void setPage(boolean page) {
        this.page = page;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
