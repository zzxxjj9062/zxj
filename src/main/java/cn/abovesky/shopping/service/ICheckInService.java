package cn.abovesky.shopping.service;

import cn.abovesky.shopping.domain.CheckIn;
import cn.abovesky.shopping.exception.ServiceException;

/**
 * Created by snow on 2014/5/2.
 */
public interface ICheckInService {
    static final String SERVICE_NAME = "checkInService";
    void add(CheckIn checkIn) throws ServiceException;
}
