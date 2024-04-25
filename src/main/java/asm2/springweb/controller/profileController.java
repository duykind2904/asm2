package asm2.springweb.controller;

import java.security.Principal;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asm2.springweb.dto.RoleDTO;
import asm2.springweb.dto.UserDTO;
import asm2.springweb.entity.Company;
import asm2.springweb.entity.User;
import asm2.springweb.service.CompanyService;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
@RequestMapping("/profile")
public class ProfileController {
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
		if(user.getRole().getRoleName().equals("ROLE_COMPANY")) {
			company = companyService.findByUserId(user.getId());
			company.setRecruitment(null);
			company.setUser(null);
			
		}
		model.addAttribute("company", Mapper.toJSON(company));
		model.addAttribute("user", Mapper.toJSON(userDTO));
		
		return "profile";
	}
	
	@PostMapping("/saveUser.json")
	@ResponseBody
	public ResponseEntity<String> saveUser(@RequestBody User user) {
		userService.save(user);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@PostMapping("/saveCompany.json")
	@ResponseBody
	public ResponseEntity<String> saveCompany(@RequestBody Company company) {
		companyService.save(company);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

}
