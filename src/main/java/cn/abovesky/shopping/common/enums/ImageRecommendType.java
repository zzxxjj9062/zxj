package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/5/16.
 */
public enum ImageRecommendType {
    ALL("全部"), AD("广告"), MERCHANT("商家"), GOODS("菜品");

    private String name;

    private ImageRecommendType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
