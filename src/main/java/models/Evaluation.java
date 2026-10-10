package models;

public class Evaluation {

	public int id_eval;
	public String note_attribuee;
	public String qualite_membre;
	public String avis_membre;
	public int id_soutenance;
	public String matricul_ens;
	// Champs additionnels pour l'affichage (jointures)
	public String nom_etu;
	public String prenom_etu;
	public String sujet_etu;
	public String enseignant_nom;

	public Evaluation() {

	}

	public String getNoteattribuee() { return this.note_attribuee; }
	public void setNoteattribuee(String note) { this.note_attribuee = note; }

	public String getQualitemembre() { return this.qualite_membre; }
	public void setQualitemembre(String q) { this.qualite_membre = q; }

	public String getAvismembre() { return this.avis_membre; }
	public void setAvismembre(String a) { this.avis_membre = a; }

	public int getIdsoutenance() { return this.id_soutenance; }
	public void setIdsoutenance(int id) { this.id_soutenance = id; }

	public String getMatriculens() { return this.matricul_ens; }
	public void setMatriculens(String m) { this.matricul_ens = m; }

	public String getNometu() { return this.nom_etu; }
	public void setNometu(String n) { this.nom_etu = n; }
	public String getPrenometu() { return this.prenom_etu; }
	public void setPrenometu(String p) { this.prenom_etu = p; }
	public String getSujetetu() { return this.sujet_etu; }
	public void setSujetetu(String s) { this.sujet_etu = s; }
	public String getEnseignantnom() { return this.enseignant_nom; }
	public void setEnseignantnom(String e) { this.enseignant_nom = e; }
}
