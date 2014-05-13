package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.domain.CreditLog;

import java.util.List;

/**
 * Created by snow on 2014/5/2.
 */
public interface ICreditLogService {
    static final String SERVICE_NAME = "creditLogService";

    List<CreditLog> search(BaseConditionVO vo);
}
