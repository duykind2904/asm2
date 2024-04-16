package asm2.springweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.Company;
import asm2.springweb.entity.FollowCompany;
import asm2.springweb.entity.FollowCompanyId;
import asm2.springweb.entity.User;
import asm2.springweb.repository.CompanyRepository;
import asm2.springweb.repository.FollowCompanyRepository;
import asm2.springweb.repository.UserRepository;

@Service
@Transactional
public class FollowCompanyService {
	@Autowired private FollowCompanyRepository repo;
	@Autowired private CompanyRepository companyRepo;
	@Autowired private UserRepository userRepo;
	
	public boolean checkExistFollow(int userId, int companyId) {
		long count = repo.checkExist(userId, companyId);
		return count > 0 ? true : false;
	}
	
	public String saveFollow(int userId, int companyId) {
		FollowCompany existingFollow = repo.findById(new FollowCompanyId(userId, companyId)).orElse(null);
		
		if (existingFollow == null) {
	        	        
	        Company company = companyRepo.findById(companyId).orElse(null);
	        User user = userRepo.findById(userId).orElse(null);
	        if (user == null || company == null) return "Fail";
	        
	        FollowCompany followCompany = new FollowCompany(user, company);
	        repo.save(followCompany);
	        return "OK";
	    } else {
	    	return "Existed";
	    }
	}
	
	public void deleteFollow(int userId, int companyId) {
		FollowCompany existingFollow = repo.findById(new FollowCompanyId(userId, companyId)).orElse(null);
		
		if (existingFollow != null) {	        
	        repo.delete(existingFollow);
	    }
	}
}
