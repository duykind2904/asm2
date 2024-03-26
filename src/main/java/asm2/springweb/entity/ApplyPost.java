package asm2.springweb.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="applypost")
//@IdClass(ApplyPostId.class)
public class ApplyPost {

	@EmbeddedId
    private ApplyPostId id;
	
	@Column(name="created_at")
	private String createdAt;
	
	@Column(name="name_cv")
	private String nameCV;
	
	@Column(name="status")
	private boolean status;
	
	@Column(name="text")
	private String text;
	
//	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("recruitmentId")
    @JoinColumn(name = "recruitment_id", insertable = false, updatable = false)
    private Recruitment recruitment;
	
//	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("userId")
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private User user;

	public ApplyPostId getId() {
		return id;
	}

	public void setId(ApplyPostId id) {
		this.id = id;
	}

	public String getCreatedAt() {
		return createdAt;
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

	public Recruitment getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(Recruitment recruitment) {
		this.recruitment = recruitment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
