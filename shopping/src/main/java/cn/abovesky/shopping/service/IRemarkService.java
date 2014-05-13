package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.Remark;
import cn.abovesky.shopping.exception.ServiceException;

import java.util.List;

/**
 * Created by snow on 2014/5/1.
 */
public interface IRemarkService {
    static final String SERVICE_NAME = "remarkService";

    List<Remark> search(BaseConditionVO vo);
    void delete(String[] ids) throws ServiceException;
}
