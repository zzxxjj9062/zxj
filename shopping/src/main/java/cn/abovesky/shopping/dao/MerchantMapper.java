package cn.abovesky.shopping.dao;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.base.BaseMapper;
import cn.abovesky.shopping.domain.Merchant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface MerchantMapper extends BaseMapper<Merchant, Integer> {
    Integer isUniqueUsername(String username);
    Merchant findByUsername(String username);
    // 查询
    List<Merchant> findPageBreakByCondition(BaseConditionVO vo, RowBounds rb);

    void addSaleCount(@Param("id") Integer id, @Param("saleCount") Integer saleCount);

    void addCollectionCount(Integer id);

    Integer getCollectionCountById(Integer id);

    void subCollectionCount(Integer id);

    String getImageById(Integer id);

    List<Merchant> findAll();

    void inactive(Integer[] ids);

    void active(Integer[] ids);
}