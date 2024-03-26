package asm2.springweb.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.ApplyPost;
import asm2.springweb.entity.ApplyPostId;

public interface ApplyPostRepository extends JpaRepository<ApplyPost, ApplyPostId>{
	
	@Query("SELECT COUNT(a) FROM ApplyPost a WHERE a.recruitment.id = :id")
	long countApplyPostByRecId(@Param("id") int id);
	
	@Query("SELECT a FROM ApplyPost a WHERE a.recruitment.id = :id")
	Page<ApplyPost> getListApplyPostByRecId(@Param("id") int id, Pageable pageable);
}
