package cn.abovesky.shopping.domain;

import cn.abovesky.shopping.base.BaseDomain;

/**
 * Created by snow on 2014/5/9.
 */
public class ImageRecommend extends BaseDomain {
    private Integer id;
    private String image;
    private String url;
    private String type;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
