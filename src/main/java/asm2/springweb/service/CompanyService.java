package asm2.springweb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.Company;
import asm2.springweb.repository.CompanyRepository;

@Service
@Transactional
public class CompanyService {
	@Autowired
	private CompanyRepository repo;
	
	public Company findByUserId(int userId) {
        return repo.findByUserId(userId) != null ? repo.findByUserId(userId): new Company();
    }
	
	public Company save(Company company) {
		return repo.save(company);
	}
	
	public Boolean isCompanyExsitByEmail(String email) {
		return repo.isCompanyExsitByEmail(email);
	}
	
	public List<Company> getListOutstanding(int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<Company> recruitmentPage = repo.getListOutstanding(pageable);
		return recruitmentPage.getContent();
	}
	
	public Company findById(int id) {
		return repo.findById(id).get();
	}
	
	public long countByFollowCompany(int userId) {
		return repo.countByFollowCompany(userId);
	}
	
	public List<Company> getListByFollowCompany(int userId, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		return repo.getListByFollowCompany(userId, pageable).getContent();
	}
	

}
