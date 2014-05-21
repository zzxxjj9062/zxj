package cn.abovesky.shopping.test;

import org.junit.Test;

import java.util.Properties;

/**
 * Created by snow on 2014/4/22.
 */
public class TestSystemName {

    @Test
    public void testSystemName() throws Exception {
        Properties properties = System.getProperties();
        System.out.println(properties.get("file.separator"));
    }
}
