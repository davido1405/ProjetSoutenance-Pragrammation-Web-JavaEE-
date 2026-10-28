package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnexionBD;
import models.Soutenance;

public class SoutenanceDAO {

	public static int nbSoutenances() throws SQLException {
		String req = "SELECT COUNT(*) FROM soutenance";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			if (rs.next()) return rs.getInt(1);
		}
		return 0;
	}

	public static int nbSoutenancesEvaluees() throws SQLException {
		String req = "SELECT COUNT(*) FROM soutenance WHERE statut='EVALUEE'";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			if (rs.next()) return rs.getInt(1);
		}
		return 0;
	}

	//Soutenances planifiées dans les 7 prochains jours (hors annulées)
	public static int nbSoutenancesSemaine() throws SQLException {
		String req = "SELECT COUNT(*) FROM soutenance "
		           + "WHERE statut <> 'ANNULEE' AND date_heure_soutenance BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY)";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			if (rs.next()) return rs.getInt(1);
		}
		return 0;
	}

	//Toutes les soutenances avec infos étudiant
	public static List<Soutenance> getAll() throws SQLException {
		List<Soutenance> liste = new ArrayList<>();
		String req = "SELECT s.*, e.nom_etu, e.prenom_etu, e.sujet, f.lib_filiere"
		           + " FROM soutenance s"
		           + " LEFT JOIN etudiant e ON s.matricule_etu = e.matricule_etu"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " ORDER BY s.date_heure_soutenance";

		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			while (rs.next()) {
				liste.add(mapper(rs));
			}
		}
		return liste;
	}

	//Soutenance d'un étudiant donné
	public static Soutenance getByEtudiant(String matriculeEtu) throws SQLException {
		String req = "SELECT s.*, e.nom_etu, e.prenom_etu, e.sujet, f.lib_filiere"
		           + " FROM soutenance s"
		           + " LEFT JOIN etudiant e ON s.matricule_etu = e.matricule_etu"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " WHERE s.matricule_etu = ?";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req)) {
			p.setString(1, matriculeEtu);
			try (ResultSet rs = p.executeQuery()) {
				if (rs.next()) return mapper(rs);
			}
		}
		return null;
	}

	//Soutenances où un enseignant est membre du jury (via evaluation), avec note et qualité
	public static List<Soutenance> getByEnseignant(String matriculeEns) throws SQLException {
		List<Soutenance> liste = new ArrayList<>();
		String req = "SELECT s.*, e.nom_etu, e.prenom_etu, e.sujet, f.lib_filiere, ev.qualite_membre, ev.note, ev.avis,"
		           + " (SELECT COUNT(*) FROM evaluation ev2 WHERE ev2.id_soutenance = s.id_soutenance AND ev2.note IS NOT NULL) AS nb_saisies,"
		           + " (SELECT COUNT(*) FROM evaluation ev3 WHERE ev3.id_soutenance = s.id_soutenance) AS nb_jury,"
		           + " (SELECT AVG(ev4.note) FROM evaluation ev4 WHERE ev4.id_soutenance = s.id_soutenance) AS moyenne"
		           + " FROM soutenance s"
		           + " JOIN evaluation ev ON ev.id_soutenance = s.id_soutenance"
		           + " LEFT JOIN etudiant e ON s.matricule_etu = e.matricule_etu"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " WHERE ev.matricule_ens = ?"
		           + " ORDER BY s.date_heure_soutenance";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req)) {
			p.setString(1, matriculeEns);
			try (ResultSet rs = p.executeQuery()) {
				while (rs.next()) {
					Soutenance s = mapper(rs);
					s.setQualitemembre(rs.getString("qualite_membre"));
					Double note = rs.getObject("note") != null ? rs.getDouble("note") : null;
					s.setNote(note);
				s.setAvismembre(rs.getString("avis"));
					int saisies = rs.getInt("nb_saisies");
					int totalJury = rs.getInt("nb_jury");
					s.setProgression(saisies + " / " + totalJury);
					if (totalJury > 0 && saisies == totalJury && rs.getObject("moyenne") != null) {
						double moy = rs.getDouble("moyenne");
						s.setNoteFinaleJury(Math.round(moy * 100.0) / 100.0);
					}
					liste.add(s);
				}
			}
		}
		return liste;
	}

	//Créer une soutenance et composer son jury (lignes 'evaluation' avec note NULL)
	public static boolean creer(Soutenance s, String[] jury, String[] qualites) throws SQLException {
		String reqSout = "INSERT INTO soutenance (date_heure_soutenance, salle, statut, matricule_etu) VALUES (?,?,?,?)";
		String reqEval = "INSERT INTO evaluation (id_soutenance, matricule_ens, qualite_membre) VALUES (?,?,?)";

		try (Connection connexion = ConnexionBD.getConnection()) {
			connexion.setAutoCommit(false);
			int idSout = -1;
			try (PreparedStatement p1 = connexion.prepareStatement(reqSout, PreparedStatement.RETURN_GENERATED_KEYS)) {
				p1.setTimestamp(1, s.getDatesoutenance());
				p1.setString(2, s.getSallesoutenance());
				p1.setString(3, "PLANIFIEE");
				p1.setString(4, s.getMatriculeetu());
				p1.executeUpdate();
				try (ResultSet keys = p1.getGeneratedKeys()) {
					if (keys.next()) idSout = keys.getInt(1);
				}
			}
			if (idSout > 0 && jury != null) {
				try (PreparedStatement p2 = connexion.prepareStatement(reqEval)) {
					for (int i = 0; i < jury.length; i++) {
						if (jury[i] == null || jury[i].isEmpty()) continue;
						p2.setInt(1, idSout);
						p2.setString(2, jury[i]);
						p2.setString(3, qualites != null && i < qualites.length ? qualites[i] : "Examinateur");
						p2.addBatch();
					}
					p2.executeBatch();
				}
			}
			connexion.commit();
			return true;
		}
	}

	public static boolean modifier(Soutenance s) throws SQLException {
		String req = "UPDATE soutenance SET date_heure_soutenance=?, salle=?, statut=? WHERE id_soutenance=?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setTimestamp(1, s.getDatesoutenance());
			p.setString(2, s.getSallesoutenance());
			p.setString(3, s.getStatutsoutenance());
			p.setInt(4, s.getIdsoutenance());
			return p.executeUpdate() > 0;
		}
	}

	public static boolean annuler(int id) throws SQLException {
		String req = "UPDATE soutenance SET statut='ANNULEE' WHERE id_soutenance=?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setInt(1, id);
			return p.executeUpdate() > 0;
		}
	}

	public static Soutenance getById(int id) throws SQLException {
		String req = "SELECT s.*, e.nom_etu, e.prenom_etu, e.sujet, f.lib_filiere"
		           + " FROM soutenance s"
		           + " LEFT JOIN etudiant e ON s.matricule_etu = e.matricule_etu"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " WHERE s.id_soutenance = ?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setInt(1, id);
			try (ResultSet rs = p.executeQuery()) {
				if (rs.next()) return mapper(rs);
			}
		}
		return null;
	}

	private static Soutenance mapper(ResultSet rs) throws SQLException {
		Soutenance s = new Soutenance();
		s.setIdsoutenance(rs.getInt("id_soutenance"));
		s.setDatesoutenance(rs.getTimestamp("date_heure_soutenance"));
		s.setSallesoutenance(rs.getString("salle"));
		s.setStatutsoutenance(rs.getString("statut"));
		s.setMatriculeetu(rs.getString("matricule_etu"));
		s.setNometu(rs.getString("nom_etu"));
		s.setPrenometu(rs.getString("prenom_etu"));
		s.setSujetetu(rs.getString("sujet"));
		s.setFilierelib(rs.getString("lib_filiere"));
		return s;
	}
}
