package asm2.springweb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class FollowCompanyId implements Serializable{
	@Column(name="company_id")
	private int companyId;
	
	@Column(name="user_id")
    private int userId;
	
	public FollowCompanyId() {
		
	}
	
	public FollowCompanyId(int userId, int companyId) {
		this.userId = userId;
		this.companyId = companyId;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	

}
