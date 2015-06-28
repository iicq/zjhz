package com.nursery.dao;

public interface Query<T> extends Executor {
    Class<T> getQueryClass();
}
