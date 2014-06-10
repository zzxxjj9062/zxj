package cn.abovesky.shopping.web.common;

import cn.abovesky.shopping.base.BaseController;
import cn.abovesky.shopping.exception.ServiceException;
import cn.abovesky.shopping.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by snow on 2014/5/12.
 */
public class ComOrderController extends BaseController {
    @Autowired
    private IOrderService orderService;

    @RequestMapping("/cancel")
    public ModelAndView cancel(String[] ids) {
        try {
            orderService.cancel(ids, this.getMerchant() != null ? this.getMerchant().getStoreName() : "外卖联盟");
        } catch (ServiceException e) {
            return ajaxDoneError(e.getMessage());
        }
        return ajaxDoneSuccess("取消订单成功");
    }
}
