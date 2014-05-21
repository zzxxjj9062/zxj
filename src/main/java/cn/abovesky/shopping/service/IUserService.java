package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.User;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/4/26.
 */
public interface IUserService {
    static final String SERVICE_NAME = "userService";
    void add(User user) throws ServiceException;
    Integer countByUsername(String username);

    User findByUsername(String username);

    void update(User user);

    void editPwd(User user, String newPwd) throws ServiceException;

    Integer getCreditByUserId(Integer userId);

    User findById(Integer userId);

    List<User> search(BaseConditionVO vo);

    void active(String[] ids) throws ServiceException;

    void inactive(String[] ids) throws ServiceException;

    void resetPwd(String[] ids);
}
