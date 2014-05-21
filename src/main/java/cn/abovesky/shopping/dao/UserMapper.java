package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface UserMapper extends BaseMapper<User, Integer> {
    Integer countByUsername(String username);
    User findByUsername(String username);

    void addCredit(@Param("id") Integer id, @Param("credit") Integer credit);

    Integer getCreditByUserId(Integer id);

    List<User> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    void active(Integer[] id);

    void inactive(Integer[] id);

    int getTotalCount(BaseConditionVO vo);
}