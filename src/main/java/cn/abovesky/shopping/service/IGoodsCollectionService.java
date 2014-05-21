package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.GoodsCollection;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/5/3.
 */
public interface IGoodsCollectionService {
    static final String SERVICE_NAME = "goodsCollectionService";
    void add(GoodsCollection goodsCollection) throws ServiceException;

    void cancel(GoodsCollection goodsCollection) throws ServiceException;

    List<GoodsCollection> search(BaseConditionVO vo);

    boolean isExist(GoodsCollection goodsCollection);
}
