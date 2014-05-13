package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.GoodsCollection;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface GoodsCollectionMapper extends BaseMapper<GoodsCollection, Integer> {
    Integer countByUserIdAndGoodsId(GoodsCollection goodsCollection);

    Integer cancel(GoodsCollection goodsCollection);

    List<GoodsCollection> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);
}