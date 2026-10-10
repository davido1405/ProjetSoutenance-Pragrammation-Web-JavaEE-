package models;

public class Enseignants extends Utilisateurs {
	public String matricul_ens;
	public int specialite;
	// Champ additionnel pour l'affichage (jointure)
	String specialiteLib;
	int nbEtudiants;

	public Enseignants() {
		super();
	}

	public void setMatriculEns(String matricul_ens) { this.matricul_ens = matricul_ens; }
	public String getMatriculEns() { return this.matricul_ens; }

	public int getSpecialite() { return this.specialite; }
	public void setSpecialite(int specialite) { this.specialite = specialite; }

	public void setSpecialiteLib(String specialiteLib) { this.specialiteLib = specialiteLib; }
	public String getSpecialiteLib() { return this.specialiteLib; }

	public void setNbEtudiants(int nbEtudiants) { this.nbEtudiants = nbEtudiants; }
	public int getNbEtudiants() { return this.nbEtudiants; }
}
