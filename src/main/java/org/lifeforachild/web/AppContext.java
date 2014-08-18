package org.lifeforachild.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.lifeforachild.domain.Message;
import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContextHolder;

public class AppContext { 

	private static Map<String, Message> messages = null;
	
    private static ApplicationContext ctx; 

    /**
     * Injected from the class "ApplicationContextProvider" which is automatically
     * loaded during Spring-Initialization.
     */ 
    public static void setApplicationContext(ApplicationContext applicationContext) { 
        ctx = applicationContext;
    } 

    /**
     * Get access to the Spring ApplicationContext from everywhere in your Application.
     *
     * @return
     */ 
    public static ApplicationContext getApplicationContext() { 
        return ctx; 
    } 
    
    public static String getMessage(String code) {
    	return getMessage(code, LocaleContextHolder.getLocale());
    }
    
    public static String getMessage(String code, Locale locale)
    {
    	if (messages == null) {
    		messages = new HashMap<String, Message>();
    		List<Message> messageList = Message.list();
    		for (Message message: messageList) {
    			messages.put(message.getMessageKey(), message);
    		}
    	}
    	if (messages.containsKey(code)) {
    		Message message =  messages.get(code);
    		String translatedMessage = null;
    		if ("fr".equals(locale.getLanguage())) {
    			translatedMessage = message.getFrench();
    		} else if ("es".equals(locale.getLanguage())) {
    			translatedMessage = message.getSpanish();
    		} else if ("ru".equals(locale.getLanguage())) {
    			translatedMessage = message.getRussian();
    		} 
    		
    		if (translatedMessage == null || translatedMessage.isEmpty()) {
    			translatedMessage = message.getEnglish();
    		}
    		return (translatedMessage == null || translatedMessage.isEmpty()) ? code : translatedMessage;
    	} else {
    		return code;
    	}
    }
    
    public static void clear() {
    	messages = null;
    }
    
    public static String getDatePattern()
    {
    	// use dd/MM/yyyy format
    	return org.joda.time.format.DateTimeFormat.patternForStyle("S-", Locale.UK);
    }
}
