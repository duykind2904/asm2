package asm2.springweb.dto;

import asm2.springweb.entity.User;

public class UserDTO {
	
	private int id;	
	private String address;	
	private String email;	
	private String fullName;	
	private String description;	
	private String password;	
	private String phoneNumber;	
	private boolean status;	
	private String image;
	
    private RoleDTO role;
	
	private String cvName;
	
	public static UserDTO convertToDTO(User user) {
		UserDTO u = new UserDTO();
		u.setId(user.getId());
		if(user.getAddress() != null) u.setAddress(user.getAddress());
		if(user.getEmail() != null) u.setEmail(user.getEmail());
		if(user.getFullName() != null) u.setFullName(user.getFullName());
		if(user.getDescription() != null) u.setDescription(user.getDescription());
//		if(user.getAddress() != null) u.setPassword(user.getPassword());
		if(user.getPhoneNumber() != null) u.setPhoneNumber(user.getPhoneNumber());
		u.setStatus(user.isStatus());
		if(user.getImage() != null) u.setImage(user.getImage());
		if(user.getCvName() != null) u.setCvName(user.getCvName());
		
		return u;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public RoleDTO getRole() {
		return role;
	}

	public void setRole(RoleDTO role) {
		this.role = role;
	}

	public String getCvName() {
		return cvName;
	}

	public void setCvName(String cvName) {
		this.cvName = cvName;
	}
	
	
	
	
	
}
