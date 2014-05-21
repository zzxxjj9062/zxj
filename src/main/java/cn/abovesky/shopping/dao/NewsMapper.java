package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.News;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface NewsMapper extends BaseMapper<News, Integer> {
    List<News> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    int delete(Integer[] ids);

    int getTotalCount(BaseConditionVO vo);
}