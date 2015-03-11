package org.lifeforachild.domain;

import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.persistence.Transient;
 
@RooJavaBean 
@RooToString 
@RooEntity 
public class FileUpload { 

    @Size(max = 10240) 
    private String content; 

    @Size(max = 20) 
    private String name; 

    @Transient 
    private CommonsMultipartFile file;

    private String fileName;
    private long size;  
}
