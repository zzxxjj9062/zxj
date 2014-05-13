package cn.abovesky.shopping.web.management;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseController;
import cn.abovesky.shopping.common.enums.MerchantStatus;
import cn.abovesky.shopping.domain.Merchant;
import cn.abovesky.shopping.exception.ServiceException;
import cn.abovesky.shopping.service.IMerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by snow on 2014/5/13.
 */
@Controller
@RequestMapping("/manage/merchant")
public class AMerchantController extends BaseController {
    @Autowired
    private IMerchantService merchantService;

    @RequestMapping("/list")
    public ModelAndView list(@ModelAttribute("vo") BaseConditionVO vo) {
        ModelAndView modelAndView = new ModelAndView("management/merchant/list");
        List<Merchant> merchantList = merchantService.findPageBreakByCondition(vo);
        modelAndView.addObject("merchantList", merchantList);
        modelAndView.addObject("merchantStatus", MerchantStatus.values());
        return modelAndView;
    }

    @RequestMapping("/edit/{item_id}")
    public ModelAndView list(@PathVariable("item_id") Integer merchantId) {
        ModelAndView modelAndView = new ModelAndView("management/merchant/info");
        Merchant merchant = merchantService.findById(merchantId);
        modelAndView.addObject("merchant", merchant);
        return modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(@RequestParam("imageFile") MultipartFile image, Merchant merchant) {
        try {
            merchantService.update(image, merchant, this.getMerchantImagePath());
        } catch (ServiceException e) {
            return ajaxDoneError("修改失败");
        }
        return ajaxDoneSuccessAndClose("修改成功", "merchant_list");
    }

    @RequestMapping("/active")
    public ModelAndView active(String[] ids) {
        try {
            merchantService.active(ids);
        } catch (ServiceException e) {
            return ajaxDoneError(e.getMessage());
        }
        return ajaxDoneSuccess("操作成功");
    }

    @RequestMapping("/inactive")
    public ModelAndView inactive(String[] ids) {
        try {
            merchantService.inactive(ids);
        } catch (ServiceException e) {
            return ajaxDoneError(e.getMessage());
        }
        return ajaxDoneSuccess("操作成功");
    }
}