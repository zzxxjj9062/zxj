package cn.abovesky.shopping.service;

import cn.abovesky.shopping.domain.Admin;

/**
 * Created by snow on 2014/5/11.
 */
public interface IAdminService {
    static final String SERVICE_NAME = "adminService";
    Admin findByUsername(String username);
}
