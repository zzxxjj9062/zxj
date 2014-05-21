package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.ImageRecommend;
import cn.abovesky.shopping.exception.ServiceException;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by snow on 2014/5/16.
 */
public interface IImageRecommendService {
    static final String SERVICE_NAME = "imageRecommendService";

    List<ImageRecommend> search(BaseConditionVO vo);

    void add(MultipartFile image, ImageRecommend imageRecommend, String imageRecommendPath) throws ServiceException;

    ImageRecommend findById(Integer id);

    void update(MultipartFile image, ImageRecommend imageRecommend, String imageRecommendPath) throws ServiceException;

    void delete(String[] ids, String imageRecommendPath);

    List<ImageRecommend> findAll();
}
