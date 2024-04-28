package asm2.springweb.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm2.springweb.dto.ApplyPostDTO;
import asm2.springweb.entity.User;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
@RequestMapping("/follow")
public class FollowController {
	@Autowired private UserService userService;
	
	@RequestMapping("/job")
	public String followJob(Model model, Principal principal) {		
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		return "list-follow-job";
	}
	
	@GetMapping("/company")
	public String followCompany(@RequestParam(name = "id", defaultValue = "0") int id, Model model, Principal principal) {
		
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		return "list-follow-company";
	}
}
