package cn.abovesky.shopping.service.impl;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.common.constant.Constants;
import cn.abovesky.shopping.common.enums.OrderStatus;
import cn.abovesky.shopping.dao.*;
import cn.abovesky.shopping.domain.*;
import cn.abovesky.shopping.dwr.Push;
import cn.abovesky.shopping.exception.ServiceException;
import cn.abovesky.shopping.service.IOrderService;
import cn.abovesky.shopping.util.IdStatusSplitUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by snow on 2014/4/29.
 */
@Transactional(rollbackFor = Exception.class)
@Service(IOrderService.SERVICE_NAME)
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private CreditLogMapper creditLogMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private MerchantMapper merchantMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SaleRecordMapper saleRecordMapper;
    @Autowired
    private RemarkMapper remarkMapper;

    @Override
    public void add(List<OrderDetail> orderDetails, Order order) throws ServiceException {
        if (orderDetails == null || orderDetails.size() < 1) {
            throw new ServiceException("订单数为0");
        } else {
            Iterator<OrderDetail> iterator = orderDetails.iterator();
            Integer orderId = null;
            Set<String> merchantIdSet = new HashSet<String>();
            while (iterator.hasNext()) {
                OrderDetail orderDetail = iterator.next();
                Goods goods = goodsMapper.findNameAndNumberById(orderDetail.getGoodsId());
                if (goods.getNumber() >= orderDetail.getNumber()) {
                    if (orderId == null) {
                        Date now = new Date();
                        order.setDate(now);
                        order.setOrderNumber(new SimpleDateFormat("yyyyMMddHHmmssSSSS").format(now));
                        orderMapper.insert(order);
                        orderId = order.getId();
                    }
                    merchantIdSet.add(String.valueOf(orderDetail.getMerchantId()));
                    orderDetail.setStatus(OrderStatus.WAITING.toString());
                    orderDetail.setOrderId(orderId);
                    orderDetailMapper.insert(orderDetail);
                    Goods updateGoods = new Goods();
                    updateGoods.setId(orderDetail.getGoodsId());
                    updateGoods.setNumber(goods.getNumber() - orderDetail.getNumber());
                    goodsMapper.updateByPrimaryKeySelective(updateGoods);
                } else {
                    throw new ServiceException(goods.getName() + "数量不足");
                }
            }
            for (String merchantId : merchantIdSet) {
                Push.sendMessageAuto(merchantId, "您有新订单");
            }
        }
    }

    @Override
    public List<OrderDetail> search(BaseConditionVO vo) {
        RowBounds rb = new RowBounds(vo.getStartIndex(), vo.getPageSize());
        List<OrderDetail> orderDetailList = orderDetailMapper.findPageBreakByCondition(vo, rb);
        vo.setTotalCount(orderDetailMapper.getTotalCount(vo));
        return orderDetailList;
    }

    @Override
    public void confirmSend(String[] ids) throws ServiceException {
        if (IdStatusSplitUtils.isFormatSecret(ids, OrderStatus.WAITING.toString())) {
            Date now = new Date();
            for (String value : ids) {
                orderDetailMapper.confirmSendWithId(Integer.valueOf(value.split("_")[0]));
                SaleRecord saleRecord = new SaleRecord();
                saleRecord.setDate(now);
                saleRecord.setNumber(Integer.valueOf(value.split("_")[5]));
                saleRecord.setMerchantId(Integer.valueOf(value.split("_")[6]));
                saleRecord.setGoodsId(Integer.valueOf(value.split("_")[3]));
                saleRecord.setTotalPrice(Float.valueOf(value.split("_")[4]));
                saleRecordMapper.insert(saleRecord);
                goodsMapper.addSaleCount(saleRecord.getGoodsId(), saleRecord.getNumber());
                merchantMapper.addSaleCount(saleRecord.getMerchantId(), saleRecord.getNumber());
                CreditLog creditLog = new CreditLog();
                creditLog.setUserId(Integer.valueOf(value.split("_")[2]));
                creditLog.setNumber(Integer.valueOf(new BigDecimal(saleRecord.getTotalPrice()).setScale(0, BigDecimal.ROUND_HALF_UP).toString()));
                creditLog.setDate(now);
                creditLog.setDescription(Constants.CREDITLOG_ORDER);
                creditLogMapper.insert(creditLog);
                userMapper.addCredit(creditLog.getUserId(), creditLog.getNumber());
            }
        } else {
            throw new ServiceException("只能确认等待配送的订单");
        }
    }

    @Override
    public void cancel(String[] ids) throws ServiceException {
        if (IdStatusSplitUtils.isFormatSecret(ids, OrderStatus.WAITING.toString())) {
            for (String value : ids) {
                orderDetailMapper.cancel(Integer.valueOf(value.split("_")[0]));
                goodsMapper.addNumber(Integer.valueOf(value.split("_")[3]), Integer.valueOf(value.split("_")[5]));
            }
        } else {
            throw new ServiceException("只能取消等待配送的订单");
        }
    }

    @Override
    public void confirmAndRemark(Remark remark, Integer orderId) throws ServiceException {
        if (!OrderStatus.SENDING.toString().equals(orderDetailMapper.findStatusById(orderId))) {
            throw new ServiceException("订单状态不是已配送");
        } else {
            Date now = new Date();
            orderDetailMapper.confirm(orderId);
            remark.setDate(now);
            remarkMapper.insert(remark);
            goodsMapper.addRemarkCount(remark.getGoodsId());
            CreditLog creditLog = new CreditLog();
            creditLog.setDate(now);
            creditLog.setDescription(Constants.CREDITLOG_REMARK);
            creditLog.setNumber(Constants.REMARK_CREDIT);
            creditLog.setUserId(remark.getUserId());
            creditLogMapper.insert(creditLog);
            userMapper.addCredit(creditLog.getUserId(), creditLog.getNumber());
        }
    }

    @Override
    public void send(String[] ids) throws ServiceException {
        if (IdStatusSplitUtils.isFormatSecret(ids, OrderStatus.CONFIRMSEND.toString())) {
            for (String value : ids) {
                orderDetailMapper.send(Integer.valueOf(value.split("_")[0]));
            }
        } else {
            throw new ServiceException("只能操作确认配送的订单");
        }
    }

}
