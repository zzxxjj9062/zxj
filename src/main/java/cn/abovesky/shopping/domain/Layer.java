package cn.abovesky.shopping.domain;

import cn.abovesky.shopping.base.BaseDomain;

public class Layer extends BaseDomain {
    private Integer id;

    private String name;

    private Integer blockId;

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

    public Integer getBlockId() {
        return blockId;
    }

    public void setBlockId(Integer blockId) {
        this.blockId = blockId;
    }
}