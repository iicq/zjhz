package com.nursery.dao;

public interface PageQuery<T> extends Query<T> {
    int getIndex();
    int getSize();
}
