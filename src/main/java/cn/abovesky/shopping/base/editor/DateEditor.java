package cn.abovesky.shopping.base.editor;

import java.beans.PropertyEditorSupport;

import cn.abovesky.shopping.util.DateUtil;
import org.springframework.util.StringUtils;


public class DateEditor extends PropertyEditorSupport {
	@Override
	public void setAsText(String text) throws IllegalArgumentException {

		if (!StringUtils.hasText(text)) {
			setValue(null);
		} else {
			setValue(DateUtil.string2Date(text, "yyyy-MM-dd"));
		}
	}

	@Override
	public String getAsText() {
		return getValue().toString();
	}
}
