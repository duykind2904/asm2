package asm2.springweb.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.Company;
import asm2.springweb.entity.Recruitment;

public interface CompanyRepository extends JpaRepository<Company, Integer>{
	@Query("SELECT c FROM Company c WHERE c.user.id = :userId")
    Company findByUserId(@Param("userId") int userId);
	
	@Query("SELECT CASE WHEN COUNT(c) > 0 THEN true ELSE false END FROM Company c "
			+ "JOIN c.user u WHERE u.email = :email")
	Boolean isCompanyExsitByEmail(@Param("email") String email);
	
	
	@Query(value = "SELECT * FROM company WHERE id IN ("
            + "SELECT r.company_id "
            + "FROM applypost ap "
            + "INNER JOIN recruitment r ON ap.recruitment_id = r.id "
            + "INNER JOIN company c ON r.company_id = c.id "
            + "GROUP BY r.company_id "
            + "ORDER BY COUNT(*) DESC) ",
            countQuery = "SELECT COUNT(*) FROM company",
            nativeQuery = true)
	Page<Company> getListOutstanding(Pageable pageable);
	
	@Query("SELECT count(c) FROM Company c "
			+ "WHERE id in (SELECT f.company.id FROM FollowCompany f WHERE f.user.id = :userId)")
	long countByFollowCompany(@Param("userId") int userId);
	
	@Query("SELECT c FROM Company c "
			+ "WHERE id in (SELECT f.company.id FROM FollowCompany f WHERE f.user.id = :userId)")
	Page<Company> getListByFollowCompany(@Param("userId") int userId, Pageable pageable);
	
	
}
