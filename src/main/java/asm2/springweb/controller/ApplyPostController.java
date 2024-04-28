package asm2.springweb.controller;

import java.security.Principal;

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
import asm2.springweb.entity.Recruitment;
import asm2.springweb.entity.User;
import asm2.springweb.service.ApplyPostService;
import asm2.springweb.service.RecruitmentService;
import asm2.springweb.service.UserService;
import asm2.springweb.util.Mapper;

@Controller
@RequestMapping("/applyPost")
public class ApplyPostController {
	@Autowired private ApplyPostService applyPostService;
	@Autowired private UserService userService;
	@Autowired private RecruitmentService recruitmentService;
	
	@RequestMapping("/list")
	public String listApplyPost(Model model, Principal principal) {		
		User user = new User();
		if(principal != null) {
			user = userService.findByEmail(principal.getName());
		}
		ApplyPostDTO aPDTO = new ApplyPostDTO();
		
		model.addAttribute("applyPost", Mapper.toJSON(aPDTO));
		model.addAttribute("userId", Mapper.toJSON(user.getId()));
		return "list-apply-job";
	}
	
	@PostMapping("/saveApplyPost.json")
	@ResponseBody
	public ResponseEntity<String> saveApplyPost(@RequestBody ApplyPostDTO aPDTO) {
		User user = userService.findById(aPDTO.getUserId());
		Recruitment recruitment = recruitmentService.findById(aPDTO.getRecruitmentId());
		aPDTO.setUser(user);
		aPDTO.setRecruitment(recruitment);
		
		ApplyPost app = ApplyPostDTO.setToEntity(aPDTO);
		applyPostService.save(app);
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
	
	@GetMapping("/updateStatusApplyPost.json")
	@ResponseBody
	public ResponseEntity<String> updateStatusApplyPost(
			@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "recId", defaultValue = "0") int recId,
			@RequestParam(name = "isStatus", defaultValue = "false") boolean isStatus) {		

		if(userId > 0 && recId > 0) {
			boolean check = applyPostService.checkExistApply(userId, recId);
			if (check) {
				applyPostService.updateStatusApplyPost(userId, recId, isStatus);
				return new ResponseEntity<String>("OK", HttpStatus.OK);
			}			
		}
		
		return new ResponseEntity<String>("KO", HttpStatus.OK);
		
	}
	
	@GetMapping("/getApplyPostByRecIdAndUserId.json")
	@ResponseBody
	public ResponseEntity<ApplyPostDTO> getApplyPostByRecIdAndUserId(
			@RequestParam(name = "userId", defaultValue = "0") int userId,
			@RequestParam(name = "recId", defaultValue = "0") int recId) {		

		ApplyPost app  = new ApplyPost();
		if(userId > 0 && recId > 0) {
			app  = applyPostService.getApplyPostByRecIdAndUserId(userId, recId);						
		}
		ApplyPostDTO appDTO = new ApplyPostDTO();
		appDTO = ApplyPostDTO.setToDTO(app);
		return new ResponseEntity<>(appDTO, HttpStatus.OK);
		
	}

}
