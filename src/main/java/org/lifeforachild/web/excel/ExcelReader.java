package org.lifeforachild.web.excel;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import org.lifeforachild.domain.Child;
import org.lifeforachild.enums.SexType;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.read.biff.BiffException;

public class ExcelReader {

	public static final String FIRST_NAME = "First Name";
	public static final String INITIALS = "Initials";
	public static final String LAST_NAME = "Last Name";
	public static final String SEX = "Sex";
	public static final String COUNTRY = "Country";
	public static final String CENTRE = "centre";
	public static final String DOB = "Date of Birth";
	public static final String HEIGHT = "Height";
	public static final String WEIGHT = "Weight";
	
	private String inputFile;

	public void setInputFile(String inputFile) {
		this.inputFile = inputFile;
	}

	public void read() throws IOException  {
		File inputWorkbook = new File(inputFile);
		Workbook w;
		try {
			WorkbookSettings settings = new WorkbookSettings();
			w = Workbook.getWorkbook(inputWorkbook);
			readWorkbook(w);
        } catch (BiffException e) {
        	e.printStackTrace();
        }
  }
  
  public void read(InputStream stream) {
	  Workbook w;
		try {
			w = Workbook.getWorkbook(stream);
			readWorkbook(w);
      } catch (BiffException e) {
      	e.printStackTrace();
      } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
  }
  
  public void readWorkbook(Workbook w) {
	// Get the first sheet
      Sheet sheet = w.getSheet(0);
      // Loop over first 10 column and lines

      for (int i = 1; i < sheet.getRows(); i++) {
        for (int j = 0; j < sheet.getColumns(); j++) {
        
          Cell cell = sheet.getCell(j, i);
          Cell heading = sheet.getCell(j, 0);
          Child child = new Child();
          switch (heading.getContents()) {
	      	case FIRST_NAME: {
	      		 System.out.println("I got a first name "
	                   + cell.getContents());
	      		 child.setName(cell.getContents());
	      		 break;
	      	} case INITIALS: {
	      		 System.out.println("I got a initials "
		                   + cell.getContents());
	      		child.setInitials(cell.getContents());
	      		break;
	      	} case LAST_NAME: {
	      		 System.out.println("I got a last name "
		                   + cell.getContents());
	      		child.setLastName(cell.getContents());
	      		break;
	      	} case SEX: {
	      		 System.out.println("I got a sex "
		                   + cell.getContents());
	      		child.setSex(SexType.valueOf(cell.getContents()));
	      		break;
	      	} case COUNTRY: {
	      		 System.out.println("I got a country "
		                   + cell.getContents());
	      		break;
	      	} case CENTRE: {
	      		 System.out.println("I got a centre "
		                   + cell.getContents());
	      		break;
	      	} case DOB: {
	      		 System.out.println("I got a dob "
		                   + cell.getContents());
	      		 child.setDateOfBirth(parseDate(cell));
	      		break;
	      	} case HEIGHT: {
	      		 System.out.println("I got a height "
		                   + cell.getContents());
	      		 child.setHeightAtDiagnosisValue(parseNumber(cell));
	      		break;
	      	} case WEIGHT: {
	      		 System.out.println("I got a weight "
		                   + cell.getContents());
	      		child.setWeightAtDiagnosisValue(parseNumber(cell));
	      		break;
	      	}
          }
          
//          CellType type = cell.getType();
//          if (type == CellType.LABEL) {
//            System.out.println("I got a label "
//                + cell.getContents());
//          }
//
//          if (type == CellType.NUMBER) {
//            System.out.println("I got a number "
//                + cell.getContents());
//          }

        }
      }

  }
  
  private Date parseDate(Cell cell) {
	  if (cell.getType() != CellType.DATE) {
		  return null;
	  }
	  return new Date(cell.getContents()); 
  }
  
  private Float parseNumber(Cell cell) {
	  if (cell.getType() != CellType.NUMBER) {
		  return null;
	  }
	  return Float.valueOf(cell.getContents()); 
  }

  public static void main(String[] args) throws IOException {
    ExcelReader test = new ExcelReader();
    test.setInputFile("/Users/skeating/charity/importTest.xls");
    test.read();
  }

} 
