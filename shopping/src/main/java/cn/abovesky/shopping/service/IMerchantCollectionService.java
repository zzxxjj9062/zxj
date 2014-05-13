package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.MerchantCollection;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/5/3.
 */
public interface IMerchantCollectionService {
    static final String SERVICE_NAME = "merchantCollectionService";
    void add(MerchantCollection merchantCollection) throws ServiceException;

    void cancel(MerchantCollection merchantCollection) throws ServiceException;

    List<MerchantCollection> search(BaseConditionVO vo);
}
