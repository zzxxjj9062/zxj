package cn.abovesky.shopping.service.impl;

import cn.abovesky.shopping.dao.LoginLogMapper;
import cn.abovesky.shopping.domain.LoginLog;
import cn.abovesky.shopping.service.ILoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by snow on 2014/4/22.
 */
@Transactional(rollbackFor = Exception.class)
@Service(ILoginLogService.SERVICE_NAME)
public class LoginLogServiceImpl implements ILoginLogService {
    @Autowired
    private LoginLogMapper loginLogMapper;

    @Override
    public void add(LoginLog loginLog) {
        loginLogMapper.insert(loginLog);
    }
}
