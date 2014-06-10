package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.Order;
import cn.abovesky.shopping.domain.OrderDetail;
import cn.abovesky.shopping.domain.Remark;
import cn.abovesky.shopping.exception.ServiceException;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by snow on 2014/4/29.
 */
public interface IOrderService {
    static final String SERVICE_NAME = "orderService";

    void add(List<OrderDetail> orderDetails, Order order) throws ServiceException;

    List<OrderDetail> search(BaseConditionVO vo);

    void confirmSend(String[] ids, String storeName) throws ServiceException, UnsupportedEncodingException;

    void cancel(String[] ids, String storeName) throws ServiceException;

    void confirmAndRemark(Remark remark, Integer orderId) throws ServiceException;

    void send(String[] ids) throws ServiceException;

    boolean isExistWaitOrder(Integer merchantId);
}
