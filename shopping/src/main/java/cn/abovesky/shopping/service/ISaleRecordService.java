package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.Goods;

import java.util.List;

/**
 * Created by snow on 2014/5/8.
 */
public interface ISaleRecordService {
    static final String SERVICE_NAME = "saleRecordService";
    Float countTotalPrice(BaseConditionVO vo, String status);
    Integer countNumber(BaseConditionVO vo, String status);
    List<Goods> getGoodsRecommend(Integer size);
}
