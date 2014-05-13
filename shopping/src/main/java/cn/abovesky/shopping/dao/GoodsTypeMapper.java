package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.GoodsType;

import java.util.List;

public interface GoodsTypeMapper extends BaseMapper<GoodsType, Integer> {
    List<GoodsType> findAll();
    Integer countByName(String name);
    List<GoodsType> findByMerchantId(Integer merchantId);
}