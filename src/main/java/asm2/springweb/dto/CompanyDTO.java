package asm2.springweb.dto;

import java.util.List;

import asm2.springweb.entity.Company;
import asm2.springweb.entity.Recruitment;
import asm2.springweb.entity.User;

public class CompanyDTO {
	private int id;		
	private String address;		
	private String email;		
	private String name;		
	private String description;
	private String phoneNumber;	
	private String logo;
	private boolean status;
	private User user;
	private List<Recruitment> recruitment;
	private int CountRecruitmenting;
	
	public static CompanyDTO convertToDTO(Company com) {
		CompanyDTO comDTO = new CompanyDTO();
		if(com.getId() > 0) comDTO.setId(com.getId());
		if(com.getAddress() != null) comDTO.setAddress(com.getAddress());
		if(com.getEmail() != null) comDTO.setEmail(com.getEmail());
		if(com.getName() != null) comDTO.setName(com.getName());
		if(com.getDescription() != null) comDTO.setDescription(com.getDescription());
		if(com.getPhoneNumber() != null) comDTO.setPhoneNumber(com.getPhoneNumber());
		if(com.getLogo() != null) comDTO.setLogo(com.getLogo());
		comDTO.setStatus(com.isStatus());
		
		return comDTO;
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Recruitment> getRecruitment() {
		return recruitment;
	}
	public void setRecruitment(List<Recruitment> recruitment) {
		this.recruitment = recruitment;
	}
	public int getCountRecruitmenting() {
		return CountRecruitmenting;
	}
	public void setCountRecruitmenting(int countRecruitmenting) {
		CountRecruitmenting = countRecruitmenting;
	}
	
	

}
