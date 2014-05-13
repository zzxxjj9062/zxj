package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper extends BaseMapper<User, Integer> {
    Integer countByUsername(String username);
    User findByUsername(String username);

    void addCredit(@Param("id") Integer id, @Param("credit") Integer credit);

    Integer getCreditByUserId(Integer id);
}