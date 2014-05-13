package cn.abovesky.shopping.web;

import cn.abovesky.shopping.base.BaseController;
import cn.abovesky.shopping.common.constant.Constants;
import cn.abovesky.shopping.common.enums.LoginStatus;
import cn.abovesky.shopping.common.enums.UserType;
import cn.abovesky.shopping.domain.Admin;
import cn.abovesky.shopping.domain.LoginLog;
import cn.abovesky.shopping.domain.Merchant;
import cn.abovesky.shopping.service.IAdminService;
import cn.abovesky.shopping.service.ILoginLogService;
import cn.abovesky.shopping.service.IMerchantService;
import org.directwebremoting.Browser;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.Date;

/**
 * Created by snow on 2014/4/22.
 */
@Controller
@RequestMapping("/passport")
public class PassportController extends BaseController {
    @Autowired
    private IMerchantService merchantService;
    @Autowired
    private ILoginLogService loginLogService;
    @Autowired
    private IAdminService adminService;

    @RequestMapping("/merchant_login")
    public ModelAndView merchantLogin(Merchant merchant) {
        Merchant loginMerchant = merchantService.findByUsername(merchant.getUsername());
        LoginLog loginLog = new LoginLog();
        loginLog.setDate(new Date());
        loginLog.setIp(request.getRemoteAddr());
        loginLog.setUserType(UserType.MERCHANT.toString());
        if (loginMerchant != null && loginMerchant.getPassword().equals(DigestUtils.md5DigestAsHex(merchant.getPassword().getBytes()))) {
            loginMerchant.setPassword(null);
            request.getSession().setAttribute(Constants.LOGIN_MERCHANT, loginMerchant);
            loginLog.setUserId(loginMerchant.getId());
            loginLog.setStatus(LoginStatus.SUCCESS.toString());
            loginLogService.add(loginLog);
            return new ModelAndView("redirect:/merchant/index.html");
        } else {
            loginLog.setStatus(LoginStatus.FAIL.toString());
            loginLogService.add(loginLog);
            return new ModelAndView("index", "error", "用户名或密码错误");
        }
    }

    @RequestMapping("/merchant_logout")
    public ModelAndView merchantLogout() {
        ModelAndView modelAndView = new ModelAndView("redirect:/");
        final Merchant merchant = this.getMerchant();
        Browser.withAllSessionsFiltered(new ScriptSessionFilter() {
            public boolean match(ScriptSession session) {
                if (session.getAttribute("merchantId") == null || merchant == null)
                    return false;
                else
                    return (session.getAttribute("merchantId")).equals(String.valueOf(merchant.getId()));
            }
        }, new Runnable() {
            public void run() {
                Collection<ScriptSession> sessions = Browser.getTargetSessions();
                for (ScriptSession scriptSession : sessions) {
                    scriptSession.invalidate();
                }
            }
        });
        request.getSession().invalidate();
        return modelAndView;
    }

    @RequestMapping("manage_login")
    public ModelAndView manageLogin(Admin admin) {
        Admin loginAdmin = adminService.findByUsername(admin.getUsername());
        LoginLog loginLog = new LoginLog();
        loginLog.setDate(new Date());
        loginLog.setIp(request.getRemoteAddr());
        loginLog.setUserType(UserType.MANAGEMENT.toString());
        if (loginAdmin != null && loginAdmin.getPassword().equals(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()))) {
            loginAdmin.setPassword(null);
            request.getSession().setAttribute(Constants.LOGIN_ADMIN, loginAdmin);
            loginLog.setUserId(loginAdmin.getId());
            loginLog.setStatus(LoginStatus.SUCCESS.toString());
            loginLogService.add(loginLog);
            return new ModelAndView("redirect:/manage/index.html");
        } else {
            loginLog.setStatus(LoginStatus.FAIL.toString());
            loginLogService.add(loginLog);
            return new ModelAndView("manageLogin", "info", "用户名或密码错误");
        }
    }

    @RequestMapping("/manage_logout")
    public String manageLogout() {
        request.getSession().invalidate();
        return "redirect:/manageLogin.html";
    }
}
