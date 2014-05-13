package cn.abovesky.shopping.service;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.util.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by snow on 2014/5/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class TestSaleRecordService {
    @Autowired
    private ISaleRecordService saleRecordService;

    @Test
    public void testCountTotalPrice() throws Exception {
        BaseConditionVO vo = new BaseConditionVO();
        vo.setMerchantId(4);
        System.out.println(saleRecordService.countTotalPrice(vo, "4"));
    }

    @Test
    public void testCountNumber() throws Exception {
        BaseConditionVO vo = new BaseConditionVO();
        vo.setMerchantId(4);
        vo.setSaleCountDate(DateUtil.getSaleCountDate("1"));
        System.out.println(saleRecordService.countNumber(vo, "4"));
    }
}
