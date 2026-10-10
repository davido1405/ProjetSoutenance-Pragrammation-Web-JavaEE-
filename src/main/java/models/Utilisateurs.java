package models;

public class Utilisateurs {
	String nom_user;
	String prenom_user;
	String email_user;
	String contact_user;
	int role_user;
	String adresse_user;
	int user_id;
	
	public Utilisateurs() {
		
	}
	
	public void setNomuser(String nom) {
		this.nom_user=nom;
	}
	
	public void setPrenomuser(String prenom) {
		this.prenom_user=prenom;
	}
	
	public void setEmailuser(String email) {
		this.email_user=email;
	}
	
	public void setContactuser(String contact) {
		this.contact_user=contact;
	}
	
	public void setRoleuser(int role) {
		this.role_user=role;
	}
	public void setAdresseuser(String adresse) {
		this.adresse_user=adresse;
	}
	
	public void setIduser(int userid) {
		this.user_id=userid;
	}
	
	public int getRoleuser() {
		return this.role_user;
	}
	
	public String getNomuser() {
		return this.nom_user;
	}

	public String getPrenomuser() {
		return this.prenom_user;
	}

	public String getEmailuser() {
		return this.email_user;
	}

	public String getContactuser() {
		return this.contact_user;
	}

	public String getAdresseuser() {
		return this.adresse_user;
	}
	public int getUserid() {
		return this.user_id;
	}
}
