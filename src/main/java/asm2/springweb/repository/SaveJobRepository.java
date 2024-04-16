package asm2.springweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.SaveJob;
import asm2.springweb.entity.SaveJobId;

public interface SaveJobRepository extends JpaRepository<SaveJob, SaveJobId>{
	@Query("SELECT COUNT(s) FROM SaveJob s WHERE s.user.id = :userId AND s.recruitment.id = :recId")
	long checkExist(@Param("userId") int userId, @Param("recId") int recId);
}
