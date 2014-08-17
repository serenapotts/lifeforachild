package org.lifeforachild.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.lifeforachild.domain.Message;
import org.lifeforachild.domain.Report;
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
    
    public static String getMessage(String code)
    {
    	if (messages == null) {
    		messages = new HashMap<String, Message>();
    		List<Message> messageList = Message.list();
    		for (Message message: messageList) {
    			messages.put(message.getMessageKey(), message);
    		}
    	}
    	if (messages.containsKey(code)) {
    		System.out.println("Reading from DB messages");
    		Message message =  messages.get(code);
    		Locale locale = LocaleContextHolder.getLocale();
    		if ("fr".equals(locale.getLanguage())) {
    			return message.getFrench();
    		} else if ("es".equals(locale.getLanguage())) {
    			return message.getSpanish();
    		} else if ("ru".equals(locale.getLanguage())) {
//    			try {
//					return java.net.URLDecoder.decode(message.getRussian(), "UTF-8");
    				return message.getRussian();
//				} catch (UnsupportedEncodingException e) {
//					e.printStackTrace();
//					return "";
//				}
    		} else {
    			return message.getEnglish();
    		}
    	} else {
    		//return getApplicationContext().getMessage(code, null, LocaleContextHolder.getLocale());
    		return "";
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
