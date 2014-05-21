package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.CreditLog;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface CreditLogMapper extends BaseMapper<CreditLog, Integer> {
    List<CreditLog> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    int getTotalCount(BaseConditionVO vo);
}