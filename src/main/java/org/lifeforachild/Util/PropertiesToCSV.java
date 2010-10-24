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
			properties.load(new FileInputStream("C:/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages.properties"));
			properties_es.load(new FileInputStream("C:/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages_es.properties"));
			File f = new File("C:/charity/i18n.csv");
			String headings = "Key,English,Spanish,French,Russian\n";
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(headings.getBytes());
			SortedSet<String> keys = new TreeSet<String>(properties.stringPropertyNames());			
			for(String s : keys)
			{
				String en_prop = properties.getProperty(s);
				String es_prop = properties_es.getProperty(s);
				String line = s + "," + en_prop + "," + (es_prop == null ? "" : es_prop) + "\n";
				fos.write(line.getBytes());
			}
			fos.close();
		} 
		catch (IOException e) { 
			e.printStackTrace();
		}
	}
}
