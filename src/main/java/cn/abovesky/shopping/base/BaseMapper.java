package cn.abovesky.shopping.base;

import java.io.Serializable;

/**
 * Created by snow on 2014/4/20.
 */
public interface BaseMapper<T, PK extends Serializable> {
    int deleteByPrimaryKey(PK modelPK);

    int insert(T model);

    int insertSelective(T model);

    T selectByPrimaryKey(PK modelPK);

    int updateByPrimaryKeySelective(T model);

    int updateByPrimaryKey(T model);
}
