package org.lifeforachild.web;

import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContextHolder;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormat;

public class AppContext { 

 

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
    	return getApplicationContext().getMessage(code, null, LocaleContextHolder.getLocale());
    }
    
    public static DateTimeFormatter getDatePattern()
    {
    	return DateTimeFormat.forPattern(getMessage("dd/mm/yyyy"));
    }

}
