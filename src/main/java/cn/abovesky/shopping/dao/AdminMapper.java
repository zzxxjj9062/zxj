package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.Admin;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface AdminMapper extends BaseMapper<Admin, Integer> {
    Admin findByUsername(String username);

    List<Admin> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    void active(Integer[] ids);

    void inactive(Integer[] id);

    int getTotalCount(BaseConditionVO vo);
}