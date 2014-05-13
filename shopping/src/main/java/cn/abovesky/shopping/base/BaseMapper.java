package cn.abovesky.shopping.base;

import java.io.Serializable;

/**
 * Created by snow on 2014/4/20.
 */
public interface BaseMapper<T, PK extends Serializable> {
    int deleteByPrimaryKey(PK modelPK);

    int insert(T model);

    void insertSelective(T model);

    T selectByPrimaryKey(PK modelPK);

    void updateByPrimaryKeySelective(T model);

    void updateByPrimaryKey(T model);
}
