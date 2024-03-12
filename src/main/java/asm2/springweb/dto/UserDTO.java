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
	private int status;	
	private String image;
	
    private RoleDTO role;
	
	private String cvId;
	
//	public static UserDTO convertToUserDTO(User user) {
//		UserDTO u = new UserDTO();
//		u.setId(user.getId());
//		u.setAddress(user.getAddress());
//		u.setEmail(user.getEmail());
//		u.setFullName(user.getFullName());
//		u.setDescription(user.getDescription());
//		u.setPassword(user.getPassword());
//		u.setPhoneNumber(user.getPhoneNumber());
//		u.setStatus(user.getStatus());
//		u.setImage(user.getImage());
//		u.setCvId(user.getCvId());
//		
//		return u;
//	}

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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
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

	public String getCvId() {
		return cvId;
	}

	public void setCvId(String cvId) {
		this.cvId = cvId;
	}
	
	
	
	
	
}
