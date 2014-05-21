package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.GoodsType;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/4/24.
 */
public interface IGoodsTypeService {
    static final String SERVICE_NAME = "goodsTypeService";

    List<GoodsType> findAll();

    void add(GoodsType goodsType) throws ServiceException;

    List<GoodsType> findByMerchantId(Integer merchantId);

    List<GoodsType> search(BaseConditionVO vo);

    GoodsType findById(Integer id);

    void update(GoodsType goodsType) throws ServiceException;

    void delete(Integer[] ids) throws ServiceException;
}
