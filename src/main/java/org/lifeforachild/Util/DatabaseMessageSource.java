package org.lifeforachild.Util;

import java.text.MessageFormat;
import java.util.Locale;
import java.util.Map;

import org.lifeforachild.domain.Message;
import org.lifeforachild.web.AppContext;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.context.support.AbstractMessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

@Component
public class DatabaseMessageSource extends ReloadableResourceBundleMessageSource {

	@Override
	protected MessageFormat resolveCode(String code, Locale locale) {
		return new MessageFormat(resolveCodeWithoutArguments(code, locale));
	}
	
	@Override
	protected String resolveCodeWithoutArguments(String code, Locale locale) {
		String message = AppContext.getMessage(code);
		if (message == null || message.isEmpty()) {
			try {
				return getParentMessageSource().getMessage(code, null, locale);
			} catch (Exception e) {
				return code;
			}
		}
		return message;
	}
	
	public void reload() {
        AppContext.clear();
    }
}
