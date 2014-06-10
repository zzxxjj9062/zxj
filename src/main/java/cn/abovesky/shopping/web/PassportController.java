package cn.abovesky.shopping.web;

import cn.abovesky.shopping.base.BaseController;
import cn.abovesky.shopping.common.constant.Constants;
import cn.abovesky.shopping.common.enums.LoginStatus;
import cn.abovesky.shopping.common.enums.MerchantStatus;
import cn.abovesky.shopping.common.enums.UserType;
import cn.abovesky.shopping.domain.Admin;
import cn.abovesky.shopping.domain.LoginLog;
import cn.abovesky.shopping.domain.Merchant;
import cn.abovesky.shopping.exception.ServiceException;
import cn.abovesky.shopping.service.*;
import org.directwebremoting.Browser;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

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
    @Autowired
    private IAppService appService;
    @Autowired
    private IOrderService orderService;

    @RequestMapping("/merchant_login")
    public ModelAndView merchantLogin(Merchant merchant) {
        LoginLog loginLog = new LoginLog();
        loginLog.setDate(new Date());
        loginLog.setIp(request.getRemoteAddr());
        loginLog.setUserType(UserType.MERCHANT.toString());
        Map<String, String> map = new HashMap<String, String>();
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("apkUrl", appService.getNewestUrl());
        //判断是否为空,格式是否正确,验证码是否正确
        if (this.isInfoError(merchant.getCode(), "#code", modelAndView, map) ||
            this.isInfoError(merchant.getUsername(), "#username", modelAndView, map) ||
            this.isInfoError(merchant.getPassword(), "#password", modelAndView, map) ||
            this.isValidateCodeError(merchant.getCode(), modelAndView, map)) {
            loginLog.setStatus(LoginStatus.FAIL.toString());
            loginLogService.add(loginLog);
            return modelAndView;
        }
        Merchant loginMerchant = merchantService.findByUsername(merchant.getUsername());
        //判断用户名是否存在
        if (loginMerchant != null) {
            loginLog.setUserId(loginMerchant.getId());
            //判断密码是否正确
            if (loginMerchant.getPassword().equals(DigestUtils.md5DigestAsHex(merchant.getPassword().getBytes()))) {
                //判断状态是否正确
                if (this.isStatusError(loginMerchant.getStatus(), modelAndView, map)) {
                    loginLog.setStatus(LoginStatus.FAIL.toString());
                    loginLogService.add(loginLog);
                    return modelAndView;
                } else {
                    loginMerchant.setPassword(null);
                    request.getSession().setAttribute(Constants.LOGIN_MERCHANT, loginMerchant);
                    request.getSession().setAttribute("isExistWaitOrder", orderService.isExistWaitOrder(this.getMerchant().getId()));
                    loginLog.setStatus(LoginStatus.SUCCESS.toString());
                    loginLogService.add(loginLog);
                    return new ModelAndView("redirect:/merchant/index.html");
                }
            } else {
                this.usernameOrPasswordError(loginLog, modelAndView, map);
                return modelAndView;
            }
        } else {
            this.usernameOrPasswordError(loginLog, modelAndView, map);
            return modelAndView;
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
                    return session.getAttribute("merchantId").equals(String.valueOf(merchant.getId()));
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
        LoginLog loginLog = new LoginLog();
        loginLog.setDate(new Date());
        loginLog.setIp(request.getRemoteAddr());
        loginLog.setUserType(UserType.MANAGEMENT.toString());
        Map<String, String> map = new HashMap<String, String>();
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("flag", "admin");
        modelAndView.addObject("apkUrl", appService.getNewestUrl());
        //判断是否为空,格式是否正确,验证码是否正确
        if (this.isInfoError(admin.getCode(), "#code", modelAndView, map) ||
            this.isInfoError(admin.getUsername(), "#username", modelAndView, map) ||
            this.isInfoError(admin.getPassword(), "#password", modelAndView, map) ||
            this.isValidateCodeError(admin.getCode(), modelAndView, map)) {
            loginLog.setStatus(LoginStatus.FAIL.toString());
            loginLogService.add(loginLog);
            return modelAndView;
        }
        Admin loginAdmin = adminService.findByUsername(admin.getUsername());
        //判断用户是否存在,密码是否正确
        if (loginAdmin != null && loginAdmin.getPassword().equals(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()))) {
            loginAdmin.setPassword(null);
            request.getSession().setAttribute(Constants.LOGIN_ADMIN, loginAdmin);
            loginLog.setUserId(loginAdmin.getId());
            loginLog.setStatus(LoginStatus.SUCCESS.toString());
            loginLogService.add(loginLog);
            return new ModelAndView("redirect:/manage/index.html");
        } else {
            this.usernameOrPasswordError(loginLog, modelAndView, map);
            return modelAndView;
        }
    }

    @RequestMapping("/manage_logout")
    public String manageLogout() {
        request.getSession().invalidate();
        return "redirect:/manageLogin.html";
    }

    @RequestMapping("/register")
    public ModelAndView register(Merchant merchant) {
        Map<String, String> map = new HashMap<String, String>();
        ModelAndView modelAndView = new ModelAndView("register");
        //判断是否为空,格式是否正确,电话格式是否正确
        if (this.isInfoError(merchant.getUsername(), "#username", modelAndView, map) ||
            this.isInfoError(merchant.getPassword(), "#password", modelAndView, map) ||
            this.isInfoError(merchant.getStoreName(), "#storeName", modelAndView, map) ||
            this.isInfoError(merchant.getPhone(), "#phone", modelAndView, map) ||
            this.isPhoneFormatError(merchant.getPhone(), modelAndView, map)) {
            return modelAndView;
        }
        try {
            merchantService.insertMerchant(merchant);
            map.put("id", "#register_btn");
            map.put("message", "注册成功，等待审核");
            modelAndView.addObject("error", map);
            return modelAndView;
        } catch (ServiceException e) {
            map.put("id", e.getMessage().equals("用户名已存在") ? "#username" : "#storeName");
            map.put("message", e.getMessage());
            modelAndView.addObject("error", map);
            return modelAndView;
        }
    }

    //用户名不存在或密码错误
    private void usernameOrPasswordError(LoginLog loginLog, ModelAndView modelAndView, Map<String, String> map) {
        loginLog.setStatus(LoginStatus.FAIL.toString());
        loginLogService.add(loginLog);
        map.put("id", "#username");
        map.put("message", "用户名或密码错误");
        modelAndView.addObject("error", map);
    }

    //是否包含敏感字符,格式有误
    private boolean isFormatError(String value) {
        return Pattern.compile("[=?%^<>&$;,'\"]+").matcher(value).find();
    }

    //验证输入信息是否错误
    private boolean isInfoError(String info, String id, ModelAndView modelAndView, Map<String, String> map) {
        if (StringUtils.isEmpty(info)) {
            map.put("id", id);
            map.put("message", "输入不能为空");
            modelAndView.addObject("error", map);
            return true;
        } else if (this.isFormatError(info)) {
            map.put("id", id);
            map.put("message", "格式有误");
            modelAndView.addObject("error", map);
            return true;
        } else {
            return false;
        }
    }

    //商家状态是否正确
    private boolean isStatusError(String status, ModelAndView modelAndView, Map<String, String> map) {
        if (MerchantStatus.PENDING.toString().equals(status)) {
            map.put("id", "#username");
            map.put("message", "正在审核中");
            modelAndView.addObject("error", map);
            return true;
        } else if (MerchantStatus.INACTIVE.toString().equals(status)) {
            map.put("id", "#username");
            map.put("message", "禁用中");
            modelAndView.addObject("error", map);
            return true;
        } else {
            return false;
        }
    }

    //验证码是否正确
    private boolean isValidateCodeError(String code, ModelAndView modelAndView, Map<String, String> map) {
        if (!((String) request.getSession().getAttribute("CHECK_NUMBER_KEY")).equalsIgnoreCase(code)) {
            map.put("id", "#code");
            map.put("message", "验证码错误");
            modelAndView.addObject("error", map);
            return true;
        } else {
            return false;
        }
    }

    //电话格式是否有误
    private boolean isPhoneFormatError(String phone, ModelAndView modelAndView, Map<String, String> map) {
        if (!Pattern.compile("[0-9-]+").matcher(phone).find()) {
            map.put("id", "#phone");
            map.put("message", "电话格式有误");
            modelAndView.addObject("error", map);
            return true;
        } else {
            return false;
        }
    }
}
