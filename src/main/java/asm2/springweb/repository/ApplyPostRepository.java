package asm2.springweb.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.ApplyPost;
import asm2.springweb.entity.ApplyPostId;

public interface ApplyPostRepository extends JpaRepository<ApplyPost, ApplyPostId>{
	
	@Query("SELECT COUNT(a) FROM ApplyPost a WHERE a.recruitment.id = :recId")
	long countUserApplyPostByRecId(@Param("recId") int recId);
	
	@Query("SELECT a FROM ApplyPost a LEFT JOIN a.user u LEFT JOIN a.recruitment r WHERE a.recruitment.id = :recId")
	Page<ApplyPost> getListUserApplyPostByRecId(@Param("recId") int recId, Pageable pageable);
	
	@Query("SELECT COUNT(a) FROM ApplyPost a WHERE a.user.id = :userId AND a.recruitment.id = :recId")
	long checkExist(@Param("userId") int userId, @Param("recId") int recId);
}
