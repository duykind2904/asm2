package asm2.springweb.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.Category;
import asm2.springweb.repository.CategoryRepository;

@Service
@Transactional
public class CategoryService {
	@Autowired
	private CategoryRepository repo;
	
	public List<Category> findAll() {
		return repo.findAll();
	}
	
	public Category findById(int id) {
		return repo.getOne(id);
	}
	
	public List<Category> findCategoriesWithRecruitmentCount() {
        Pageable pageable = PageRequest.of(0, 4);
        List<Object[]> results = repo.findCategoriesWithRecruitmentCount(pageable);
        List<Category> categories = new ArrayList<>();
        for (Object[] result : results) {
        	Category category = new Category((Category) result[0], ((Number) result[1]).intValue());
            categories.add(category);
        }
        return categories;
    }
}
