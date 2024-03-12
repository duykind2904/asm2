package asm2.springweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.Company;

public interface CompanyRepository extends JpaRepository<Company, Integer>{
	@Query("SELECT c FROM Company c WHERE c.user.id = :userId")
    Company findByUserId(@Param("userId") int userId);
}
