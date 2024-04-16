package asm2.springweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.Company;
import asm2.springweb.entity.FollowCompany;
import asm2.springweb.entity.FollowCompanyId;
import asm2.springweb.entity.Recruitment;
import asm2.springweb.entity.SaveJob;
import asm2.springweb.entity.SaveJobId;
import asm2.springweb.entity.User;
import asm2.springweb.repository.RecruitmentRepository;
import asm2.springweb.repository.SaveJobRepository;
import asm2.springweb.repository.UserRepository;

@Service
@Transactional
public class SaveJobService {
	@Autowired private SaveJobRepository repo;
	@Autowired private RecruitmentRepository recruitmentRepo;
	@Autowired private UserRepository userRepo;
	
	public boolean checkExistFollow(int userId, int companyId) {
		long count = repo.checkExist(userId, companyId);
		return count > 0 ? true : false;
	}
	
	public String saveFollow(int userId, int recId) {
		SaveJob existingFollow = repo.findById(new SaveJobId(userId, recId)).orElse(null);
		
		if (existingFollow == null) {
	        	        
	        Recruitment rec = recruitmentRepo.findById(recId).orElse(null);
	        User user = userRepo.findById(userId).orElse(null);
	        if (user == null || rec == null) return "Fail";
	        
	        SaveJob saveJob = new SaveJob(user, rec);
	        repo.save(saveJob);
	        return "OK";
	    } else {
	    	return "Existed";
	    }
	}
	
	public void deleteFollow(int userId, int recId) {
		SaveJob existingFollow = repo.findById(new SaveJobId(userId, recId)).orElse(null);
		
		if (existingFollow != null) {	        
	        repo.delete(existingFollow);
	    }
	}

}
