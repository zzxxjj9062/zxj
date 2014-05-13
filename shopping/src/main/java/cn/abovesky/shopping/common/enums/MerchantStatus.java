package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/4/20.
 */
public enum MerchantStatus {
    ACTIVE("正常"), PENDING("审核中"), INACTIVE("禁用"), DELETED("删除"), ALL("全部");

    private String name;

    private MerchantStatus(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
