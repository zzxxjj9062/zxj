package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.OrderDetail;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface OrderDetailMapper extends BaseMapper<OrderDetail, Integer> {

    List<OrderDetail> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    void cancel(Integer id);

    void confirmSendWithId(Integer id);

    String findStatusById(Integer id);

    void confirm(Integer id);

    void send(Integer id);

    int getTotalCount(BaseConditionVO vo);

    int countWaitOrderByMerchantId(Integer merchantId);
}