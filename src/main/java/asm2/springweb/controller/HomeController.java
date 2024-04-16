package asm2.springweb.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import asm2.springweb.dto.ApplyPostDTO;
import asm2.springweb.dto.CompanyDTO;
import asm2.springweb.dto.RoleDTO;
import asm2.springweb.dto.UserDTO;
import asm2.springweb.entity.Company;
import asm2.springweb.entity.Recruitment;
import asm2.springweb.entity.User;
import asm2.springweb.service.ApplyPostService;
import asm2.springweb.service.CategoryService;
import asm2.springweb.service.CompanyService;
import asm2.springweb.service.RecruitmentService;
import asm2.springweb.service.UserService;
import asm2.springweb.uti.RecruitmentShowList;
import asm2.springweb.util.Mapper;

@Controller
public class HomeController {
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	
	@Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired RecruitmentService recruitmentService;
	@Autowired UserService userService;
	@Autowired CompanyService companyService;
	@Autowired CategoryService categoryService;
	@Autowired ApplyPostService applyPostService;
	
	
	@RequestMapping("/")
	public String showHome(Model model, Principal principal) {	
		int userId = 0;
		if(principal != null) {
			User user = userService.findByEmail(principal.getName());
			userId = user.getId();
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
				
		model.addAttribute("userId", Mapper.toJSON(userId));
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
				
		return "home";
	}
	
	
	@RequestMapping("/loginSuccess")
	public String loginSuccess(Model model, Principal principal) {		
		int userId = 0;
		if(principal != null) {
			User user = userService.findByEmail(principal.getName());
			userId = user.getId();
		}
				
		model.addAttribute("userId", Mapper.toJSON(userId));
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		
		return "home";
	}
	
	@GetMapping("/getRecruitmentOutstanding.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getRecruitmentOutstanding(Principal principal) {
		int pageNumber = 0;
		int pageSize = 5;
		List<Recruitment> list = recruitmentService.getListOutstanding(pageNumber, pageSize);
		List<RecruitmentShowList> listShow = new ArrayList<RecruitmentShowList>();
		for(Recruitment r : list) {
			RecruitmentShowList rs = new RecruitmentShowList();
			rs.setId(r.getId());
			rs.setTitle(r.getTitle());
			rs.setAddress(r.getAddress());
			rs.setCompanyName(r.getCompany().getName());
			rs.setStatus(r.isStatus());
			rs.setType(r.getType());
			listShow.add(rs);
		}
		return new ResponseEntity<List<RecruitmentShowList>>(listShow, HttpStatus.OK);
	}
	
	
	@GetMapping("/getCompanyOutstanding.json")
	@ResponseBody
	public ResponseEntity<List<CompanyDTO>> getCompanyOutstanding(Principal principal) {
		int pageNumber = 0;
		int pageSize = 5;
		List<Company> list = companyService.getListOutstanding(pageNumber, pageSize);
		List<CompanyDTO> listShow = new ArrayList<CompanyDTO>();
		for(Company c: list) {
			CompanyDTO cd = new CompanyDTO();
			cd.setId(c.getId());
			cd.setName(c.getName());
			cd.setLogo(c.getLogo());
			int countRecruitmenting = recruitmentService.countRecruitmenting(c.getId());
			cd.setCountRecruitmenting(countRecruitmenting);
			listShow.add(cd);
		}
		return new ResponseEntity<List<CompanyDTO>>(listShow, HttpStatus.OK);
	}
	
	
	
	
	
	
//	@RequestMapping("/detailcompany")
//	public String detailCompany() {
//		return "detail-company";
//	}
//	
//	@RequestMapping("/detailpost")
//	public String detailPost() {
//		return "detail-post";
//	}
//	
//	@RequestMapping("/editjob")
//	public String editPost() {
//		return "edit-job";
//	}
//	
//	@RequestMapping("/listapplyjob")
//	public String listApplyJob() {
//		return "list-apply-job";
//	}
//	
//	@RequestMapping("/listfollowcompany")
//	public String listFollowCompany() {
//		return "list-follow-company";
//	}
//	
//	@RequestMapping("/listjob")
//	public String listJob() {
//		return "list-job";
//	}
//	
//	@RequestMapping("/listre")
//	public String listRe() {
//		return "list-re";
//	}
//	
//	@RequestMapping("/listsavejob")
//	public String listSaveJob() {
//		return "list-save-job";
//	}
//	
//	@RequestMapping("/listuser")
//	public String listUser() {
//		return "list-user";
//	}
//	
//	@RequestMapping("/postcompany")
//	public String postCompany() {
//		return "post-company";
//	}
//	
//	@RequestMapping("/postjob")
//	public String postJob() {
//		return "post-job";
//	}
//	
//	@RequestMapping("/postlist")
//	public String postList() {
//		return "post-list";
//	}
//	
//	
//	
//	@RequestMapping("/recruitment")
//	public String recruitment() {
//		return "recruitment";
//	}
//	
//	@RequestMapping("/resultsearch")
//	public String resultSearch() {
//		return "result-search";
//	}
//	
//	@RequestMapping("/resultsearchaddress")
//	public String resultSearchAddress() {
//		return "result-search-address";
//	}
//	
//	@RequestMapping("/resultsearchuser")
//	public String resultSearchUser() {
//		return "result-search-user";
//	}
	
	
}
