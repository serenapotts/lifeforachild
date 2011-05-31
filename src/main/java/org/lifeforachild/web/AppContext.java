package org.lifeforachild.web;

import java.util.Locale;

import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContextHolder;

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
    
    public static String getDatePattern()
    {
    	// use dd/MM/yyyy format
    	return org.joda.time.format.DateTimeFormat.patternForStyle("S-", Locale.UK);
    }

}
