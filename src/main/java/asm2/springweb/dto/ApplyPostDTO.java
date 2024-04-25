package asm2.springweb.dto;

import asm2.springweb.entity.ApplyPost;
import asm2.springweb.entity.Recruitment;
import asm2.springweb.entity.User;

public class ApplyPostDTO {
	
	private String createdAt;
	private String nameCV;
	private Boolean status;
	private String text;
	private int recruitmentId;
    private int userId;
    private User user;
    private Recruitment recruitment;
    
    
	public String getCreatedAt() {
		return createdAt;
	}
	
	public static ApplyPostDTO setToDTO(ApplyPost app) {
		ApplyPostDTO appDTO = new ApplyPostDTO();
		if(app.getCreatedAt() != null) appDTO.setCreatedAt(app.getCreatedAt());
		if(app.getNameCV() != null) appDTO.setNameCV(app.getNameCV());
		if(app.isStatus() != null)  appDTO.setStatus(app.isStatus());
		if(app.getText() != null) appDTO.setText(app.getText());
		if(app.getId() != null) appDTO.setRecruitmentId(app.getId().getRecruitmentId());
		if(app.getId() != null) appDTO.setUserId(app.getId().getUserId());
		
		return appDTO;
	}
	
	public static ApplyPost setToEntity(ApplyPostDTO aPDTO) {
		ApplyPost aP = new ApplyPost();
		if(aPDTO.getUser() != null) aP.setUser(aPDTO.getUser());
		if(aPDTO.getRecruitment() != null) aP.setRecruitment(aPDTO.getRecruitment());
		if(aPDTO.getNameCV() != null ) aP.setNameCV(aPDTO.getNameCV());
		if(aPDTO.getText() != null) aP.setText(aPDTO.getText());
		if(aPDTO.isStatus() != null) aP.setStatus(aPDTO.isStatus());		
		aP.setId(aP.getUser().getId(), aP.getRecruitment().getId());
		
		return aP;
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
	public Boolean isStatus() {
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Recruitment getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}
    
    

}
