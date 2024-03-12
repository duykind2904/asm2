package asm2.springweb.model;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonSetter;

import asm2.springweb.entity.Company;
import asm2.springweb.entity.User;

public class InfoProfile {
	private User user;
	private Company company;
	private MultipartFile imageUserFile;
	private MultipartFile pdfFile;
	private MultipartFile logoCompanyFile;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public MultipartFile getImageUserFile() {
		return imageUserFile;
	}
	@JsonSetter
	public void setImageUserFile(MultipartFile imageUserFile) {
		this.imageUserFile = imageUserFile;
	}
	public MultipartFile getPdfFile() {
		return pdfFile;
	}
	@JsonSetter
	public void setPdfFile(MultipartFile pdfFile) {
		this.pdfFile = pdfFile;
	}
	public MultipartFile getLogoCompanyFile() {
		return logoCompanyFile;
	}
	@JsonSetter
	public void setLogoCompanyFile(MultipartFile logoFile) {
		this.logoCompanyFile = logoFile;
	}
	
	
}
