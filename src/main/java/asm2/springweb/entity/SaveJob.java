package asm2.springweb.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="save_job")
public class SaveJob {
	@EmbeddedId
	private SaveJobId id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("recId")
    @JoinColumn(name = "recuitment_id", insertable = false, updatable = false)
    private Recruitment recruitment;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("userId")
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private User user;

	public SaveJob() {
	}

	public SaveJob(User user, Recruitment recruitment) {
		this.id = new SaveJobId(user.getId(), recruitment.getId());
		this.recruitment = recruitment;
		this.user = user;
	}

	public SaveJobId getId() {
		return id;
	}

	public void setId(SaveJobId id) {
		this.id = id;
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
