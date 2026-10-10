package models;

public class Etudiants extends Utilisateurs {

	String matricule;
	int filiere;
	int niveau;
	String matricule_enca;
	// Champs additionnels pour l'affichage (jointures)
	String filiereLib;
	String niveauLib;
	String encadrantNom;
	String sujet;
	String statutSoutenance;

	public Etudiants() {
		super();
	}

	public void setMatriculEtu(String matricule) { this.matricule = matricule; }
	public void setfiliere(int filiere) { this.filiere = filiere; }
	public void setNiveau(int niveau) { this.niveau = niveau; }
	public void setMatriculeenca(String matricule_enca) { this.matricule_enca = matricule_enca; }
	public void setFiliereLib(String filiereLib) { this.filiereLib = filiereLib; }
	public void setNiveauLib(String niveauLib) { this.niveauLib = niveauLib; }
	public void setEncadrantNom(String encadrantNom) { this.encadrantNom = encadrantNom; }
	public void setSujet(String sujet) { this.sujet = sujet; }
	public void setStatutSoutenance(String statutSoutenance) { this.statutSoutenance = statutSoutenance; }

	public String getMatriculEtu() { return this.matricule; }
	public String getMatriculeenca() { return this.matricule_enca; }
	public int getNiveau() { return this.niveau; }
	public int getFiliere() { return this.filiere; }
	public String getFiliereLib() { return this.filiereLib; }
	public String getNiveauLib() { return this.niveauLib; }
	public String getEncadrantNom() { return this.encadrantNom; }
	public String getSujet() { return this.sujet; }
	public String getStatutSoutenance() { return this.statutSoutenance; }
}
