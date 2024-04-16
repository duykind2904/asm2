package asm2.springweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.FollowCompany;
import asm2.springweb.entity.FollowCompanyId;

public interface FollowCompanyRepository extends JpaRepository<FollowCompany, FollowCompanyId>{

	@Query("SELECT COUNT(f) FROM FollowCompany f WHERE f.user.id = :userId AND f.company.id = :companyId")
	long checkExist(@Param("userId") int userId, @Param("companyId") int companyId);
}
