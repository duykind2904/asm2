package asm2.springweb.dto;

import javax.persistence.Column;

import asm2.springweb.entity.ApplyPost;
import asm2.springweb.entity.Recruitment;

public class ApplyPostDTO {
	
	private String createdAt;
	private String nameCV;
	private boolean status;
	private String text;
	private int recruitmentId;
    private int userId;
	public String getCreatedAt() {
		return createdAt;
	}
	
	public static ApplyPostDTO setToDTO(ApplyPost app) {
		ApplyPostDTO appDTO = new ApplyPostDTO();
		appDTO.setCreatedAt(app.getCreatedAt());
		appDTO.setNameCV(app.getNameCV());
		appDTO.setStatus(app.isStatus());
		appDTO.setText(app.getText());
		appDTO.setRecruitmentId(app.getId().getRecruitmentId());
		appDTO.setUserId(app.getId().getUserId());
		
		return appDTO;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getNameCV() {
		return nameCV;
	}
	public void setNameCV(String nameCV) {
		this.nameCV = nameCV;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getRecruitmentId() {
		return recruitmentId;
	}
	public void setRecruitmentId(int recruitmentId) {
		this.recruitmentId = recruitmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
    
    

}
