package com.nursery.model;

import java.io.Serializable;

public class RolePower implements Serializable {
    /**
     * role_power.id
     * @ibatorgenerated 2014-05-04 16:17:19
     */
    private String id;

    /**
     * role_power.role_id
     * @ibatorgenerated 2014-05-04 16:17:19
     */
    private String roleId;

    /**
     * role_power.power_id
     * @ibatorgenerated 2014-05-04 16:17:19
     */
    private String powerId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getPowerId() {
        return powerId;
    }

    public void setPowerId(String powerId) {
        this.powerId = powerId;
    }
}