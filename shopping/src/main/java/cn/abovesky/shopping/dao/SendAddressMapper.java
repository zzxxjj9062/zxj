package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.SendAddress;

import java.util.List;

public interface SendAddressMapper extends BaseMapper<SendAddress, Integer> {
    Integer countByNameAndAddress(SendAddress sendAddress);

    List<SendAddress> findById(Integer id);
}