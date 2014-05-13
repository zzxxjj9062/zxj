package cn.abovesky.shopping.web.user;

import cn.abovesky.shopping.base.BaseController;
import cn.abovesky.shopping.domain.ImageRecommend;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by snow on 2014/5/9.
 */
@Controller
@RequestMapping("/user/imageRecommend")
public class UImageRecommendController extends BaseController {

    @RequestMapping("/list")
    public @ResponseBody Map<String, Object> list() {
        Map<String, Object> map = new HashMap<String, Object>();
        ImageRecommend imageRecommend1 = new ImageRecommend();
        ImageRecommend imageRecommend2 = new ImageRecommend();
        ImageRecommend imageRecommend3 = new ImageRecommend();
        ImageRecommend imageRecommend4 = new ImageRecommend();
        imageRecommend1.setImage("1fffeac6-21eb-4a2d-94df-1fcdf11ea995.jpg");
        imageRecommend2.setImage("74590007-4891-4ef2-9796-6b6ba5e8a287.jpg");
        imageRecommend3.setImage("a5851055-ea36-4ed8-8f21-4f664049866c.jpg");
        imageRecommend4.setImage("25045853-d1fd-4324-acd2-4f6e45e7d727.jpg");
        List<ImageRecommend> imageRecommends = new ArrayList<ImageRecommend>();
        imageRecommends.add(imageRecommend1);
        imageRecommends.add(imageRecommend2);
        imageRecommends.add(imageRecommend3);
        imageRecommends.add(imageRecommend4);
        map.put("count", imageRecommends.size());
        map.put("imageRecommends", imageRecommends);
        return map;
    }
}
