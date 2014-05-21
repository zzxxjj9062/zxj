package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/5/14.
 */
public enum Schools {
    XIHUA(1, "西华大学"), QT(2, "其他");

    private Integer id;
    private String name;

    private Schools(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

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
        this.name = name;
    }
}
