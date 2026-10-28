package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnexionBD;
import models.Etudiants;

public class EtudiantsDAO {


	//Compter le nombre d'étudiants inscrits
	public static int nbEtudiantInscrit() throws SQLException {

		int nombreEtudiantsInscrit=0;
		String req="SELECT COUNT(*) FROM etudiant";

		try(Connection connexion=ConnexionBD.getConnection();){
			PreparedStatement reqPrepare=connexion.prepareStatement(req);
			ResultSet rs=reqPrepare.executeQuery();

			if(rs.next()) {
				nombreEtudiantsInscrit=rs.getInt(1);
			}
		}

		return nombreEtudiantsInscrit;
	}

	//Récupérer la liste de tous les étudiants
	public static List<Etudiants> getAll() throws SQLException {
		List<Etudiants> liste = new ArrayList<>();
		String req = "SELECT e.*, f.lib_filiere, n.lib_niveau,"
		           + " CONCAT(en.nom_ens, ' ', en.prenom_ens) AS encadrant_nom,"
		           + " s.statut AS statut_soutenance"
		           + " FROM etudiant e"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " LEFT JOIN niveau n ON e.id_niveau = n.id_niveau"
		           + " LEFT JOIN enseignant en ON e.matricule_ens_encadrant = en.matricule_ens"
		           + " LEFT JOIN soutenance s ON s.matricule_etu = e.matricule_etu"
		           + " ORDER BY e.nom_etu, e.prenom_etu";

		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement reqPrepare = connexion.prepareStatement(req);
		     ResultSet rs = reqPrepare.executeQuery()) {

			while (rs.next()) {
				Etudiants etu = new Etudiants();
				etu.setMatriculEtu(rs.getString("matricule_etu"));
				etu.setNomuser(rs.getString("nom_etu"));
				etu.setPrenomuser(rs.getString("prenom_etu"));
				etu.setEmailuser(rs.getString("email_etu"));
				etu.setContactuser(rs.getString("contact_etu"));
				etu.setAdresseuser(rs.getString("adresse_etu"));
				etu.setfiliere(rs.getInt("id_filiere"));
				etu.setNiveau(rs.getInt("id_niveau"));
				etu.setMatriculeenca(rs.getString("matricule_ens_encadrant"));
				etu.setFiliereLib(rs.getString("lib_filiere"));
				etu.setNiveauLib(rs.getString("lib_niveau"));
				etu.setEncadrantNom(rs.getString("encadrant_nom"));
				etu.setSujet(rs.getString("sujet"));
				etu.setStatutSoutenance(rs.getString("statut_soutenance"));
				liste.add(etu);
			}
		}
		return liste;
	}

	//Récupérer un étudiant par matricule (avec noms de filière/niveau/encadreur)
	public static Etudiants getByMatricule(String matricule) throws SQLException {
		String req = "SELECT e.*, f.lib_filiere, n.lib_niveau,"
		           + " CONCAT(en.nom_ens, ' ', en.prenom_ens) AS encadrant_nom,"
		           + " s.statut AS statut_soutenance"
		           + " FROM etudiant e"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " LEFT JOIN niveau n ON e.id_niveau = n.id_niveau"
		           + " LEFT JOIN enseignant en ON e.matricule_ens_encadrant = en.matricule_ens"
		           + " LEFT JOIN soutenance s ON s.matricule_etu = e.matricule_etu"
		           + " WHERE e.matricule_etu = ?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setString(1, matricule);
			try (ResultSet rs = p.executeQuery()) {
				if (rs.next()) {
					Etudiants etu = new Etudiants();
					etu.setMatriculEtu(rs.getString("matricule_etu"));
					etu.setNomuser(rs.getString("nom_etu"));
					etu.setPrenomuser(rs.getString("prenom_etu"));
					etu.setEmailuser(rs.getString("email_etu"));
					etu.setContactuser(rs.getString("contact_etu"));
					etu.setAdresseuser(rs.getString("adresse_etu"));
					etu.setfiliere(rs.getInt("id_filiere"));
					etu.setNiveau(rs.getInt("id_niveau"));
					etu.setMatriculeenca(rs.getString("matricule_ens_encadrant"));
					etu.setFiliereLib(rs.getString("lib_filiere"));
					etu.setNiveauLib(rs.getString("lib_niveau"));
					etu.setEncadrantNom(rs.getString("encadrant_nom"));
					etu.setSujet(rs.getString("sujet"));
					etu.setStatutSoutenance(rs.getString("statut_soutenance"));
					return etu;
				}
			}
		}
		return null;
	}

	public static boolean modifier(Etudiants etu) throws SQLException {
		String req = "UPDATE etudiant SET nom_etu=?, prenom_etu=?, email_etu=?, contact_etu=?, adresse_etu=?, id_filiere=?, id_niveau=?, matricule_ens_encadrant=?, sujet=? WHERE matricule_etu=?";
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement(req)) {
			p.setString(1, etu.getNomuser());
			p.setString(2, etu.getPrenomuser());
			p.setString(3, etu.getEmailuser());
			p.setString(4, etu.getContactuser());
			p.setString(5, etu.getAdresseuser());
			p.setInt(6, etu.getFiliere());
			p.setInt(7, etu.getNiveau());
			p.setString(8, (etu.getMatriculeenca() == null || etu.getMatriculeenca().isEmpty()) ? null : etu.getMatriculeenca());
			p.setString(9, etu.getSujet());
			p.setString(10, etu.getMatriculEtu());
			return p.executeUpdate() > 0;
		}
	}

	/**
	 * Supprime un étudiant en respectant l'ordre des contraintes de clés étrangères :
	 * évaluations -> soutenance -> étudiant -> compte utilisateur.
	 * Le tout dans une seule transaction (rollback en cas d'erreur).
	 */
	public static boolean supprimer(String matricule) throws SQLException {
		
		// EtudiantsDAO.supprimer(), première ligne
		System.out.println("[SUPPR] " + matricule);
		
		
		try (Connection c = ConnexionBD.getConnection()) {
			c.setAutoCommit(false);
			try {
				// Récupérer le compte utilisateur lié avant toute suppression
				Integer idUtilisateur = null;
				try (PreparedStatement p = c.prepareStatement("SELECT id_utilisateur FROM etudiant WHERE matricule_etu=?")) {
					p.setString(1, matricule);
					try (ResultSet rs = p.executeQuery()) {
						if (rs.next()) {
							int id = rs.getInt("id_utilisateur");
							if (!rs.wasNull()) idUtilisateur = id;
						} else {
							c.rollback();
							return false;
						}
					}
				}

				// 1) Évaluations liées aux soutenances de l'étudiant
				try (PreparedStatement p = c.prepareStatement(
						"DELETE FROM evaluation WHERE id_soutenance IN"
						+ " (SELECT id_soutenance FROM soutenance WHERE matricule_etu=?)")) {
					p.setString(1, matricule);
					p.executeUpdate();
				}

				// 2) Soutenance(s) de l'étudiant
				try (PreparedStatement p = c.prepareStatement("DELETE FROM soutenance WHERE matricule_etu=?")) {
					p.setString(1, matricule);
					p.executeUpdate();
				}

				// 3) Étudiant
				try (PreparedStatement p = c.prepareStatement("DELETE FROM etudiant WHERE matricule_etu=?")) {
					p.setString(1, matricule);
					p.executeUpdate();
				}

				// 4) Compte utilisateur associé (plus aucune référence à présent)
				if (idUtilisateur != null) {
					try (PreparedStatement p = c.prepareStatement("DELETE FROM utilisateur WHERE id_utilisateur=?")) {
						p.setInt(1, idUtilisateur);
						p.executeUpdate();
					}
				}

				c.commit();
				return true;
			} catch (SQLException e) {
				c.rollback();
				throw e;
			}finally {
                c.setAutoCommit(true);
            }
		}
	}

	//Lister les filières (pour les formulaires)
	public static java.util.List<String[]> getFilieres() throws SQLException {
		java.util.List<String[]> liste = new java.util.ArrayList<>();
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement("SELECT id_filiere, lib_filiere FROM filiere ORDER BY lib_filiere");
		     ResultSet rs = p.executeQuery()) {
			while (rs.next()) liste.add(new String[]{rs.getString(1), rs.getString(2)});
		}
		return liste;
	}

	//Lister les niveaux (pour les formulaires)
	public static java.util.List<String[]> getNiveaux() throws SQLException {
		java.util.List<String[]> liste = new java.util.ArrayList<>();
		try (Connection c = ConnexionBD.getConnection();
		     PreparedStatement p = c.prepareStatement("SELECT id_niveau, lib_niveau FROM niveau ORDER BY lib_niveau");
		     ResultSet rs = p.executeQuery()) {
			while (rs.next()) liste.add(new String[]{rs.getString(1), rs.getString(2)});
		}
		return liste;
	}

	//Rechercher un étudiant par nom, prénom ou matricule
	public static List<Etudiants> rechercher(String motCle) throws SQLException {
		List<Etudiants> liste = new ArrayList<>();
		String req = "SELECT e.*, f.lib_filiere, n.lib_niveau,"
		           + " CONCAT(en.nom_ens, ' ', en.prenom_ens) AS encadrant_nom,"
		           + " s.statut AS statut_soutenance"
		           + " FROM etudiant e"
		           + " LEFT JOIN filiere f ON e.id_filiere = f.id_filiere"
		           + " LEFT JOIN niveau n ON e.id_niveau = n.id_niveau"
		           + " LEFT JOIN enseignant en ON e.matricule_ens_encadrant = en.matricule_ens"
		           + " LEFT JOIN soutenance s ON s.matricule_etu = e.matricule_etu"
		           + " WHERE e.nom_etu LIKE ? OR e.prenom_etu LIKE ? OR e.matricule_etu LIKE ?";

		try (Connection connexion = ConnexionBD.getConnection();
		     PreparedStatement reqPrepare = connexion.prepareStatement(req)) {

			String pattern = "%" + motCle + "%";
			reqPrepare.setString(1, pattern);
			reqPrepare.setString(2, pattern);
			reqPrepare.setString(3, pattern);

			try (ResultSet rs = reqPrepare.executeQuery()) {
				while (rs.next()) {
					Etudiants etu = new Etudiants();
					etu.setMatriculEtu(rs.getString("matricule_etu"));
					etu.setNomuser(rs.getString("nom_etu"));
					etu.setPrenomuser(rs.getString("prenom_etu"));
					etu.setEmailuser(rs.getString("email_etu"));
					etu.setContactuser(rs.getString("contact_etu"));
					etu.setAdresseuser(rs.getString("adresse_etu"));
					etu.setfiliere(rs.getInt("id_filiere"));
					etu.setNiveau(rs.getInt("id_niveau"));
					etu.setMatriculeenca(rs.getString("matricule_ens_encadrant"));
					etu.setFiliereLib(rs.getString("lib_filiere"));
					etu.setNiveauLib(rs.getString("lib_niveau"));
					etu.setEncadrantNom(rs.getString("encadrant_nom"));
					etu.setSujet(rs.getString("sujet"));
					etu.setStatutSoutenance(rs.getString("statut_soutenance"));
					liste.add(etu);
				}
			}
		}
		return liste;
	}

	//Ajouter un étudiant (avec son compte utilisateur)
	public static boolean ajouter(Etudiants etu) throws SQLException {
		

		// EtudiantsDAO.ajouter(), première ligne
		System.out.println("[AJOUT] " + etu.getMatriculEtu());
		
		
	    String reqUser = "INSERT INTO utilisateur (login, mdp, id_role) VALUES (?, ?, 3)";
	    String reqEtu  = "INSERT INTO etudiant (matricule_etu, nom_etu, prenom_etu, email_etu, contact_etu, adresse_etu, id_utilisateur, id_filiere, id_niveau, matricule_ens_encadrant, sujet) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

	    try (Connection connexion = ConnexionBD.getConnection()) {
	        connexion.setAutoCommit(false);
	        try {
	            try (PreparedStatement p1 = connexion.prepareStatement(reqUser, PreparedStatement.RETURN_GENERATED_KEYS)) {
	                p1.setString(1, etu.getMatriculEtu().toLowerCase());
	                p1.setString(2, utils.HashUtils.hasherSHA256("123456"));
	                p1.executeUpdate();
	                try (ResultSet keys = p1.getGeneratedKeys()) {
	                    if (keys.next()) etu.setIduser(keys.getInt(1));
	                }
	            }
	            try (PreparedStatement p2 = connexion.prepareStatement(reqEtu)) {
	                p2.setString(1, etu.getMatriculEtu());
	                p2.setString(2, etu.getNomuser());
	                p2.setString(3, etu.getPrenomuser());
	                p2.setString(4, etu.getEmailuser());
	                p2.setString(5, etu.getContactuser());
	                p2.setString(6, etu.getAdresseuser());
	                p2.setInt(7, etu.getUserid());
	                p2.setInt(8, etu.getFiliere());
	                p2.setInt(9, etu.getNiveau());
	                p2.setString(10, (etu.getMatriculeenca() == null || etu.getMatriculeenca().isEmpty()) ? null : etu.getMatriculeenca());
	                p2.setString(11, etu.getSujet());
	                p2.executeUpdate();
	            }
	            connexion.commit();
	            return true;
	        } catch (SQLException e) {
	            connexion.rollback();
	            throw e;
	        } finally {
	            connexion.setAutoCommit(true);
	        }
	    }
	}
}
