package asm3.springweb.file;

import java.io.File;
import java.io.IOException;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class HandleFile {
	private static final String UPLOAD_DIR = "/path/to/upload/directory";
	
	public String handleFileUpload(MultipartFile file) {
		if (!file.isEmpty()) {
            try {
                String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                String uploadPath = UPLOAD_DIR + File.separator + fileName;
                File destFile = new File(uploadPath);
                file.transferTo(destFile);
                
                return "File " + fileName + " SAVE " + UPLOAD_DIR;
            } catch (IOException e) {
                e.printStackTrace();
                return "SAVE FILE ERROR";
            }
        } else {
            return "NOT FILE EXIST";
        }
	}

}
