package com.nursery.dao;

import java.util.Vector;

public interface Executor {
    String getQueryString();
    Vector<Object> getQueryParameter();
}
