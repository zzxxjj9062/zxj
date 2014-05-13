package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/4/26.
 */
public enum Gender {
    MALE("男"), FEMALE("女"), SECRET("保密");
    private String name;
    private Gender(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
