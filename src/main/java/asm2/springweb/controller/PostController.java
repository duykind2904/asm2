package asm2.springweb.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import asm2.springweb.dto.ApplyPostDTO;
import asm2.springweb.entity.ApplyPost;
import asm2.springweb.entity.Category;
import asm2.springweb.entity.Company;
import asm2.springweb.entity.Recruitment;
import asm2.springweb.entity.User;
import asm2.springweb.model.FormatDate;
import asm2.springweb.repository.ApplyPostRepository;
import asm2.springweb.service.ApplyPostService;
import asm2.springweb.service.CategoryService;
import asm2.springweb.service.CompanyService;
import asm2.springweb.service.RecruitmentService;
import asm2.springweb.service.UserService;
import asm2.springweb.uti.RecruitmentShowList;
import asm2.springweb.util.Mapper;


@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired RecruitmentService recruitmentService;
	@Autowired UserService userService;
	@Autowired CompanyService companyService;
	@Autowired CategoryService categoryService;
	@Autowired ApplyPostService applyPostService;
	
	@RequestMapping("/list")
	public String listJob() {
		return "post-list";
	}
	
	@RequestMapping("/create")
	public String profile(Model model, Principal principal) {		
		Recruitment recruitment = new Recruitment();
		
		model.addAttribute("recruitment", Mapper.toJSON(recruitment));
		return "post-job";
	}
	
	@GetMapping("/detail")
	public String detailPost(@RequestParam(name="id", defaultValue = "0") int id, Model model) {
		Recruitment recruitment = recruitmentService.findById(id);
		recruitment.setCategorySelected(String.valueOf(recruitment.getCategory().getId()));
		recruitment.setCategory(null);
		recruitment.setCompany(null);
//		Recruitment recruitment = new Recruitment()

		model.addAttribute("recruitment", Mapper.toJSON(recruitment));
		return "detail-post";
	}
	
	@GetMapping("/edit")
	public String editPost(@RequestParam(name="id", defaultValue = "0") int id, Model model) {
		Recruitment recruitment = recruitmentService.findById(id);
		recruitment.setCategorySelected(String.valueOf(recruitment.getCategory().getId()));
		recruitment.setCategory(null);
		recruitment.setCompany(null);
//		Recruitment recruitment = new Recruitment();
		model.addAttribute("recruitment", Mapper.toJSON(recruitment));
		return "post-job";
	}
	
	
	
	@PostMapping("/save.json")
	@ResponseBody
	public ResponseEntity<String> save(@RequestBody Recruitment recruitment, Principal principal) {
		User user = userService.findByEmail(principal.getName());
		
		Company company = companyService.findByUserId(user.getId());
		
		int categoryId = Integer.parseInt(recruitment.getCategorySelected());
		Category category = categoryService.findById(categoryId);
		
		Date currentDate = new Date();
		String createAt = FormatDate.dateFormat.format(currentDate);
		String deadline = FormatDate.convertDateFormat(recruitment.getDeadline());
		
		recruitment.setCompany(company);
		recruitment.setCategory(category);
		recruitment.setCreatedAt(createAt);
		recruitment.setDeadline(deadline);
		recruitment.setStatus(false);
		
		recruitmentService.save(recruitment);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	
	@GetMapping("/isCompanyExsit.json")
	@ResponseBody
	public ResponseEntity<Boolean> isCompanyExsit(Principal principal) {
		Boolean check = companyService.isCompanyExsitByEmail(principal.getName());
		return new ResponseEntity<Boolean>(check, HttpStatus.OK);
	}
	
	
	@GetMapping("/countListPost.json")
	@ResponseBody
	public ResponseEntity<Long> countListPost(Principal principal) {
		long count = recruitmentService.countListByEmailUser(principal.getName());
		
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
	
	@GetMapping("/getListPost.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListPost(Principal principal,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "0") int pageSize) {
		pageNumber = pageNumber - 1;
		List<Recruitment> list = recruitmentService.getListByEmailUser(principal.getName(), pageNumber, pageSize);
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
	
	@GetMapping("/countApplyPostByRecId.json")
	@ResponseBody
	public ResponseEntity<Long> countApplyPostByRecId(@RequestParam(name = "id", defaultValue = "0") int id) {		
		
		long count = applyPostService.countApplyPostByRecId(id);		
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
	
	@GetMapping("/getListApplyPostByRecId.json")
	@ResponseBody
	public ResponseEntity<List<ApplyPostDTO>> getListApplyPostByRecId(
			@RequestParam(name="id", defaultValue = "0") int id,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "0") int pageSize) {
		pageNumber = pageNumber - 1;
		
		List<ApplyPost> apps = applyPostService.getListApplyPostByRecId(id, pageNumber, pageSize);
		List<ApplyPostDTO> list = new ArrayList<ApplyPostDTO>();
		for(ApplyPost a : apps) {
			ApplyPostDTO appDTO = ApplyPostDTO.setToDTO(a);
			list.add(appDTO);
		}
		
		return new ResponseEntity<List<ApplyPostDTO>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/deletePost.json")
	public ResponseEntity<String> deletePost(@RequestParam(name = "id", defaultValue = "0") int id) {
		
		recruitmentService.deleteById(id);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	
}
