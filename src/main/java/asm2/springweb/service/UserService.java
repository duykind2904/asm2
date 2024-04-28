package asm2.springweb.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asm2.springweb.entity.User;
import asm2.springweb.repository.UserRepository;

@Service
@Transactional
public class UserService implements UserDetailsService {
	@Autowired
	private UserRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = repo.findByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + email);
        }
        UserDetails userDetails = 
        		new org.springframework.security.core.userdetails.User(
        				user.getEmail(), 
        				user.getPassword(), 
        				true, true, true, true, 
        				Collections.singleton(new SimpleGrantedAuthority(user.getRole().getRoleName())));
        return userDetails;
	}
    
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
    
    public void updateCode(int userId, String code) {
    	User userToUpdate = repo.getOne(userId);
    	userToUpdate.setCode(code);
    	repo.save(userToUpdate);
    }
    
    public void updateStatus(int userId, boolean status) {
    	User userToUpdate = repo.getOne(userId);
    	userToUpdate.setStatus(status);
    	repo.save(userToUpdate);
    }

	
}
