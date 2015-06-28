package com.nursery.model;

import java.io.Serializable;

public class AdminRole implements Serializable {
    /**
     * admin_role.id
     * @ibatorgenerated 2014-05-04 16:17:20
     */
    private String id;

    /**
     * admin_role.admin_id
     * @ibatorgenerated 2014-05-04 16:17:20
     */
    private String adminId;

    /**
     * admin_role.role_id
     * @ibatorgenerated 2014-05-04 16:17:20
     */
    private String roleId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}