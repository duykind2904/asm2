package asm2.springweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asm2.springweb.entity.Category;
import asm2.springweb.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired CategoryService categoryService;
	
	@GetMapping("/getCategory.json")
	@ResponseBody
	public ResponseEntity<List<Category>> findAll() {
		return new ResponseEntity<List<Category>>(categoryService.findAll(), HttpStatus.OK);
	}
	
	@GetMapping("/findCategoriesWithRecruitmentCount.json")
	@ResponseBody
	public ResponseEntity<List<Category>> findCategoriesWithRecruitmentCount() {
		List<Category> cs = categoryService.findCategoriesWithRecruitmentCount();
		return new ResponseEntity<List<Category>>(cs, HttpStatus.OK);
	}
}
