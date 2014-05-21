package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/5/16.
 */
public enum NewsType {
    ALL("全部"), ANNOUNCEMENT("公告");

    private String name;

    private NewsType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
