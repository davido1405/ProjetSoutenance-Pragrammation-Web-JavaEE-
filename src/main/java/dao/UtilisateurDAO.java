package dao;

import Connection.ConnexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Administrateur;
import models.Enseignants;
import models.Etudiants;
import models.Utilisateurs;
import utils.HashUtils;

public class UtilisateurDAO {
	
	//Méthode de connexion;
	public static Utilisateurs connexion(String login,String mdp_saisi) {
		
		Utilisateurs user=new Utilisateurs();
		
		String requete="SELECT * FROM utilisateur WHERE login=?";
		
		try (Connection conn=ConnexionBD.getConnection();){
			PreparedStatement requete1=conn.prepareStatement(requete);
			requete1.setString(1, login);
			ResultSet rs1=requete1.executeQuery();
			
			if(rs1.next()) {
				String hashBD=rs1.getString("mdp");
				String hashSaisi=HashUtils.hasherSHA256(mdp_saisi);
				if(hashBD.equals(hashSaisi)) {
					//Récupérer les informations de l'utilisateur selon role;
					switch(rs1.getInt("id_role")) {
					case(1):
						PreparedStatement rsAdm=conn.prepareStatement("SELECT * FROM administrateur WHERE id_utilisateur=?");
						rsAdm.setInt(1, rs1.getInt("id_utilisateur"));
						ResultSet rAdm=rsAdm.executeQuery();
						if(rAdm.next()) {
						Administrateur admin=new Administrateur();
						admin.setCodeadmin(rAdm.getString("code_admin"));
						admin.setNomuser(rAdm.getString("nom_admin"));
						admin.setPrenomuser(rAdm.getString("prenom_admin"));
						admin.setEmailuser(rAdm.getString("email_admin"));
						admin.setContactuser(rAdm.getString("contact_admin"));
						admin.setAdresseuser(rAdm.getString("adresse_admin"));
						admin.setRoleuser(rs1.getInt("id_role"));
						admin.setIduser(rAdm.getInt("id_utilisateur"));
						return admin;
							
						}
						break;
					case(2):
						PreparedStatement rsEns=conn.prepareStatement("SELECT * FROM enseignant WHERE id_utilisateur=?");
						rsEns.setInt(1, rs1.getInt("id_utilisateur"));
						ResultSet rEns=rsEns.executeQuery();
						if(rEns.next()) {
						Enseignants enseignant=new Enseignants();
						enseignant.setMatriculEns(rEns.getString("matricule_ens"));
						enseignant.setNomuser(rEns.getString("nom_ens"));
						enseignant.setPrenomuser(rEns.getString("prenom_ens"));
						enseignant.setEmailuser(rEns.getString("email_ens"));
						enseignant.setContactuser(rEns.getString("contact_ens"));
						enseignant.setAdresseuser(rEns.getString("adresse_ens"));
						enseignant.setIduser(rEns.getInt("id_utilisateur"));
						enseignant.setRoleuser(rs1.getInt("id_role"));
						enseignant.setSpecialite(rEns.getInt("id_specialite"));
						return enseignant;
						}
						break;
					case(3):
						PreparedStatement rsEtud=conn.prepareStatement("SELECT * FROM etudiant WHERE id_utilisateur=?");
						rsEtud.setInt(1, rs1.getInt("id_utilisateur"));
						ResultSet rEtud=rsEtud.executeQuery();
						if(rEtud.next()) {
						Etudiants etudiant=new Etudiants();
						etudiant.setMatriculEtu(rEtud.getString("matricule_etu"));
						etudiant.setNomuser(rEtud.getString("nom_etu"));
						etudiant.setPrenomuser(rEtud.getString("prenom_etu"));
						etudiant.setEmailuser(rEtud.getString("email_etu"));
						etudiant.setContactuser(rEtud.getString("contact_etu"));
						etudiant.setAdresseuser(rEtud.getString("adresse_etu"));
						etudiant.setIduser(rEtud.getInt("id_utilisateur"));
						etudiant.setfiliere(rEtud.getInt("id_filiere"));
						etudiant.setNiveau(rEtud.getInt("id_niveau"));
						etudiant.setRoleuser(rs1.getInt("id_role"));
						etudiant.setMatriculeenca(rEtud.getString("matricule_ens_encadrant"));
						return etudiant;
							
						}
						break;
						
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
