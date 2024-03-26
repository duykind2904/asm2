package asm2.springweb.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import asm2.springweb.dto.RoleDTO;
import asm2.springweb.dto.UserDTO;
import asm2.springweb.entity.Company;
import asm2.springweb.entity.User;
import asm2.springweb.model.InfoProfile;
import asm2.springweb.service.CompanyService;
//import asm2.springweb.service.CompanyService;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
@RequestMapping("/profile")
public class profileController {
	@Autowired private UserService userService;
	@Autowired private CompanyService companyService;
	
	@RequestMapping("/home")
	public String profile(Model model, Principal principal) {		
		UserDTO userDTO = new UserDTO();
		RoleDTO roleDTO = new RoleDTO();
		User user = userService.findByEmail(principal.getName());
		BeanUtils.copyProperties(user.getRole(), roleDTO);
		BeanUtils.copyProperties(user, userDTO);
		userDTO.setRole(roleDTO);
		
		Company company = new Company();
//		company = companyService.findByUserId(userDTO.getId());
//		company.setUser(user);
		
		model.addAttribute("company", Mapper.toJSON(company));
		model.addAttribute("user", Mapper.toJSON(userDTO));
		
		return "profile";
	}
	
	@PostMapping("/uploadImage")
	public String upuloadImage() {
		System.out.println(11111);
		return "OK";
	}
	
	@PostMapping("/saveUser.json")
	@ResponseBody
	public ResponseEntity<String> saveUser(@RequestBody User user) {
		userService.save(user);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@PostMapping("/saveFile.json")
	@ResponseBody
	public ResponseEntity<String> saveFile(@RequestParam(name="file", required = false) MultipartFile file,
							HttpServletRequest request) {
		String contextPath = request.getContextPath();
		String uploadPath = "D:/uploads";
		long timestamp = new Date().getTime();
		String uniqueFilename = "";
		
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
	        }
		}
		
		return new ResponseEntity<String>(uniqueFilename, HttpStatus.OK);
	}
	
	@PostMapping("/saveCompany.json")
	@ResponseBody
	public ResponseEntity<String> saveCompany(@RequestBody Company company) {
		companyService.save(company);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
//	@GetMapping("/getFile.json")
//	//@ResponseBody
//	public ResponseEntity<byte[]> getFile(@RequestParam(name="fileName") String fileName) {
//	    String filePath = "D:/uploads/" + fileName;
//	    Path path = Paths.get(filePath);
//	    try {
//	        byte[] data = Files.readAllBytes(path);
//	        return ResponseEntity.ok()
//	                .header("Content-Disposition", "attachment; filename=" + fileName)
//	                .body(data);
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
//	    }
//	}
	
	@GetMapping("/getFile.json")
	@ResponseBody
	public byte[] getFile(@RequestParam(name="fileName") String fileName) throws IOException {
	    String filePath = "D:/uploads/" + fileName;
	    Path path = Paths.get(filePath);
	    return Files.readAllBytes(path);
	}
	
	

}
