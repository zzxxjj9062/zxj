package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.SaleCount;

import java.util.List;
import java.util.Map;

/**
 * Created by snow on 2014/5/7.
 */
public interface ISaleCountService {
    static final String SERVICE_NAME = "saleCountService";
    Map<String, Object> saleCount(BaseConditionVO vo);
    List<SaleCount> findTopTen(BaseConditionVO vo);
}
