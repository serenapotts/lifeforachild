package org.lifeforachild.Util;

import java.util.Locale;

import org.lifeforachild.web.AppContext;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Component;

@Component
public class DatabaseMessageSource extends ReloadableResourceBundleMessageSource {

	@Override
	protected String resolveCodeWithoutArguments(String code, Locale locale) {
		return AppContext.getMessage(code, locale);
	}
	
	public void reload() {
        AppContext.clear();
    }
}
