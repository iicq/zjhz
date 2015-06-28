package com.nursery.dao;

import java.util.List;


public interface ObjectDao {

    /**
     *
     * @param objects     save
     */
    void save(Object... objects);

    /**
     *
     * @param objects delete
     */
    void delete(Object... objects);

    /**
     *
     * @param clazz         class
     * @param ids           ids
     */
    void delete(Class<?> clazz, String... ids);

    /**
     *
     * @param objects update
     */
    void update(Object... objects);

    /**
     *
     * @param executor execute
     */
    void execute(Executor executor);

    /**
     *
     * @param query   condition
     * @return result
     * @throws EmptyResultException
     */
    <T> T getObject(Query<T> query);

    /**
     *
     * @param query     condition
     * @return a list
     */
    <T> List<T> listObjects(Query<T> query);

}
