package cn.abovesky.shopping.web.management;

import cn.abovesky.shopping.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by snow on 2014/5/11.
 */
@Controller
@RequestMapping("/manage")
public class AManagementController extends BaseController {

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("management/index");
        return modelAndView;
    }
}
