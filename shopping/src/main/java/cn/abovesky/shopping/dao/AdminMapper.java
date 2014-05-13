package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.Admin;

public interface AdminMapper extends BaseMapper<Admin, Integer> {
    Admin findByUsername(String username);
}