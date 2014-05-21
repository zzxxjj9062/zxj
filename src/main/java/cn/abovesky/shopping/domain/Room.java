package cn.abovesky.shopping.domain;

import cn.abovesky.shopping.base.BaseDomain;

public class Room extends BaseDomain {
    private Integer id;

    private String name;

    private Integer layerId;

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

    public Integer getLayerId() {
        return layerId;
    }

    public void setLayerId(Integer layerId) {
        this.layerId = layerId;
    }
}