package cn.abovesky.shopping.service;

import cn.abovesky.shopping.domain.SendAddress;

import java.util.List;

/**
 * Created by snow on 2014/4/29.
 */
public interface ISendAddressService {
    static final String SERVICE_NAME = "sendAddressService";

    void add(Integer userId, String address);

    List<SendAddress> findById(Integer userId);
}
