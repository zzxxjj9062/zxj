package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.GoodsType;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface GoodsTypeMapper extends BaseMapper<GoodsType, Integer> {
    List<GoodsType> findAll();
    Integer countByName(String name);
    List<GoodsType> findByMerchantId(Integer merchantId);

    List<GoodsType> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    int delete(Integer[] ids);

    int getTotalCount(BaseConditionVO vo);
}