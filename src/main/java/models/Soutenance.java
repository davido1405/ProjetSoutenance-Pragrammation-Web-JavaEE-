package models;

import java.sql.Timestamp;

public class Soutenance {

	public int id_soutenance;
	public Timestamp date_soutenance;
	public String salle_soutenance;
	public String statut_soutenance;
	public String matricule_etu;
	// Champs additionnels pour l'affichage (jointures)
	public String nom_etu;
	public String prenom_etu;
	public String filiere_lib;
	public String sujet_etu;
	public String qualite_membre;
	public Double note;
	public String avis_membre;

	public Soutenance() {

	}

	public int getIdsoutenance() { return this.id_soutenance; }
	public void setIdsoutenance(int id_soutenance) { this.id_soutenance = id_soutenance; }

	public String getSallesoutenance() { return this.salle_soutenance; }
	public void setSallesoutenance(String salle) { this.salle_soutenance = salle; }

	public String getStatutsoutenance() { return this.statut_soutenance; }
	public void setStatutsoutenance(String statut) { this.statut_soutenance = statut; }

	public Timestamp getDatesoutenance() { return this.date_soutenance; }
	public void setDatesoutenance(Timestamp date) { this.date_soutenance = date; }

	// Accesseurs dérivés pour l'affichage
	public String getJourSoutenance() {
		if (this.date_soutenance == null) return "";
		return new java.text.SimpleDateFormat("dd/MM/yyyy").format(this.date_soutenance);
	}
	public String getHeureSoutenance() {
		if (this.date_soutenance == null) return "";
		return new java.text.SimpleDateFormat("HH:mm").format(this.date_soutenance);
	}
	public String getLibelleDateHeure() {
		if (this.date_soutenance == null) return "";
		return new java.text.SimpleDateFormat("dd/MM/yyyy 'à' HH:mm").format(this.date_soutenance);
	}
	// Format attendu par <input type="datetime-local">
	public String getDateTimeLocal() {
		if (this.date_soutenance == null) return "";
		return new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(this.date_soutenance);
	}

	public String getMatriculeetu() { return this.matricule_etu; }
	public void setMatriculeetu(String m) { this.matricule_etu = m; }

	public String getNometu() { return this.nom_etu; }
	public void setNometu(String n) { this.nom_etu = n; }
	public String getPrenometu() { return this.prenom_etu; }
	public void setPrenometu(String p) { this.prenom_etu = p; }
	public String getFilierelib() { return this.filiere_lib; }
	public void setFilierelib(String f) { this.filiere_lib = f; }
	public String getSujetetu() { return this.sujet_etu; }
	public void setSujetetu(String s) { this.sujet_etu = s; }
	public String getQualitemembre() { return this.qualite_membre; }
	public void setQualitemembre(String q) { this.qualite_membre = q; }
	public Double getNote() { return this.note; }
	public void setNote(Double note) { this.note = note; }
	public String getAvismembre() { return this.avis_membre; }
	public void setAvismembre(String avis_membre) { this.avis_membre = avis_membre; }
	// Progression du jury et note finale (affichage des convocations enseignant)
	public String progression;
	public Double noteFinaleJury;

	public String getProgression() { return this.progression; }
	public void setProgression(String p) { this.progression = p; }
	public Double getNoteFinaleJury() { return this.noteFinaleJury; }
	public void setNoteFinaleJury(Double n) { this.noteFinaleJury = n; }
}
