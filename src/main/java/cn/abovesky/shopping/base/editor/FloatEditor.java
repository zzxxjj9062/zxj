package cn.abovesky.shopping.base.editor;

import org.springframework.util.StringUtils;

import java.beans.PropertyEditorSupport;

public class FloatEditor extends PropertyEditorSupport {
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text == null || text.equals(""))
			text = "0";
		if (!StringUtils.hasText(text)) {
			setValue(null);
		} else {
			setValue(Float.parseFloat(text));// 这句话是最重要的，他的目的是通过传入参数的类型来匹配相应的databind
		}
	}

	@Override
	public String getAsText() {

		return getValue().toString();
	}
}
