package org.lifeforachild.web.Report;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRAbstractExporter;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.web.Report.ReportGenerator.OutputProcessed;

public class ReportExporter {
	/**
	 * Logger for this class
	 */
	private static final Log logger = LogFactory.getLog(ReportExporter.class);

	/**
	 * The path to the file must exist.
	 * @param jp
	 * @param path
	 * @throws JRException
	 * @throws FileNotFoundException
	 */
	public static void exportReport(JasperPrint jp, OutputProcessed outputProcessed,
			HttpServletResponse response) throws JRException, 
	FileNotFoundException, IOException
	{
		JRAbstractExporter exporter = outputProcessed.exporter;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
        exporter.exportReport();
		logger.debug("Report exported.");
		byte[] reportAsBytes = baos.toByteArray();
        response.setContentType(outputProcessed.contentType);
        response.setHeader("Content-Disposition", "inline");
        response.setContentLength(reportAsBytes.length);

        ServletOutputStream s;
		try {
			s = response.getOutputStream();

            s.write(reportAsBytes, 0, reportAsBytes.length);

            s.flush();
            s.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
