package asm2.springweb.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="follow_company")
public class FollowCompany {
	@EmbeddedId
	private FollowCompanyId id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("companyId")
    @JoinColumn(name = "company_id", insertable = false, updatable = false)
    private Company company;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("userId")
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private User user;
	
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@Column(name="id")
//	private int idMain;	
	
	public FollowCompany() {
		
	}
	
	public FollowCompany(User user, Company company) {
		this.user = user;
		this.company = company;
		this.id = new FollowCompanyId(user.getId(), company.getId());
	}
	

//	public int getIdMain() {
//		return idMain;
//	}
//
//	public void setIdMain(int idMain) {
//		this.idMain = idMain;
//	}

	public FollowCompanyId getId() {
		return id;
	}

	public void setId(FollowCompanyId id) {
		this.id = id;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
