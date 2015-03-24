package org.lifeforachild.web;

import java.io.IOException;

import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.lifeforachild.domain.FileUpload;
import org.lifeforachild.domain.Permissions;
import org.lifeforachild.util.SecurityUtil;
import org.lifeforachild.web.excel.ExcelReader;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;;

privileged aspect ImportController_Roo_Controller {  
    
	private static final Log LOG = LogFactory.getLog(ImportController.class); 
    
    @RequestMapping(value = "/import", method = RequestMethod.GET)    
    public String ImportController.list(ModelMap modelMap) {        
        return "import/show"; 
    }       
    
    @RequestMapping(value = "/import/upload", method = RequestMethod.POST)    
    public String ImportController.importUpload(@Valid FileUpload fileUpload, ModelMap modelMap) { 
    	try {
    		SecurityUtil.getInstance().checkPermission(Permissions.IMPORT_DATA);
			new ExcelReader().read(fileUpload.getFile().getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
			return "import/error";
		}
    	return "import/result";
    }  
}
