package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnexionBD;
import models.Enseignants;

public class EnseignantsDAO {

	public static int nbEnseignants() throws SQLException {
		String req = "SELECT COUNT(*) FROM enseignant";
		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {
			if (rs.next()) return rs.getInt(1);
		}
		return 0;
	}

	public static List<Enseignants> getAll() throws SQLException {
		List<Enseignants> liste = new ArrayList<>();
		String req = "SELECT en.*, s.lib_specialite,"
		           + " (SELECT COUNT(*) FROM etudiant e WHERE e.matricule_ens_encadrant = en.matricule_ens) AS nb_etudiants"
		           + " FROM enseignant en"
		           + " LEFT JOIN specialite s ON en.id_specialite = s.id_specialite"
		           + " ORDER BY en.nom_ens, en.prenom_ens";

		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement p = connexion.prepareStatement(req);
		     ResultSet rs = p.executeQuery()) {

			while (rs.next()) {
				Enseignants ens = new Enseignants();
				ens.setMatriculEns(rs.getString("matricule_ens"));
				ens.setNomuser(rs.getString("nom_ens"));
				ens.setPrenomuser(rs.getString("prenom_ens"));
				ens.setEmailuser(rs.getString("email_ens"));
				ens.setContactuser(rs.getString("contact_ens"));
				ens.setAdresseuser(rs.getString("adresse_ens"));
				ens.setSpecialite(rs.getInt("id_specialite"));
				ens.setSpecialiteLib(rs.getString("lib_specialite"));
				ens.setNbEtudiants(rs.getInt("nb_etudiants"));
				liste.add(ens);
			}
		}
		return liste;
	}

	public static boolean modifier(Enseignants ens) throws SQLException {
		String req = "UPDATE enseignant SET nom_ens=?, prenom_ens=?, email_ens=?, contact_ens=?, adresse_ens=?, id_specialite=? WHERE matricule_ens=?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setString(1, ens.getNomuser());
			p.setString(2, ens.getPrenomuser());
			p.setString(3, ens.getEmailuser());
			p.setString(4, ens.getContactuser());
			p.setString(5, ens.getAdresseuser());
			p.setInt(6, ens.getSpecialite());
			p.setString(7, ens.getMatriculEns());
			return p.executeUpdate() > 0;
		}
	}

	public static boolean supprimer(String matricule) throws SQLException {
		String req = "DELETE FROM enseignant WHERE matricule_ens=?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setString(1, matricule);
			return p.executeUpdate() > 0;
		}
	}

	public static java.util.List<String[]> getSpecialites() throws SQLException {
		java.util.List<String[]> liste = new java.util.ArrayList<>();
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement("SELECT id_specialite, lib_specialite FROM specialite ORDER BY lib_specialite");
		     ResultSet rs = p.executeQuery()) {
			while (rs.next()) liste.add(new String[]{rs.getString(1), rs.getString(2)});
		}
		return liste;
	}

	public static boolean ajouter(Enseignants ens) throws SQLException {
		String reqUser = "INSERT INTO utilisateur (login, mdp, id_role) VALUES (?, ?, 2)";
		String reqEns  = "INSERT INTO enseignant (matricule_ens, nom_ens, prenom_ens, email_ens, contact_ens, adresse_ens, id_specialite, id_utilisateur) VALUES (?,?,?,?,?,?,?,?)";

		try (Connection connexion = ConnexionBD.getConnection()) {
			connexion.setAutoCommit(false);
			try (PreparedStatement p1 = connexion.prepareStatement(reqUser, PreparedStatement.RETURN_GENERATED_KEYS)) {
				p1.setString(1, ens.getMatriculEns().toLowerCase());
				p1.setString(2, utils.HashUtils.hasherSHA256("123456"));
				p1.executeUpdate();
				ResultSet keys = p1.getGeneratedKeys();
				if (keys.next()) ens.setIduser(keys.getInt(1));
			}
			try (PreparedStatement p2 = connexion.prepareStatement(reqEns)) {
				p2.setString(1, ens.getMatriculEns());
				p2.setString(2, ens.getNomuser());
				p2.setString(3, ens.getPrenomuser());
				p2.setString(4, ens.getEmailuser());
				p2.setString(5, ens.getContactuser());
				p2.setString(6, ens.getAdresseuser());
				p2.setInt(7, ens.getSpecialite());
				p2.setInt(8, ens.getUserid());
				p2.executeUpdate();
			}
			connexion.commit();
			return true;
		}
	}
}
