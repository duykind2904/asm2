package asm2.springweb.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import asm2.springweb.dto.RoleDTO;
import asm2.springweb.dto.UserDTO;
import asm2.springweb.entity.User;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
public class HomeController {
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/")
	public String showHome(Model model) {	
		return "home";
	}
	
	
	@RequestMapping("/loginSuccess")
	public String loginSuccess(Model model, Principal principal) {		
		UserDTO userDTO = new UserDTO();
		RoleDTO roleDTO = new RoleDTO();
		User user = userService.findByEmail(principal.getName());
		BeanUtils.copyProperties(user.getRole(), roleDTO);
		BeanUtils.copyProperties(user, userDTO);
		userDTO.setRole(roleDTO);
		System.out.println(Mapper.toJSON(userDTO));
		model.addAttribute("user", Mapper.toJSON(userDTO));
		
		return "home";
	}
	
	
	
	
	
	@RequestMapping("/detailcompany")
	public String detailCompany() {
		return "detail-company";
	}
	
	@RequestMapping("/detailpost")
	public String detailPost() {
		return "detail-post";
	}
	
	@RequestMapping("/editjob")
	public String editPost() {
		return "edit-job";
	}
	
	@RequestMapping("/listapplyjob")
	public String listApplyJob() {
		return "list-apply-job";
	}
	
	@RequestMapping("/listfollowcompany")
	public String listFollowCompany() {
		return "list-follow-company";
	}
	
	@RequestMapping("/listjob")
	public String listJob() {
		return "list-job";
	}
	
	@RequestMapping("/listre")
	public String listRe() {
		return "list-re";
	}
	
	@RequestMapping("/listsavejob")
	public String listSaveJob() {
		return "list-save-job";
	}
	
	@RequestMapping("/listuser")
	public String listUser() {
		return "list-user";
	}
	
	@RequestMapping("/postcompany")
	public String postCompany() {
		return "post-company";
	}
	
	@RequestMapping("/postjob")
	public String postJob() {
		return "post-job";
	}
	
	@RequestMapping("/postlist")
	public String postList() {
		return "post-list";
	}
	
	
	
	@RequestMapping("/recruitment")
	public String recruitment() {
		return "recruitment";
	}
	
	@RequestMapping("/resultsearch")
	public String resultSearch() {
		return "result-search";
	}
	
	@RequestMapping("/resultsearchaddress")
	public String resultSearchAddress() {
		return "result-search-address";
	}
	
	@RequestMapping("/resultsearchuser")
	public String resultSearchUser() {
		return "result-search-user";
	}
	
	
}
