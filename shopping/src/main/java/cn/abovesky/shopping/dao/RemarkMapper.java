package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.Remark;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface RemarkMapper extends BaseMapper<Remark, Integer> {

    List<Remark> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);
}