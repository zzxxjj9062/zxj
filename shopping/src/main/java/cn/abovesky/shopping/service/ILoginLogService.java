package cn.abovesky.shopping.service;

import cn.abovesky.shopping.domain.LoginLog;

/**
 * Created by snow on 2014/4/22.
 */
public interface ILoginLogService {
    static final String SERVICE_NAME = "loginLogService";
    void add(LoginLog loginLog);
}
