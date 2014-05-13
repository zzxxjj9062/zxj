package cn.abovesky.shopping.base;

import org.apache.commons.lang.builder.ToStringBuilder;

import java.io.Serializable;

/**
 * Created by snow on 2014/4/20.
 */
public class BaseDomain implements Serializable {
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
