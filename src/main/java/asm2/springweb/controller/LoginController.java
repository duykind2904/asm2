package asm2.springweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import asm2.springweb.Email.EmailService;
import asm2.springweb.dto.RoleDTO;
import asm2.springweb.entity.Role;
import asm2.springweb.entity.User;
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
	
	private final AuthenticationManager authenticationManager;
	
	@Autowired private EmailService emailService;
	
	public LoginController(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }
	
	@GetMapping("/login")
	public String showHome(Model model) {
		User user = new User();
		model.addAttribute("user", Mapper.toJSON(user));		
		return "login";
	}

	@RequestMapping("/saveUser.json")
	@ResponseBody
	public ResponseEntity<Integer> saveUser(@RequestBody User user, Model model) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));		
		User u = userService.save(user);
		
		return new ResponseEntity<Integer>(u.getId(), HttpStatus.OK);
	}
	
	@RequestMapping("/authenticateEmail.json")
	@ResponseBody
	public ResponseEntity<String> authenticateEmail(@RequestParam(name = "email") String email) {
		User user = userService.findByEmail(email);
		if(user != null) {
			try {
				
	            emailService.sendMail("duykind2904@gmail.com", "Test Email", "This is a test email from Spring MVC.");
	            return new ResponseEntity<String>("Email sent successfully", HttpStatus.OK);
	        } catch (Exception ex) {
	        	return new ResponseEntity<String>("Error sending email", HttpStatus.OK);
	        }			
			
		} else {
			return new ResponseEntity<String>("email not existed", HttpStatus.OK);
		}
		
    }
	
	@RequestMapping("/checkStatusUserByEmail.json")
	@ResponseBody
	public ResponseEntity<String> checkStatusUserByEmail(@RequestParam(name = "email") String email) {
		User user = userService.findByEmail(email);
		if(user != null) {
			if(user.isStatus()) {
				return new ResponseEntity<String>("true", HttpStatus.OK);
			} else {
				return new ResponseEntity<String>("false", HttpStatus.OK);
			}
		} else {
			return new ResponseEntity<String>("email not existed", HttpStatus.OK);
		}
		
    }
	
	@RequestMapping("/loginSuccess.json")
	@ResponseBody
	public ResponseEntity<String> loginSuccess(@RequestParam(name = "email") String email, @RequestParam(name = "password") String password) {
        try {
        	Authentication authentication = new UsernamePasswordAuthenticationToken(email, password);
            Authentication authenticated = authenticationManager.authenticate(authentication);
            SecurityContextHolder.getContext().setAuthentication(authenticated);
        } catch (AuthenticationException e) {
        	return new ResponseEntity<String>("KO", HttpStatus.OK);
        }
		
        return new ResponseEntity<String>("OK", HttpStatus.OK);
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
