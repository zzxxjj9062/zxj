package cn.abovesky.shopping.common.enums;

/**
 * Created by snow on 2014/5/14.
 */
public enum Areas {
    LJY(1, "临江苑"), DXY(2, "德馨苑"), JDY(3, "锦地苑"), LSQ(4, "老舍区"), QT(5, "其他");

    private Integer id;
    private String name;

    private Areas(Integer id, String name) {
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
