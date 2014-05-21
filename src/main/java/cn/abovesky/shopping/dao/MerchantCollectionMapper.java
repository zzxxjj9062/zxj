package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.MerchantCollection;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MerchantCollectionMapper extends BaseMapper<MerchantCollection, Integer> {
    Integer countByUserIdAndMerchantId(MerchantCollection merchantCollection);

    Integer cancel(MerchantCollection merchantCollection);

    List<MerchantCollection> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    int getTotalCount(BaseConditionVO vo);
}