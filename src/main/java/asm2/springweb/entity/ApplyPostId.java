package asm2.springweb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ApplyPostId implements Serializable {
	
	@Column(name="recruitment_id")
	private int recruitmentId;
	
	@Column(name="user_id")
    private int userId;
    
    public ApplyPostId() {
    	
    }
    
	public ApplyPostId(int recruitmentId, int userId) {
		this.recruitmentId = recruitmentId;
		this.userId = userId;
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
