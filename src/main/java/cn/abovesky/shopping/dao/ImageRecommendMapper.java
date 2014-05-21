package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.ImageRecommend;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface ImageRecommendMapper extends BaseMapper<ImageRecommend, Integer> {

    List<ImageRecommend> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    List<ImageRecommend> findAll();

    int getTotalCount(BaseConditionVO vo);
}