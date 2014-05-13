package cn.abovesky.shopping.domain;

import cn.abovesky.shopping.base.BaseDomain;

public class GoodsType extends BaseDomain {
    private Integer id;

    private String name;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /*************************非持久化属性********************************/
    private String idStr;

    public String getIdStr() {
        return String.valueOf(this.id) + ",";
    }
}