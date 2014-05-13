package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.CheckIn;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface CheckInMapper extends BaseMapper<CheckIn, Integer> {

    Integer countTodayByUserId(@Param("userId") Integer userId, @Param("date") Date date);
}