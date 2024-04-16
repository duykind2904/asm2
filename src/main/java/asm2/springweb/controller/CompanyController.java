package asm2.springweb.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import asm2.springweb.entity.Company;
import asm2.springweb.entity.User;
import asm2.springweb.service.CompanyService;
import asm2.springweb.service.FollowCompanyService;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired private CompanyService companyService;
	@Autowired private UserService userService;
	@Autowired private FollowCompanyService followCompanyService;
	
	@GetMapping("/detail")
	public String detail(@RequestParam(name = "id", defaultValue = "0") int id, Model model, Principal principal) {
		
		 Company company = companyService.findById(id); company.setUser(null);
		 company.setUser(null);
		 company.setRecruitment(null);
		 model.addAttribute("company", Mapper.toJSON(company));
		 
		int userId = 0;
		if(principal != null) {
			User user = userService.findByEmail(principal.getName());
			userId = user.getId();
		}
				
		model.addAttribute("userId", Mapper.toJSON(userId));
		return "detail-company";
	}
	
	@GetMapping("/checkFollow.json")
	@ResponseBody
	public ResponseEntity<Boolean> checkFollow(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "companyId", defaultValue = "0") int companyId) {
		Boolean check = followCompanyService.checkExistFollow(userId, companyId);
		
		return new ResponseEntity<Boolean>(check, HttpStatus.OK);
	}
	
	@GetMapping("/saveFollow.json")
	@ResponseBody
	public ResponseEntity<String> saveFollow(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "companyId", defaultValue = "0") int companyId) {
		followCompanyService.saveFollow(userId, companyId);
		
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@GetMapping("/deleteFollow.json")
	@ResponseBody
	public ResponseEntity<String> deleteFollow(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "companyId", defaultValue = "0") int companyId) {
		followCompanyService.deleteFollow(userId, companyId);
		
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	

}
