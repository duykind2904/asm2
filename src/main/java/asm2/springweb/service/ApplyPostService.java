package asm2.springweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.ApplyPost;
import asm2.springweb.repository.ApplyPostRepository;

@Service
@Transactional
public class ApplyPostService {

	@Autowired private ApplyPostRepository repo;
	
	public long countApplyPostByRecId(int id) {
		return repo.countApplyPostByRecId(id);
	}

	public List<ApplyPost> getListApplyPostByRecId(int id, int pageNumber, int pageSize) {
		PageRequest pageable = PageRequest.of(pageNumber, pageSize);
		Page<ApplyPost> page = repo.getListApplyPostByRecId(id, pageable);
	    return page.getContent();
	}
}
