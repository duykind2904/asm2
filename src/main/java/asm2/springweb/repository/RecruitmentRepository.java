package asm2.springweb.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import asm2.springweb.entity.Recruitment;

public interface RecruitmentRepository extends JpaRepository<Recruitment, Integer>{
	
	@Query("SELECT r FROM Recruitment r JOIN r.company c JOIN c.user u WHERE u.email = :email")
	Page<Recruitment> getListByEmailUser(@Param("email") String email, Pageable pageable);
	
	@Query("SELECT COUNT(r) FROM Recruitment r "
			+ "JOIN r.company c "
			+ "JOIN c.user u "
			+ "WHERE u.email = :email")
	long countByEmailUser(@Param("email") String email);
	
	
	@Query(value = "SELECT r.* FROM Recruitment r "
            + "JOIN (SELECT ap.recruitment_id, COUNT(*) as countApply "
            + "FROM ApplyPost ap "
            + "GROUP BY ap.recruitment_id "
            + "ORDER BY COUNT(*) DESC) ap "
            + "ON r.id = ap.recruitment_id "
            + "WHERE STR_TO_DATE(r.deadline, '%d/%m/%Y') >= CURDATE() "
            + "ORDER BY ap.countApply DESC, r.salary DESC, r.quantity DESC",
            countQuery = "SELECT COUNT(*) FROM Recruitment r",
            nativeQuery = true)
	Page<Recruitment> getListOutstanding(Pageable pageable);
	
	@Query(value = "select count(*) from spring_workcv.recruitment where "
            + "company_id = 1 and STR_TO_DATE(deadline, '%d/%m/%Y') >= CURDATE() ",
            nativeQuery = true)
	int countRecruitmenting(@Param("id") int id);
	
	
}
