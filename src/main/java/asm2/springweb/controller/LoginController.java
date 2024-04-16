package asm2.springweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import asm2.springweb.dto.ApplyPostDTO;
import asm2.springweb.dto.RoleDTO;
import asm2.springweb.entity.Role;
import asm2.springweb.entity.User;
import asm2.springweb.repository.UserRepository;
import asm2.springweb.service.RoleService;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
@RequestMapping("/auth")
public class LoginController {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired private RoleService roleService;
	
	@Autowired private UserService userService;
	
	@GetMapping("/login")
	public String showHome(Model model) {
		User user = new User();
		model.addAttribute("user", Mapper.toJSON(user));		
		return "login";
	}

	@RequestMapping("/register")
	public String saveUser(@RequestBody User user, Model model) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));		
		User u = userService.save(user);
		model.addAttribute("user", Mapper.toJSON(u));
		
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		
		return "redirect:/home";
	}
	
	@RequestMapping("/getRole.json")
	@ResponseBody
	public RoleDTO getRoleById(@RequestParam(value = "roleId", defaultValue =  "0") String roleId) {
		Role role = roleService.findById(Integer.parseInt(roleId));
		return RoleDTO.convertToDTO(role);
	}
	
	
	@PostMapping("/checkEmail.json")
	@ResponseBody
	public boolean checkEmailCanDo(@RequestParam(value = "email", defaultValue =  "") String email) {
		return userService.findByEmail(email) != null ? true : false;
	}
	
}
