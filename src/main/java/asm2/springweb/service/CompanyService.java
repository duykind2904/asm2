package asm2.springweb.service;

import org.springframework.beans.factory.annotation.Autowired;
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

}
