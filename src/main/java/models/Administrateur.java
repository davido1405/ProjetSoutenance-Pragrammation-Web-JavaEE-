package models;

public class Administrateur extends  Utilisateurs{
	private String code_admin;
	
	public Administrateur() {
		super();
	}
	
	public void setCodeadmin(String code_admin) {
		this.code_admin=code_admin;
	}

}
