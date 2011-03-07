package org.lifeforachild.Util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import com.Ostermiller.util.ExcelCSVParser;

public class CSVtoProperties {

	public static void main(String[] args)
	{
		try
		{
			SortedProperties properties = new SortedProperties(); 
			SortedProperties properties_es = new SortedProperties();
			SortedProperties properties_fr = new SortedProperties();
			SortedProperties properties_ru = new SortedProperties();
			
			File f = new File("C:/charity/i18n_reviewed.txt");
			FileInputStream fis = new FileInputStream(f);
			DataInputStream in = new DataInputStream(fis);
	        BufferedReader br = new BufferedReader(new InputStreamReader(fis));
		    String strLine;
		    //Read File Line By Line
		    while ((strLine = br.readLine()) != null)   {
		      String[] values = strLine.split("\t");
		      String propName = values[0];
		      if (!propName.equals("Key"))
		      {
			      if (values.length > 1)
			    	  properties.setProperty(propName, values[1]);
			      if (values.length > 2)
			    	  properties_es.setProperty(propName, values[2]);
			      if (values.length > 3)
			    	  properties_fr.setProperty(propName, values[3]);
			      if (values.length > 4)
			    	  properties_ru.setProperty(propName, values[4]);
		      }
		    }
		    properties.store(new FileOutputStream("C:/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/new_messages.properties"), null);
		    properties_es.store(new FileOutputStream("C:/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/new_messages_es.properties"), null);
		    properties_fr.store(new FileOutputStream("C:/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/new_messages_fr.properties"), null);
		    properties_ru.store(new FileOutputStream("C:/charity/lifeforachild/src/main/webapp/WEB-INF/i18n/new_messages_ru.properties"), null);
		    //Close the input stream
		    in.close();		
		}
		catch (IOException e) { 
			e.printStackTrace();
		}
	}
}
