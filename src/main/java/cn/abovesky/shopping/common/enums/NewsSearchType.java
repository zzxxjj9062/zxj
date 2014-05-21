package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/5/16.
 */
public enum NewsSearchType {
    TITLE("标题"), CONTENT("内容"), NICKNAME("作者");

    private String name;

    private NewsSearchType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
