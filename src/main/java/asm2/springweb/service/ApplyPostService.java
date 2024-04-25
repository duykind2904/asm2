package asm2.springweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.ApplyPost;
import asm2.springweb.entity.ApplyPostId;
import asm2.springweb.entity.User;
import asm2.springweb.repository.ApplyPostRepository;

@Service
@Transactional
public class ApplyPostService {

	@Autowired private ApplyPostRepository repo;
	
	public long countUserApplyPostByRecId(int recId) {
		return repo.countUserApplyPostByRecId(recId);
	}

	public List<ApplyPost> getListUserApplyPostByRecId(int recId, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<ApplyPost> page = repo.getListUserApplyPostByRecId(recId, pageable);
	    return page.getContent();
	}
	
	public void save(ApplyPost app) {
		repo.save(app);
	}
	
	public boolean checkExistApply(int userId, int recId) {
		long count = repo.checkExist(userId, recId);
		return count > 0 ? true : false;
	}
	
	public void updateStatusApplyPost(int userId, int recId, boolean isStatus) {
		ApplyPostId id = new ApplyPostId(recId, userId);
		ApplyPost applyPostToUpdate = repo.getOne(id);
		applyPostToUpdate.setStatus(isStatus);
        repo.save(applyPostToUpdate);
	}
}
