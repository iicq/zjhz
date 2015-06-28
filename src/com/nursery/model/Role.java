package com.nursery.model;

import java.io.Serializable;

public class Role implements Serializable {
    /**
     * `role`.id
     * @ibatorgenerated 2014-05-04 16:17:19
     */
    private String id;

    /**
     * `role`.name
     * @ibatorgenerated 2014-05-04 16:17:19
     */
    private String name;

    /**
     * `role`.intro
     * @ibatorgenerated 2014-05-04 16:17:19
     */
    private String intro;

    
    public String getId() {
        return id;
    }

    public Role setId(String id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Role setName(String name) {
        this.name = name;
        return this;
    }

    public String getIntro() {
        return intro;
    }

    public Role setIntro(String intro) {
        this.intro = intro;
        return this;
    }
}