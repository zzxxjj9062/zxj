package cn.abovesky.shopping.service.impl;

import cn.abovesky.shopping.dao.AdminMapper;
import cn.abovesky.shopping.domain.Admin;
import cn.abovesky.shopping.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by snow on 2014/5/11.
 */
@Transactional(rollbackFor = Exception.class)
@Service(IAdminService.SERVICE_NAME)
public class AdminSerivceImpl implements IAdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin findByUsername(String username) {
        return adminMapper.findByUsername(username);
    }
}
