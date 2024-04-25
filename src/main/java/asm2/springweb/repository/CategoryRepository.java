package asm2.springweb.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm2.springweb.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	@Query("SELECT c, COUNT(r) AS number " +
	           "FROM Category c " +
	           "LEFT JOIN Recruitment r ON c.id = r.category.id " +
	           "GROUP BY c " +
	           "ORDER BY number DESC")
	List<Object[]> findCategoriesWithRecruitmentCount(Pageable pageable);
}
