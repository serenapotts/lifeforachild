package org.lifeforachild.domain;

public final class OutputType {

	public static final String PDF = "PDF";
	public static final String HTML = "HTML";
	public static final String EXCEL = "Excel";
	public static final String EXCEL_PLAIN = "Excel (Plain List)";
	public static final String RTF = "RTF";
	
	public static final String[] getOutputs() {
		return new String[]{PDF, HTML, EXCEL, EXCEL_PLAIN, RTF};
	}
	
}