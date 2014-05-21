package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/4/22.
 */
public enum GoodsStatus {
    ACTIVE("销售中"), PENDING("审核中"), INACTIVE("下架"), DELETED("删除"), ALL("全部");

    private String name;
    private GoodsStatus(String name) {
        this.name = name;
    }
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
