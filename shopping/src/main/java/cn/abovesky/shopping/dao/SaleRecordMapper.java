package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.Goods;
import cn.abovesky.shopping.domain.SaleRecord;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface SaleRecordMapper extends BaseMapper<SaleRecord, Integer> {
    Float countTotalPrice(BaseConditionVO vo);
    Integer countNumber(BaseConditionVO vo);

    List<Goods> getGoodsRecommend(@Param("date") String date, RowBounds rb);
}