package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.Admin;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/5/11.
 */
public interface IAdminService {
    static final String SERVICE_NAME = "adminService";
    Admin findByUsername(String username);

    List<Admin> search(BaseConditionVO vo);

    Admin findById(Integer id);

    void update(Admin admin) throws ServiceException;

    void active(String[] ids) throws ServiceException;

    void inactive(String[] ids) throws ServiceException;

    void resetPwd(String[] ids);

    void add(Admin admin) throws ServiceException;

    String checkUsername(String username);

    void changePwd(Integer id, String oldPassword, String newPassword) throws ServiceException;
}
