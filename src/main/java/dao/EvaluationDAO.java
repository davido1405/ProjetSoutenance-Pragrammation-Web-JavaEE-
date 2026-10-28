package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnexionBD;
import models.Evaluation;

public class EvaluationDAO {

	//Toutes les évaluations (suivi admin) avec infos soutenance
	public static List<Evaluation> getAll() throws SQLException {
		List<Evaluation> liste = new ArrayList<>();
		String req = "SELECT ev.*, e.nom_etu, e.prenom_etu, e.sujet, en.nom_ens"
		           + " FROM evaluation ev"
		           + " JOIN soutenance s ON s.id_soutenance = ev.id_soutenance"
		           + " LEFT JOIN etudiant e ON s.matricule_etu = e.matricule_etu"
		           + " LEFT JOIN enseignant en ON ev.matricule_ens = en.matricule_ens"
		           + " ORDER BY ev.id_soutenance";

		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			while (rs.next()) {
				Evaluation ev = new Evaluation();
				ev.setIdsoutenance(rs.getInt("id_soutenance"));
				ev.setMatriculens(rs.getString("matricule_ens"));
				ev.setQualitemembre(rs.getString("qualite_membre"));
				ev.setNoteattribuee(rs.getString("note"));
				ev.setAvismembre(rs.getString("avis"));
				ev.setNometu(rs.getString("nom_etu"));
				ev.setPrenometu(rs.getString("prenom_etu"));
				ev.setSujetetu(rs.getString("sujet"));
				ev.setEnseignantnom(rs.getString("nom_ens"));
				liste.add(ev);
			}
		}
		return liste;
	}

	//Jury d'une soutenance donnée
	public static List<Evaluation> getBySoutenance(int idSoutenance) throws SQLException {
		List<Evaluation> liste = new ArrayList<>();
		String req = "SELECT ev.*, en.nom_ens, en.prenom_ens"
		           + " FROM evaluation ev"
		           + " JOIN enseignant en ON ev.matricule_ens = en.matricule_ens"
		           + " WHERE ev.id_soutenance = ?";

		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req)) {
			p.setInt(1, idSoutenance);
			try (ResultSet rs = p.executeQuery()) {
				while (rs.next()) {
					Evaluation ev = new Evaluation();
					ev.setIdsoutenance(rs.getInt("id_soutenance"));
					ev.setMatriculens(rs.getString("matricule_ens"));
					ev.setQualitemembre(rs.getString("qualite_membre"));
					ev.setEnseignantnom(rs.getString("nom_ens") + " " + rs.getString("prenom_ens"));
					liste.add(ev);
				}
			}
		}
		return liste;
	}

	//Saisir / mise à jour de la note et de l'avis d'un membre du jury
	public static boolean saisir(int idSoutenance, String matriculeEns, double note, String avis) throws SQLException {
		String req = "UPDATE evaluation SET note=?, avis=? WHERE id_soutenance=? AND matricule_ens=?";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req)) {
			p.setDouble(1, note);
			p.setString(2, avis);
			p.setInt(3, idSoutenance);
			p.setString(4, matriculeEns);
			return p.executeUpdate() > 0;
		}
	}

	//Note finale = moyenne des notes du jury, sinon null si toutes ne sont pas saisies
	public static Double getNoteFinale(int idSoutenance) throws SQLException {		String reqTotal = "SELECT COUNT(*) AS total, SUM(CASE WHEN note IS NOT NULL THEN 1 ELSE 0 END) AS notees FROM evaluation WHERE id_soutenance=?";
		String reqMoy   = "SELECT AVG(note) FROM evaluation WHERE id_soutenance=?";

		try (Connection connexion = ConnexionBD.getConnection()) {
			int total = 0, notees = 0;
			try (PreparedStatement p = connexion.prepareStatement(reqTotal)) {
				p.setInt(1, idSoutenance);
				try (ResultSet rs = p.executeQuery()) {
					if (rs.next()) { total = rs.getInt("total"); notees = rs.getInt("notees"); }
				}
			}
			if (total > 0 && total == notees) {
				try (PreparedStatement p = connexion.prepareStatement(reqMoy)) {
					p.setInt(1, idSoutenance);
					try (ResultSet rs = p.executeQuery()) {
						if (rs.next()) {
							Double moy = rs.getObject(1) != null ? rs.getDouble(1) : null;
							if (moy != null) {
								Double moyArrondie = Math.round(moy * 100.0) / 100.0;
								// Marquer la soutenance comme évaluée
								try (PreparedStatement u = connexion.prepareStatement("UPDATE soutenance SET statut='EVALUEE' WHERE id_soutenance=?")) {
									u.setInt(1, idSoutenance);
									u.executeUpdate();
								}
								return moyArrondie;
							}
						}
					}
				}
			}
		}
		return null;
	}

	//Moyenne générale de toutes les notes saisies (statistique tableau de bord admin)
	public static Double moyenneGenerale() throws SQLException {
		String req = "SELECT AVG(note) FROM evaluation WHERE note IS NOT NULL";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			if (rs.next() && rs.getObject(1) != null) {
				return Math.round(rs.getDouble(1) * 100.0) / 100.0;
			}
		}
		return null;
	}
}
