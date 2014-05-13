package cn.abovesky.shopping.web;

import cn.abovesky.shopping.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by snow on 2014/4/22.
 */
@Controller
public class IndexController extends BaseController {
    @RequestMapping("")
    public String index() {
        return "index";
    }

    @RequestMapping("/manageLogin")
    public String manageLogin() {
        return "manageLogin";
    }
}
