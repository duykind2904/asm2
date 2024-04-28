package asm2.springweb.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
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
import org.springframework.web.multipart.MultipartFile;

import asm2.springweb.dto.ApplyPostDTO;
import asm2.springweb.dto.RecruitmentDTO;
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
import asm2.springweb.service.SaveJobService;
import asm2.springweb.service.UserService;
import asm2.springweb.uti.FollowAndApplyPost;
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
	@Autowired SaveJobService saveJobService;
	
	@RequestMapping("/list")
	public String listJob(Model model, Principal principal,
			@RequestParam(name="companyId", defaultValue = "0") int companyId) {
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		if(user.getRole() != null && user.getRole().getId() == 2) {
			Company company = companyService.findByUserId(user.getId());
			companyId = company.getId();
			
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));		
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		model.addAttribute("companyId", Mapper.toJSON(companyId));
		return "post-list";
	}
	
	@RequestMapping("/create")
	public String profile(Model model, Principal principal) {		
		Recruitment recruitment = new Recruitment();
		
		model.addAttribute("recruitment", Mapper.toJSON(recruitment));
		return "post-job";
	}
	
	@GetMapping("/detail")
	public String detailPost(@RequestParam(name="id", defaultValue = "0") int id, Model model, Principal principal) {
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
				
		Recruitment recruitment = recruitmentService.findById(id);
		recruitment.setCategorySelected(String.valueOf(recruitment.getCategory().getId()));
		RecruitmentDTO recDTO = RecruitmentDTO.convertToDTO(recruitment);

		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		model.addAttribute("recruitment", Mapper.toJSON(recDTO));
		return "post-detail";
	}
	
	@GetMapping("/edit")
	public String editPost(@RequestParam(name="id", defaultValue = "0") int id, Model model) {
		Recruitment recruitment = recruitmentService.findById(id);
		recruitment.setCategorySelected(String.valueOf(recruitment.getCategory().getId()));
		recruitment.setCategory(null);
		recruitment.setCompany(null);
		
		model.addAttribute("recruitment", Mapper.toJSON(recruitment));
		return "post-job";
	}
	
	@GetMapping("/searchJob")
	public String pageSearch(Principal principal, Model model,
			@RequestParam(name="key", defaultValue = "") String key) {
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("key", Mapper.toJSON(key));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		return "resultSearch";
	}
	
	@GetMapping("/searchCompany")
	public String pageSearchCompany(Principal principal, Model model,
			@RequestParam(name="key", defaultValue = "") String key) {
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("key", Mapper.toJSON(key));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		return "resultSearchCompany";
	}
	
	@GetMapping("/searchAddress")
	public String pageSearchAddress(Principal principal, Model model,
			@RequestParam(name="key", defaultValue = "") String key) {
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("key", Mapper.toJSON(key));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		return "resultSearchAddress";
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
	
	
	@GetMapping("/countListPostByCompanyId.json")
	@ResponseBody
	public ResponseEntity<Long> countListPostByCompanyId(Principal principal,
			@RequestParam(name = "companyId", defaultValue = "0") int companyId) {
		long count = 0;
		if(companyId == 0) {
			count = recruitmentService.countListByEmailUser(principal.getName());
		} else {
			count = recruitmentService.countListByCompanyId(companyId);
		}
		
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
	
	@GetMapping("/getListPostByCompanyId.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListPostByCompanyId(Principal principal,
			@RequestParam(name = "companyId", defaultValue = "0") int companyId,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "0") int pageSize) {
		pageNumber = pageNumber - 1;
		
		List<Recruitment> list = new ArrayList<Recruitment>();
		if(companyId == 0) {
			list = recruitmentService.getListByEmailUser(principal.getName(), pageNumber, pageSize);
		} else {
			list = recruitmentService.getListByCompanyId(companyId, pageNumber, pageSize);
		}
		
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
	
	@GetMapping("/countUserApplyPostByRecId.json")
	@ResponseBody
	public ResponseEntity<Long> countApplyPostByRecId(Principal principal,
			@RequestParam(name = "recId", defaultValue = "0") int recId) {		

		if(principal != null) {
			User user = userService.findByEmail(principal.getName());
			
			long count = applyPostService.countUserApplyPostByRecId(recId);		
			return new ResponseEntity<Long>(count, HttpStatus.OK);
		}
		return new ResponseEntity<Long>(0L, HttpStatus.OK);
		
	}
	
	@GetMapping("/getListUserApplyPostByRecId.json")
	@ResponseBody
	public ResponseEntity<List<ApplyPostDTO>> getListUserApplyPostByRecId(
			Principal principal,
			@RequestParam(name="recId", defaultValue = "0") int recId,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "0") int pageSize) {
		
		pageNumber = pageNumber - 1;
		List<ApplyPostDTO> list = new ArrayList<ApplyPostDTO>();
		
		if(principal != null) {			
			List<ApplyPost> apps = applyPostService.getListUserApplyPostByRecId(recId, pageNumber, pageSize);
			
			for(ApplyPost a : apps) {
				ApplyPostDTO appDTO = ApplyPostDTO.setToDTO(a);
				User user = userService.findById(appDTO.getUserId());
				user.setPassword(null);
				appDTO.setUser(user);
				list.add(appDTO);
			}			
			return new ResponseEntity<List<ApplyPostDTO>>(list, HttpStatus.OK);
		}
		
		return new ResponseEntity<List<ApplyPostDTO>>(list, HttpStatus.OK); 
		
	}
	
	@GetMapping("/deletePost.json")
	public ResponseEntity<String> deletePost(@RequestParam(name = "id", defaultValue = "0") int id) {
		
		recruitmentService.deleteById(id);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@GetMapping("/countListPostSearchJob.json")
	@ResponseBody
	public ResponseEntity<Long> countListPostSearchJob(@RequestParam(name = "key", defaultValue = "") String key) {		
		
		long count = recruitmentService.countBySearchTitle(key);		
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
	
    @GetMapping("/getListPostSearchJob.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListPostSearchJob(Principal principal,
			@RequestParam(name="key", defaultValue = "") String key,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "5") int pageSize) {
		pageNumber = pageNumber - 1;
		List<Recruitment> list = recruitmentService.getListBySearchTitle(key, pageNumber, pageSize);
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
    
    @GetMapping("/countListPostSearchCompany.json")
	@ResponseBody
	public ResponseEntity<Long> countListPostSearchCompany(@RequestParam(name = "key", defaultValue = "") String key) {		
		
		long count = recruitmentService.countBySearchCompany(key);		
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
	
    @GetMapping("/getListPostSearchCompany.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListPostSearchCompany(Principal principal,
			@RequestParam(name="key", defaultValue = "") String key,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "5") int pageSize) {
		pageNumber = pageNumber - 1;
		List<Recruitment> list = recruitmentService.getListBySearchCompany(key, pageNumber, pageSize);
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
    
    @GetMapping("/countListPostSearchAddress.json")
	@ResponseBody
	public ResponseEntity<Long> countListPostSearchAddress(@RequestParam(name = "key", defaultValue = "") String key) {		
		
		long count = recruitmentService.countBySearchAddress(key);		
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
	
    @GetMapping("/getListPostSearchAddress.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListPostSearchAddress(Principal principal,
			@RequestParam(name="key", defaultValue = "") String key,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "5") int pageSize) {
		pageNumber = pageNumber - 1;
		List<Recruitment> list = recruitmentService.getListBySearchAddress(key, pageNumber, pageSize);
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
    
    @GetMapping("/countByApplyPost.json")
	@ResponseBody
	public ResponseEntity<Long> countByApplyPost(Principal principal) {		
    	User user = new User();
		if(principal == null) {
			return new ResponseEntity<Long>(-1L, HttpStatus.OK);
		}
		
		user = userService.findByEmail(principal.getName());
		
		long count = recruitmentService.countByApplyPost(user.getId());
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
    
    @GetMapping("/getListByApplyPost.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListByApplyPost(Principal principal,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "5") int pageSize) {
    	User user = new User();
		if(principal == null) {
			return new ResponseEntity<>(null, HttpStatus.OK);
		}
		
		user = userService.findByEmail(principal.getName());
		
		pageNumber = pageNumber - 1;
		List<Recruitment> list = recruitmentService.getListByApplyPost(user.getId(), pageNumber, pageSize);
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
    
    @GetMapping("/countByFollow.json")
	@ResponseBody
	public ResponseEntity<Long> countByFollow(Principal principal) {		
    	User user = new User();
		if(principal == null) {
			return new ResponseEntity<Long>(-1L, HttpStatus.OK);
		}
		
		user = userService.findByEmail(principal.getName());
		
		long count = recruitmentService.countByFollow(user.getId());
		return new ResponseEntity<Long>(count, HttpStatus.OK);
	}
    
    @GetMapping("/getListByFollow.json")
	@ResponseBody
	public ResponseEntity<List<RecruitmentShowList>> getListByFollow(Principal principal,
			@RequestParam(name="pageNumber", defaultValue = "1") int pageNumber,
			@RequestParam(name="pageSize", defaultValue = "5") int pageSize) {
    	User user = new User();
		if(principal == null) {
			return new ResponseEntity<>(null, HttpStatus.OK);
		}
		
		user = userService.findByEmail(principal.getName());
		
		pageNumber = pageNumber - 1;
		List<Recruitment> list = recruitmentService.getListByFollow(user.getId(), pageNumber, pageSize);
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
    
    @GetMapping("/checkFollowAndApplyPost.json")
	@ResponseBody
	public ResponseEntity<FollowAndApplyPost> checkFollowAndApplyPost(
			@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "recId", defaultValue = "0") int recId) {
		Boolean isFollow = saveJobService.checkExistFollow(userId, recId);
		Boolean isApply = applyPostService.checkExistApply(userId, recId);
		
		FollowAndApplyPost fa = new FollowAndApplyPost();
		fa.setFollow(isFollow);
		fa.setApply(isApply);
		
		return new ResponseEntity<FollowAndApplyPost>(fa, HttpStatus.OK);
	}
    
    @GetMapping("/saveFollow.json")
	@ResponseBody
	public ResponseEntity<String> saveFollow(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "recId", defaultValue = "0") int recId) {
		saveJobService.saveFollow(userId, recId);
		
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@GetMapping("/deleteFollow.json")
	@ResponseBody
	public ResponseEntity<String> deleteFollow(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "recId", defaultValue = "0") int recId) {
		saveJobService.deleteFollow(userId, recId);
		
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@GetMapping("/handleFollowPost.json")
	@ResponseBody
	public ResponseEntity<String> handleFollowPost(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "recId", defaultValue = "0") int recId,
			@RequestParam(name = "isFollow", defaultValue = "true") boolean isFollow) {
		if(isFollow) {
			saveJobService.saveFollow(userId, recId);
		} else {
			saveJobService.deleteFollow(userId, recId);
		}
				
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@GetMapping("/getFileNameCVByUserId.json")
	@ResponseBody
	public ResponseEntity<String> getFileNameCVByUserId(@RequestParam(name = "userId", defaultValue = "0") int userId) {
		User user = userService.findById(userId);
		if(user.getCvName() != null) {
			return new ResponseEntity<String>(user.getCvName(), HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("", HttpStatus.OK);
		}
		
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
	
	@GetMapping("/updatenameCVToUser.json")
	@ResponseBody
	public ResponseEntity<String>updatenameCVToUser(@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "nameCV", defaultValue = "") String nameCV) {
		userService.updatenameCVToUser(userId, nameCV);
		
		return new ResponseEntity<String>("OK", HttpStatus.OK);
		
		
	}
	
}
