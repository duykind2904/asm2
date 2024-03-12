package asm2.springweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.Role;
import asm2.springweb.repository.RoleRepository;


@Service
@Transactional
public class RoleService {

	@Autowired
	private RoleRepository repo;
	
	public Role findById(int id) {
        return repo.findById(id).get();
    }
}
