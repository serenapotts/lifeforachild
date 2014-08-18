package org.lifeforachild.Util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.Properties;
import java.util.SortedSet;
import java.util.TreeSet;

public class PropertiesToSQL {

	public static void main(String[] args)
	{
		Properties properties = new Properties();
		Properties properties_es = new Properties(); 
		Properties properties_fr = new Properties(); 
		Properties properties_ru = new Properties();
		try { 
			properties.load(new FileInputStream("/Users/skeating/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages.properties"));
			properties_es.load(new FileInputStream("/Users/skeating/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages_es.properties"));
			properties_fr.load(new FileInputStream("/Users/skeating/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages_fr.properties"));
			properties_ru.load(newReader(new File("/Users/skeating/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/messages_ru.properties"), Charset.forName("UTF-8")));
			File f = new File("/Users/skeating/charity/i18n2.sql");
			FileOutputStream fos = new FileOutputStream(f);
			SortedSet<String> keys = new TreeSet<String>(properties.stringPropertyNames());		
			fos.write("BEGIN;\n".getBytes());
			for(String s : keys)
			{
				if (!s.equals("\"")) {
					String en_prop = properties.getProperty(s);
					String es_prop = properties_es.getProperty(s);
					String fr_prop = properties_fr.getProperty(s);
					String ru_prop = properties_ru.getProperty(s);
					String line = "insert into message (message_key, version, english, french, spanish, russian) " +
							"values ('" + s + "', 1, '" + en_prop.replace("'", "''").replace("\\", "\\\\") + "', '" + 
							(es_prop == null ? "" : es_prop.replace("'", "''").replace("\\", "\\\\")) + "'," + " '" + 
							(fr_prop == null ? "" : fr_prop.replace("'", "''").replace("\\", "\\\\")) + "'," + " '";
							//(ru_prop == null ? "" : new String(ru_prop.getBytes("UTF-8"))) + "');\n";
					fos.write(line.getBytes("UTF-8"));
					if (ru_prop != null) {
						fos.write(ru_prop.replace("'", "''").replace("\\", "\\\\").getBytes("UTF-8"));
					} 
					fos.write("');\n;".getBytes());
				}
			}
			fos.write("COMMIT;".getBytes());
			fos.close();
		} 
		catch (IOException e) { 
			e.printStackTrace();
		}
	}
	
	public static BufferedReader newReader(File file, Charset charset)
	      throws FileNotFoundException {
	    return new BufferedReader(
	        new InputStreamReader(new FileInputStream(file), charset));
	}
}
