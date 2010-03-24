package org.lifeforachild.tool.csvtosql;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.Writer;

public class WeightLMSToSQL {

	private static final int FEMALE = 1;

	private static final int MALE = 0;

	private static final String WTAGEINF_CSV_FILE = "/csv/wtageinf.csv";

	private static final String WTAGEINF_SQL_DIR = System
			.getProperty("java.io.tmpdir");
	private static final String WTAGEINF_SQL_FILE = "wtageinf.sql";

	private static int sexIndex = 0;
	private static int ageIndex = 0;
	private static int lIndex = 0;
	private static int mIndex = 0;
	private static int sIndex = 0;
	private static int id = 0;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		BufferedReader reader = null;
		PrintWriter writer = null;

		try {
			File csvFile = new File(WeightLMSToSQL.class.getResource(
					WTAGEINF_CSV_FILE).getFile());
			File sqlFile = new File(WTAGEINF_SQL_DIR + File.separator
					+ WTAGEINF_SQL_FILE);

			System.out.println("  Reading wtageinf from : "
					+ csvFile.getAbsolutePath());
			System.out.println("Writing wtageinf sql to : "
					+ sqlFile.getAbsolutePath());

			reader = new BufferedReader(new FileReader(csvFile));
			writer = new PrintWriter(new FileWriter(sqlFile));

			String line = reader.readLine();
			if (line == null) {
				throw new Exception(
						"Invalid format of CSV file, expecting a header. File path: "
								+ csvFile.getAbsolutePath());
			}

			processHeaderLine(line);

			//clear the records where DType = 'WeightForAgeLMS'
			writer.println("delete from lms where dtype='WeightForAgeLMS';");

			line = reader.readLine();
			String sex;

			while (line != null) {
				processLine(writer, line);
				line = reader.readLine();
			}
			
			System.out.println("Successfully parse CSV file into SQL at file: " + sqlFile.getAbsolutePath());
			
		} catch (Exception e) {
			System.err
					.println("Encounter exception while parsing CSV file to SQL: "
							+ e.getMessage());
			e.printStackTrace();
		} finally {
			safelyCloseReader(reader);
			safelyCloseWriter(writer);
		}
	}

	private static void processLine(PrintWriter writer, String line) {
		int sex;
		String[] splitStrings = line.split(",");
		if (splitStrings[sexIndex].equals("1")) {
			sex = MALE;
		} else {
			sex = FEMALE;
		}

		writer.println("insert into lms(dtype, age_months_old, version, l, m, s, sex) values('WeightForAgeLMS', " 
						+ splitStrings[ageIndex] + ", 0, " + splitStrings[lIndex] + ", " + splitStrings[mIndex] + ", "
						+ splitStrings[sIndex] + ", " + sex + ");");
	}

	private static void processHeaderLine(String line) {
		String[] splitStrings = line.split(",");

		for (int i = 0; i < splitStrings.length; i++) {
			if (splitStrings[i].trim().equalsIgnoreCase("sex")) {
				sexIndex = i;
				continue;
			}

			if (splitStrings[i].trim().equalsIgnoreCase("agemos")) {
				ageIndex = i;
				continue;
			}

			if (splitStrings[i].trim().equalsIgnoreCase("l")) {
				lIndex = i;
				continue;
			}

			if (splitStrings[i].trim().equalsIgnoreCase("m")) {
				mIndex = i;
				continue;
			}

			if (splitStrings[i].trim().equalsIgnoreCase("s")) {
				sIndex = i;
				continue;
			}
		}
	}

	private static void safelyCloseWriter(Writer writer) {
		if (writer != null) {
			try {
				writer.close();
			} catch (Exception e) {
				System.err.println(e);
				e.printStackTrace();
			}
		}

	}

	private static void safelyCloseReader(Reader reader) {
		if (reader != null) {
			try {
				reader.close();
			} catch (Exception e) {
				System.err.println(e);
				e.printStackTrace();
			}
		}
	}
}
