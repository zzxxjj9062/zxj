package cn.abovesky.shopping.util;

import java.util.Properties;

/**
 * Created by snow on 2014/4/22.
 */
public class PathUtils {
    public static boolean isWindowSeparator() {
        Properties properties = System.getProperties();
        if ("/".equals(properties.get("file.separator"))) {
            return false;
        } else {
            return true;
        }
    }

    public static String getGoodsImagePath() {
        if (isWindowSeparator()) {
            return "\\upload\\GoodsImage";
        } else {
            return "/upload/GoodsImage";
        }
    }

    public static String fileSuffix(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }
}
