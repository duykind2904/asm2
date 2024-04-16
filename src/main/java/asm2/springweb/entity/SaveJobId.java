package asm2.springweb.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SaveJobId implements Serializable{
	@Column(name="recuitment_id")
	private int recId;
	
	@Column(name="user_id")
    private int userId;

	public SaveJobId() {
	}

	public SaveJobId(int userId, int recId) {
		this.recId = recId;
		this.userId = userId;
	}

	public int getRecId() {
		return recId;
	}

	public void setRecId(int recId) {
		this.recId = recId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	

}
