package com.nursery.dao.spring;

import java.sql.SQLException;


class SpringSQLException extends SQLException {


    public SpringSQLException(String reason, Throwable cause) {
        super(reason, cause);
    }
}
