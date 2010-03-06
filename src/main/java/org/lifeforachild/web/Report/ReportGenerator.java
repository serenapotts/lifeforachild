package org.lifeforachild.web.Report;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRAbstractExporter;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import org.lifeforachild.domain.OutputType;
import org.lifeforachild.domain.Report;

import ar.com.fdvs.dj.core.DynamicJasperHelper;
import ar.com.fdvs.dj.core.layout.AbstractLayoutManager;
import ar.com.fdvs.dj.core.layout.ClassicLayoutManager;
import ar.com.fdvs.dj.core.layout.ListLayoutManager;
import ar.com.fdvs.dj.domain.CustomExpression;
import ar.com.fdvs.dj.domain.DynamicReport;
import ar.com.fdvs.dj.domain.ImageBanner;
import ar.com.fdvs.dj.domain.Style;
import ar.com.fdvs.dj.domain.builders.ColumnBuilder;
import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;
import ar.com.fdvs.dj.domain.constants.Font;
import ar.com.fdvs.dj.domain.entities.columns.AbstractColumn;

/**
 * Abstract class that generates a report using DynamicJasper.
 * 
 * A number of different of formats are supported including HTML and Excel.
 * 
 * @author Serena Potts
 *
 */
public abstract class ReportGenerator {

	// The format of dates in a report
	protected static String DATE_FORMAT = "dd/MM/yyyy";
	public static final String DISPLAY_FIELD_SEPARATOR = ",";
	OutputProcessed outputProcessed = null;
	
	// Class to hold information about the output format
    public class OutputProcessed {
        public AbstractLayoutManager layoutManager;
        public JRAbstractExporter exporter;
        public String contentType;
    }

    /**
     * Create a HTML report based on the {@link Report} parameters.
     * @param report The report parameters
     * @return The HTML for the report as a String. 
     * @throws JRException 
     */
	public String generateHtmlReport(Report report, List results, HttpServletRequest request)
	{
		// generate the sql query based on the report
    	//List results = buildQuery(report);
    	byte[] bytes = null;
    	try
    	{
    	// get the report as bytes
    	JasperPrint jp = generateReport(request, OutputType.HTML, results, getDisplayFields(report), 
    			report.getName(), false);  
    	JRAbstractExporter exporter = outputProcessed.exporter;
    	ByteArrayOutputStream baos = new ByteArrayOutputStream();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
        exporter.exportReport();

        bytes = baos.toByteArray();
    	}
    	catch (JRException e)
    	{
    		e.printStackTrace();
    	}
    	
    	// convert to string
        return new String(bytes);
	}
	
	/**
	 * Create a report in Excel file format.
	 * @param query The sql query
	 * @throws JRException 
	 */
	public void generateExcelReport(Report report, HttpServletRequest request, HttpServletResponse response)  
	{
		try {
			List results = buildQuery(report);
			JasperPrint jp = generateReport(request, OutputType.EXCEL, results, getDisplayFields(report), 
					report.getName(), false);
			// TODO how to allow user to control this location
			ReportExporter.exportReport(jp, outputProcessed, response);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	/**
	 * Create a report in Excel file format.
	 * @param query The sql query
	 */
	public void generatePdfReport(Report report, HttpServletRequest request, HttpServletResponse response)
	{
		try {
			List results = buildQuery(report);
			JasperPrint jp = generateReport(request, OutputType.PDF, results, getDisplayFields(report), 
						report.getName(), true);
			// TODO how to allow user to control this location
			ReportExporter.exportReport(jp, outputProcessed, response);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * Generate a report based on the given {@link OutputType} and SQL query.
	 * @param outputType The output format for the report
	 * @param query The SQL query used to filter the results
	 * @return the report as an array of bytes.
	 */
	private JasperPrint generateReport(HttpServletRequest request, String outputType, List results, 
			Object[] fields, String title, boolean addTitleAndImage) throws JRException
	{
		//Create DynamicReport instance
        DynamicReport dr = buildDynamicReport(request, null, fields, title, addTitleAndImage);

        outputProcessed = processOutput(outputType);  
		//Obtain the JasperPrint instance with a ClassicLayoutManager
        JRDataSource ds = new JRBeanCollectionDataSource(results);

        JasperPrint jp = DynamicJasperHelper.generateJasperPrint(dr, outputProcessed.layoutManager, ds);
        return jp;
	}
	
	/**
	 * Get the {@link OutputProcessed} based on the output format.
	 * @param output The output format of the report.
	 */
    private OutputProcessed processOutput(String output) {
        OutputProcessed result = new OutputProcessed();
        if (output.equals(OutputType.PDF)) {
            result.contentType = "application/pdf";
            result.exporter = new JRPdfExporter();
            result.layoutManager = new ClassicLayoutManager();
        } else if (output.equals(OutputType.HTML)) {
            result.contentType = "text/html";
            result.exporter = new JRHtmlExporter();
            // fix to remove extra borders around html report
            result.exporter.setParameter(JRHtmlExporterParameter.HTML_HEADER, "<style>table{border-collapse:collapse}</style>"); 
            result.exporter.setParameter(
                    JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
            result.layoutManager = new ClassicLayoutManager();
        } else if (output.equals(OutputType.EXCEL)) {
            result.contentType = "application/vnd.ms-excel";
            result.exporter = new JRXlsExporter();
            result.exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
            result.exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            result.layoutManager = new ClassicLayoutManager();
        } else if (output.equals(OutputType.EXCEL_PLAIN)) {
            result.contentType = "application/vnd.ms-excel";
            result.exporter = new JRXlsExporter();
            result.exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
            result.exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            result.layoutManager = new ListLayoutManager();
        } else {
            result.contentType = "application/rtf";
            result.exporter = new JRRtfExporter();
            result.layoutManager = new ClassicLayoutManager();
        }
        return result;
    }
	
	/**
	 * Build the {@link DynamicReport} which adds the appropriate columns.
	 * @param query The SQL query/
	 */
    private DynamicReport buildDynamicReport(HttpServletRequest request, String query, Object[] fields, 
    		String title, boolean addTitleAndImage) 
    {       
        DynamicReportBuilder drb = new DynamicReportBuilder();
        Integer margin = new Integer(20);
        drb.setPrintBackgroundOnOddRows(true);                          
        drb.setUseFullPageWidth(true);
        
        if (addTitleAndImage)
        {
        	String realPath = request.getSession().getServletContext().getRealPath("/");
        	drb.addImageBanner(realPath + "/images/logo_T_01 cropped.jpg", new Integer(30), new Integer(30), ImageBanner.ALIGN_RIGHT);
        	drb.setTitle(title);
        	Style titleStyle = new Style();
        	titleStyle.setFont(new Font(18,Font._FONT_VERDANA,true));
        	drb.setTitleStyle(titleStyle);
        }

        try {
			addColumns(drb, fields);
		} catch (ColumnBuilderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        DynamicReport dr = drb.build();
        return dr;
    }

    /**
     * Add a date column to the report
     * @param drb The report builder.
     * @param name The name of the column in the database
     * @param title The title to display for the column on the report
     * @throws ColumnBuilderException
     */
    protected void addDateColumn(DynamicReportBuilder drb, String name, String title)
    throws ColumnBuilderException
    {
    	addColumn(drb, name, title, Date.class, 100, DATE_FORMAT, null);
    }
	
    /**
     * Add a column to the report
     * @param drb The report builder
     * @param name The name of the column in the database
     * @param title The title to display for the column on the report
     * @param columnClass The equivalent java class for the columns database type
     * @param width The width of the column in the report
     * @throws ColumnBuilderException
     */
    protected void addColumn(DynamicReportBuilder drb, String name, String title, Class columnClass, int width)
    throws ColumnBuilderException
    {
    	addColumn(drb, name, title, columnClass, width, null, null);
    }
    
    /**
     * 
     * Add a column to the report
     * @param drb The report builder
     * @param name The name of the column in the database
     * @param title The title to display for the column on the report
     * @param columnClass The equivalent java class for the columns database type
     * @param width The width of the column in the report
     * @param pattern string of pattern to apply
     * @param customExpression Custom Expression which provides more complicated formatting
     * @throws ColumnBuilderException
     */
    protected void addColumn(DynamicReportBuilder drb, String name, String title, Class columnClass, 
    		int width, String pattern, CustomExpression customExpression)
    throws ColumnBuilderException
    {
    	ColumnBuilder columnBuilder = ColumnBuilder.getInstance();
    	if (customExpression != null)
    		columnBuilder.setCustomExpression(customExpression);
    	else
    		columnBuilder.setColumnProperty(name, columnClass.getName());
        //defines the field of the data source that this column will show, also its type                             
        //the title for the column
        columnBuilder.setTitle(title);                                                                   
        //the width of the column
        columnBuilder.setWidth(width);    
        // set a formatting pattern to apply
        columnBuilder.setPattern(pattern);
    	//creates a new instance of a ColumnBuilder
        AbstractColumn column = columnBuilder.build();                                                                                                       //builds and return a new AbstractColumn
        drb.addColumn(column);
    }

    /**
     * Add columns specific to the report type.
     * @param drb The report builder.
     * @throws ColumnBuilderException
     */
	abstract void addColumns(DynamicReportBuilder drb, Object[] fields) throws ColumnBuilderException;
	
	/**
	 * Build the SQL query based on the report parameters.
	 * @param report The report parameters.
	 * @return The SQL query.
	 */
	public abstract List buildQuery(Report report);
	
	public abstract Object[] getDisplayFieldsList(String fields);
	
	public abstract Object[] getDisplayFields(Report report);
	
	public abstract String getFieldListAsString(Report report);
}
