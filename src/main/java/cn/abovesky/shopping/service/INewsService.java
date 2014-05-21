package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.News;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/5/16.
 */
public interface INewsService {
    static final String SERVICE_NAME = "newsService";

    List<News> search(BaseConditionVO vo);

    void add(News news) throws ServiceException;

    News findById(Integer id);

    void update(News news) throws ServiceException;

    void delete(Integer[] ids) throws ServiceException;

    int getTotalCount();
}
