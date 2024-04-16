package asm2.springweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.User;
import asm2.springweb.repository.UserRepository;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepository repo;
	
    
    public User save(User user) {
        return repo.save(user);
    }
     
    public List<User> findAllUsers() {
    	Sort sort = Sort.by(Sort.Direction.ASC, "id");
        return repo.findAll(sort);
    }
    
    public User findById(int id) {
        return repo.findById(id).get();
    }
     
    public void delete(int id) {
        repo.deleteById(id);
    }
    
    public Page<User> findAll(Pageable pageable) {
        return repo.findAll(pageable);
    }
    
    public User findByEmail(String email) {   	
    	return repo.findByEmail(email);
    }
    
    public void updatenameCVToUser(int userId, String nameCV) {
    	User userToUpdate = repo.getOne(userId);
        userToUpdate.setCvName(nameCV);
        repo.save(userToUpdate);
    }
}
