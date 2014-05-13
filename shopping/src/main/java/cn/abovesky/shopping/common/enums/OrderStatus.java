package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/4/29.
 */
public enum OrderStatus {
    ALL("全部"), WAITING("等待配送"), CONFIRMSEND("确认配送") ,SENDING("已配送"), CONFIRM("已确认和评价"), CANCEL("取消"), DELETED("删除");
    private String name;

    private OrderStatus(String name) {
        this.name = name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}
