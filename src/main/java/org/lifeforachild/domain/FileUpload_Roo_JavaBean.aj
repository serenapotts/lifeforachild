package org.lifeforachild.domain;

import java.lang.String;
import java.util.Set;

import org.lifeforachild.domain.DiabetesCentre;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect FileUpload_Roo_JavaBean {
    
	public String FileUpload.getContent() {
		return content;
	}

	public void FileUpload.setContent(String content) {
		this.content = content;
	}

	public String FileUpload.getName() {
		return name;
	}

	public void FileUpload.setName(String name) {
		this.name = name;
	}

	public String FileUpload.getFileName() {
		return fileName;
	}

	public void FileUpload.setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long FileUpload.getSize() {
		return size;
	}

	public void FileUpload.setSize(long size) {
		this.size = size;
	} 
	
    public CommonsMultipartFile FileUpload.getFile() { 
        return file; 
    } 

       // save file to disk ,save filename , file size to database  
    public void FileUpload.setFile(CommonsMultipartFile file) { 
        this.file = file; 
        this.fileName = file.getOriginalFilename(); 
        this.size = file.getSize(); 
   }
}
