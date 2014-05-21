package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.SaleCount;

import java.util.List;

/**
 * Created by snow on 2014/5/7.
 */
public interface SaleCountMapper {
    List<SaleCount> saleCount(BaseConditionVO vo);
    List<SaleCount> findTopTen(BaseConditionVO vo);
}
