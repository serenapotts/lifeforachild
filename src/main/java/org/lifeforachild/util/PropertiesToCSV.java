package org.lifeforachild.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.SortedSet;
import java.util.TreeSet;

public class PropertiesToCSV {

	public static void main(String[] args)
	{
		Properties properties = new Properties();
		Properties properties_es = new Properties(); 
		try { 
			properties.load(new FileInputStream("/Users/skeating/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages.properties"));
			properties_es.load(new FileInputStream("/Users/skeating/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages_es.properties"));
			File f = new File("/Users/skeating/charity/i18n.csv");
			String headings = "Key\tEnglish\tSpanish\tFrench\tRussian\n";
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(headings.getBytes());
			SortedSet<String> keys = new TreeSet<String>(properties.stringPropertyNames());			
			for(String s : keys)
			{
				String en_prop = properties.getProperty(s);
				String es_prop = properties_es.getProperty(s);
				String line = "" + s + "\t" + en_prop + "\t" + (es_prop == null ? "" : es_prop) + "\n";
				fos.write(line.getBytes());
			}
			fos.close();
		} 
		catch (IOException e) { 
			e.printStackTrace();
		}
	}
}
