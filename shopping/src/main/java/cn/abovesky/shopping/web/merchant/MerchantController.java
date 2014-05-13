package cn.abovesky.shopping.web.merchant;

import cn.abovesky.shopping.base.BaseController;
import cn.abovesky.shopping.domain.Merchant;
import cn.abovesky.shopping.exception.ServiceException;
import cn.abovesky.shopping.service.IMerchantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by snow on 2014/4/20.
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController extends BaseController {
    @Autowired
    private IMerchantService merchantService;

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("merchant_system/index");
        modelAndView.addObject("storeImage", merchantService.getImageById(this.getMerchant().getId()));
        return modelAndView;
    }

    @RequestMapping("/changePwdView")
    public String changePwdView() {
        return "merchant_system/merchant/changePwd";
    }

    @RequestMapping("/changePwd")
    public ModelAndView changPwd(String oldPassword, String newPassword) {
        try {
            merchantService.changePwd(this.getMerchant().getId(), oldPassword, newPassword);
            return ajaxDoneSuccessAndClose("修改成功", "");
        } catch (ServiceException e) {
            return ajaxDoneError(e.getMessage());
        }
    }

    @RequestMapping("/infoView")
    public ModelAndView infoView() {
        ModelAndView modelAndView = new ModelAndView("merchant_system/merchant/info");
        Merchant merchant = merchantService.findById(this.getMerchant().getId());
        modelAndView.addObject("merchant", merchant);
        return modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(@RequestParam("imageFile") MultipartFile image, Merchant merchant) {
        try {
            merchantService.update(image, merchant, this.getMerchantImagePath());
            return ajaxDoneSuccessAndClose("修改成功", "");
        } catch (ServiceException e) {
            return ajaxDoneError("修改失败");
        }
    }
}
