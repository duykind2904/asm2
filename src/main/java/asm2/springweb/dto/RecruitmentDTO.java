package asm2.springweb.dto;

import asm2.springweb.entity.Recruitment;

public class RecruitmentDTO {
	
	private int id;
	private String address;
	private String description;
	private String experience;
	private String quantity;
	private String rank;
	private String salary;
	private boolean isStatus;
	private String title;
	private String type;
	private String deadline;
	private String createdAt;
	
	public static RecruitmentDTO convertToDTO(Recruitment rec) {
		RecruitmentDTO recDTO = new RecruitmentDTO();
		recDTO.setId(rec.getId());
		recDTO.setAddress(rec.getAddress());
		recDTO.setDescription(rec.getDescription());
		recDTO.setExperience(rec.getExperience());
		recDTO.setQuantity(rec.getQuantity());
		recDTO.setRank(rec.getRank());
		recDTO.setSalary(rec.getSalary());
		recDTO.setStatus(rec.isStatus());
		recDTO.setTitle(rec.getTitle());
		recDTO.setType(rec.getType());
		recDTO.setDeadline(rec.getDeadline());
		recDTO.setCreatedAt(rec.getCreatedAt());
		
		return recDTO;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public boolean isStatus() {
		return isStatus;
	}
	public void setStatus(boolean isStatus) {
		this.isStatus = isStatus;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getCategorySelected() {
		return categorySelected;
	}
	public void setCategorySelected(String categorySelected) {
		this.categorySelected = categorySelected;
	}
	private String categorySelected;
//	private Category category;
//    private Company company;
//    private List<ApplyPost> applyPosts;
    
    

}
