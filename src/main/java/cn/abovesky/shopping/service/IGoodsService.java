package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.Goods;
import cn.abovesky.shopping.exception.ServiceException;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by snow on 2014/4/22.
 */
public interface IGoodsService {
    static final String SERVICE_NAEM = "goodsService";
    List<Goods> search(BaseConditionVO vo);

    void add(MultipartFile image, Goods goods, String filePath) throws ServiceException;

    Goods findById(Integer goodsId);

    void update(MultipartFile image, Goods goods, String goodsImagePath) throws ServiceException;

    void delete(String[] idsAndStatuses);

    void up(String[] idsAndStatuses) throws ServiceException;
    void down(String[] idsAndStatuses) throws ServiceException;

    List<Goods> findByMerchantId(Integer merchantId);

    Goods getDetailById(Integer goodsId);

    List<Goods> findAll();
}
