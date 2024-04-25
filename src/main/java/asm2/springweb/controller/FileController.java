package asm2.springweb.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class FileController {
//	String uploadPath = "D:/eclipse/eclipse-workspace/ASM2/src/main/webapp/resources/assets/images/uploads/";
	String relativePath = "/resources/assets/images/uploads/";
	
	
	@PostMapping("/saveFile.json")
	@ResponseBody
	public ResponseEntity<String> saveFile(@RequestParam(name="file", required = false) MultipartFile file,
	HttpServletRequest request) {
	long timestamp = new Date().getTime();
	String uniqueFilename = "";

	String uploadPath = request.getServletContext().getRealPath(relativePath);

	if (uploadPath == null) {
	// Handle the case where the path cannot be resolved
	return new ResponseEntity<String>("Upload directory not found", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	File uploadDirectory = new File(uploadPath);
	if (!uploadDirectory.exists()) {
	uploadDirectory.mkdirs();
	}

	if(file != null) {
	try {
	uniqueFilename = timestamp + "_" + file.getOriginalFilename();
	File destinationFile = new File(uploadPath, uniqueFilename);
	file.transferTo(destinationFile);
	} catch (IOException e) {
	e.printStackTrace();
	return new ResponseEntity<String>("Error saving file", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	}

	return new ResponseEntity<String>(uniqueFilename, HttpStatus.OK);
	}
	
	@GetMapping("/deleteFile.json")
	@ResponseBody
	public ResponseEntity<String> deleteFile(@RequestParam(name="fileName") String fileName, 
			HttpServletRequest request) throws IOException {
		String uploadPath = request.getServletContext().getRealPath(relativePath);
	    String filePath = uploadPath + fileName;
	    
	    File file = new File(filePath);
        
        if (file.exists()) {
            if (file.delete()) {
            	return new ResponseEntity<String>("Ok", HttpStatus.OK);
            } else {
            	return new ResponseEntity<String>("KO", HttpStatus.OK);
            }
        } else {
        	return new ResponseEntity<String>("NOT EXIST", HttpStatus.OK);
        }
	}
}
