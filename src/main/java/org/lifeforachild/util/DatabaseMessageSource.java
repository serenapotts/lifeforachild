package org.lifeforachild.util;

import java.text.MessageFormat;
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
	
	@Override
	protected MessageFormat resolveCode(String code, Locale locale) {
		String message = AppContext.getMessage(code, locale);
		if (message == null) {
			return super.resolveCode(code, locale);
		}
		return new MessageFormat(message, locale);
	}
	
	public void reload() {
        AppContext.clear();
    }
}
