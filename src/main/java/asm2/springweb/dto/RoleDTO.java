package asm2.springweb.dto;

import asm2.springweb.entity.Role;

public class RoleDTO {
	
	private int id;	
	private String roleName;

	public int getId() {
		return id;
	}
	
	public static RoleDTO convertToDTO(Role role) {
		RoleDTO roleDTO = new RoleDTO();
		roleDTO.setId(role.getId());
		roleDTO.setRoleName(role.getRoleName());
		return roleDTO;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
}
