package asm2.springweb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.Recruitment;
import asm2.springweb.repository.RecruitmentRepository;

@Service
@Transactional
public class RecruitmentService {
	@Autowired
	private RecruitmentRepository repo;
	
	public Recruitment save(Recruitment recruitment) {
		return repo.save(recruitment);
	}
	
	public long countListByEmailUser(String email) {
		return repo.countByEmailUser(email);
	}
	
	public List<Recruitment> getListByEmailUser(String email, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListByEmailUser(email, pageable);
	    return recruitmentPage.getContent();
//		return repo.getListByEmailUser(email, pageNumber, pageSize);
	}
	
	public long countListByCompanyId(int companyId) {
		return repo.countByCompanyId(companyId);
	}
	
	public List<Recruitment> getListByCompanyId(int companyId, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListByCompanyId(companyId, pageable);
	    return recruitmentPage.getContent();
	}
	
	public Recruitment findById(int id) {
		Optional<Recruitment> r = repo.findById(id);
		return r.get();
	}
	
	public void deleteById(int id) {
		repo.deleteById(id);
	}
	
	public List<Recruitment> getListOutstanding(int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListOutstanding(pageable);
		return recruitmentPage.getContent();
	}
	
	public int countRecruitmenting(int id) {
		return repo.countRecruitmenting(id);
	}
	
	public long countBySearchTitle(String key) {
		return repo.countBySearchTitle(key);
	}
	
	public List<Recruitment> getListBySearchTitle(String key, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListBySearchTitle(key, pageable);
		return recruitmentPage.getContent();
	}
	
	public long countBySearchCompany(String key) {
		return repo.countBySearchCompany(key);
	}
	
	public List<Recruitment> getListBySearchCompany(String key, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListBySearchCompany(key, pageable);
		return recruitmentPage.getContent();
	}
	
	public long countBySearchAddress(String key) {
		return repo.countBySearchAddress(key);
	}
	
	public List<Recruitment> getListBySearchAddress(String key, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListBySearchAddress(key, pageable);
		return recruitmentPage.getContent();
	}
	
	public long countByApplyPost(int userId) {
		return repo.countByApplyPost(userId);
	}
	
	public List<Recruitment> getListByApplyPost(int userId, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListByApplyPost(userId, pageable);
		return recruitmentPage.getContent();
	}
	
	public long countByFollow(int userId) {
		return repo.countByFollow(userId);
	}
	
	public List<Recruitment> getListByFollow(int userId, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Recruitment> recruitmentPage = repo.getListByFollow(userId, pageable);
		return recruitmentPage.getContent();
	}

}
