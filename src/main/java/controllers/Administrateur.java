package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import dao.EnseignantsDAO;
import dao.EvaluationDAO;
import dao.EtudiantsDAO;
import dao.SoutenanceDAO;
import models.Enseignants;
import models.Etudiants;
import models.Soutenance;
import models.Utilisateurs;

@WebServlet(name = "administrateur", urlPatterns = { "/administrateur" })
public class Administrateur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Administrateur() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("ConnectedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			return;
		}
		Utilisateurs user = (Utilisateurs) session.getAttribute("ConnectedUser");
		if (user.getRoleuser() != 1) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		String page = request.getParameter("page");
		String fragment = null;
		try {
			String modif = request.getParameter("modifier");
			if (modif != null && !modif.isEmpty() && page != null) {
				switch (page) {
				case "etudiants": request.setAttribute("editEtudiant", EtudiantsDAO.getByMatricule(modif)); break;
				case "encadreursJurys": request.setAttribute("editEnseignant", EnseignantsDAO.getAll().stream().filter(x -> x.getMatriculEns().equals(modif)).findFirst().orElse(null)); break;
				}
			}
			String modifierId = request.getParameter("modifierSoutenance");
			if (modifierId != null && !modifierId.isEmpty()) {
				request.setAttribute("editSoutenance", SoutenanceDAO.getById(Integer.parseInt(modifierId)));
			}
			String detailId = request.getParameter("detail");
			if (detailId != null && !detailId.isEmpty()) {
				int idDetail = Integer.parseInt(detailId);
				request.setAttribute("detailSoutenance", SoutenanceDAO.getById(idDetail));
				request.setAttribute("detailJury", EvaluationDAO.getBySoutenance(idDetail));
			}
			switch (page == null ? "" : page) {
			case "etudiants":
				String q = request.getParameter("q");
				request.setAttribute("etudiants",
					(q != null && !q.trim().isEmpty()) ? EtudiantsDAO.rechercher(q.trim()) : EtudiantsDAO.getAll());
				request.setAttribute("filieres", EtudiantsDAO.getFilieres());
				request.setAttribute("niveaux", EtudiantsDAO.getNiveaux());
				request.setAttribute("enseignants", EnseignantsDAO.getAll());
				fragment = "/WEB-INF/pages/admin/etudiants.jsp";
				break;

			case "encadreursJurys":
				java.util.List<models.Enseignants> enseignants = EnseignantsDAO.getAll();
				String qE = request.getParameter("q");
				if (qE != null && !qE.trim().isEmpty()) {
					final String qq = qE.trim().toLowerCase();
					enseignants = new java.util.ArrayList<models.Enseignants>(enseignants.stream().filter(x ->
						(x.getNomuser() != null && x.getNomuser().toLowerCase().contains(qq))
						|| (x.getPrenomuser() != null && x.getPrenomuser().toLowerCase().contains(qq))
						|| (x.getMatriculEns() != null && x.getMatriculEns().toLowerCase().contains(qq))
					).collect(java.util.stream.Collectors.toList()));
				}
				request.setAttribute("enseignants", enseignants);
				request.setAttribute("specialites", EnseignantsDAO.getSpecialites());
				fragment = "/WEB-INF/pages/admin/encadreursJurys.jsp";
				break;

			case "soutenances":
				request.setAttribute("etudiants", EtudiantsDAO.getAll());
				request.setAttribute("enseignants", EnseignantsDAO.getAll());
				java.util.List<models.Soutenance> soutenances = SoutenanceDAO.getAll();
				String qS = request.getParameter("q");
				if (qS != null && !qS.trim().isEmpty()) {
					final String qq = qS.trim().toLowerCase();
					soutenances = new java.util.ArrayList<models.Soutenance>(soutenances.stream().filter(x ->
						(x.getNometu() != null && x.getNometu().toLowerCase().contains(qq))
						|| (x.getPrenometu() != null && x.getPrenometu().toLowerCase().contains(qq))
						|| (x.getMatriculeetu() != null && x.getMatriculeetu().toLowerCase().contains(qq))
					).collect(java.util.stream.Collectors.toList()));
				}
				String dateF = request.getParameter("date");
				if (dateF != null && !dateF.isEmpty()) {
					final String d = dateF;
					soutenances = new java.util.ArrayList<models.Soutenance>(soutenances.stream().filter(x ->
						x.getDatesoutenance() != null && x.getDatesoutenance().toString().startsWith(d)).collect(java.util.stream.Collectors.toList()));
				}
				String enseignantF = request.getParameter("enseignant");
				if (enseignantF != null && !enseignantF.isEmpty()) {
					final String ef = enseignantF;
					try {
						final java.util.List<models.Soutenance> ensList = SoutenanceDAO.getByEnseignant(ef);
						final java.util.Set<Integer> ids = new java.util.HashSet<>();
						for (models.Soutenance x : ensList) ids.add(x.getIdsoutenance());
						soutenances = new java.util.ArrayList<models.Soutenance>(soutenances.stream().filter(x -> ids.contains(x.getIdsoutenance())).collect(java.util.stream.Collectors.toList()));
					} catch (SQLException ignore) {}
				}
				request.setAttribute("soutenances", soutenances);
				request.setAttribute("totalSoutenances", SoutenanceDAO.getAll().size());
				fragment = "/WEB-INF/pages/admin/soutenances.jsp";
				break;

			case "evaluations":
				request.setAttribute("evaluations", EvaluationDAO.getAll());
				fragment = "/WEB-INF/pages/admin/evaluations.jsp";
				break;

			default: // tableauDeBord
				request.setAttribute("nbEtudiants", EtudiantsDAO.nbEtudiantInscrit());
				request.setAttribute("nbEnseignants", EnseignantsDAO.nbEnseignants());
				request.setAttribute("nbSoutenances", SoutenanceDAO.nbSoutenances());
				request.setAttribute("nbEvaluees", SoutenanceDAO.nbSoutenancesEvaluees());
				request.setAttribute("soutenances", SoutenanceDAO.getAll());
				request.setAttribute("etudiants", EtudiantsDAO.getAll());
				request.setAttribute("enseignants", EnseignantsDAO.getAll());
				fragment = "/WEB-INF/pages/admin/mainTableauDeBord.jsp";
			}
			request.setAttribute("cheminContenu", fragment);
			request.getRequestDispatcher("/WEB-INF/pages/admin/tableauDeBord.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("ConnectedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			return;
		}
		Utilisateurs user = (Utilisateurs) session.getAttribute("ConnectedUser");
		if (user.getRoleuser() != 1) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}

		String page = request.getParameter("page");
		String action = request.getParameter("action");
		if (action == null) action = "ajouter";
		try {
			switch (page == null ? "" : page) {
			case "etudiants":
				switch (action) {
				case "deleteEtudiant":
					EtudiantsDAO.supprimer(request.getParameter("matricule"));
					break;
				case "updateEtudiant":
					Etudiants etuU = new Etudiants();
					etuU.setMatriculEtu(request.getParameter("matricule"));
					etuU.setNomuser(request.getParameter("nom"));
					etuU.setPrenomuser(request.getParameter("prenom"));
					etuU.setEmailuser(request.getParameter("email"));
					etuU.setContactuser(request.getParameter("contact"));
					etuU.setAdresseuser(request.getParameter("adresse"));
					etuU.setfiliere(Integer.parseInt(request.getParameter("id_filiere")));
					etuU.setNiveau(Integer.parseInt(request.getParameter("id_niveau")));
					etuU.setMatriculeenca(request.getParameter("encadrant"));
					etuU.setSujet(request.getParameter("sujet"));
					EtudiantsDAO.modifier(etuU);
					break;
				default:
					Etudiants etu = new Etudiants();
					etu.setMatriculEtu(request.getParameter("matricule"));
					etu.setNomuser(request.getParameter("nom"));
					etu.setPrenomuser(request.getParameter("prenom"));
					etu.setEmailuser(request.getParameter("email"));
					etu.setContactuser(request.getParameter("contact"));
					etu.setAdresseuser(request.getParameter("adresse"));
					etu.setfiliere(Integer.parseInt(request.getParameter("id_filiere")));
					etu.setNiveau(Integer.parseInt(request.getParameter("id_niveau")));
					etu.setMatriculeenca(request.getParameter("encadrant"));
					etu.setSujet(request.getParameter("sujet"));
					EtudiantsDAO.ajouter(etu);
				}
				break;

			case "encadreursJurys":
				switch (action) {
				case "deleteEnseignant":
					EnseignantsDAO.supprimer(request.getParameter("matricule"));
					break;
				case "updateEnseignant":
					Enseignants ensU = new Enseignants();
					ensU.setMatriculEns(request.getParameter("matricule"));
					ensU.setNomuser(request.getParameter("nom"));
					ensU.setPrenomuser(request.getParameter("prenom"));
					ensU.setEmailuser(request.getParameter("email"));
					ensU.setContactuser(request.getParameter("contact"));
					ensU.setAdresseuser(request.getParameter("adresse"));
					ensU.setSpecialite(Integer.parseInt(request.getParameter("id_specialite")));
					EnseignantsDAO.modifier(ensU);
					break;
				default:
					Enseignants ens = new Enseignants();
					ens.setMatriculEns(request.getParameter("matricule"));
					ens.setNomuser(request.getParameter("nom"));
					ens.setPrenomuser(request.getParameter("prenom"));
					ens.setEmailuser(request.getParameter("email"));
					ens.setContactuser(request.getParameter("contact"));
					ens.setAdresseuser(request.getParameter("adresse"));
					ens.setSpecialite(Integer.parseInt(request.getParameter("id_specialite")));
					EnseignantsDAO.ajouter(ens);
				}
				break;

			case "soutenances":
				switch (action) {
				case "deleteSoutenance":
				case "annulerSoutenance":
					SoutenanceDAO.annuler(Integer.parseInt(request.getParameter("id_soutenance")));
					break;
				case "updateSoutenance":
					Soutenance sU = new Soutenance();
					sU.setMatriculeetu(request.getParameter("matricule_etu"));
					sU.setSallesoutenance(request.getParameter("salle"));
					String dateHeureU = request.getParameter("date_heure");
					sU.setDatesoutenance(Timestamp.valueOf(dateHeureU.replace('T', ' ') + ":00"));
					sU.setStatutsoutenance(request.getParameter("statut"));
					sU.setIdsoutenance(Integer.parseInt(request.getParameter("id_soutenance")));
					SoutenanceDAO.modifier(sU);
					break;
				default:
					Soutenance s = new Soutenance();
					s.setMatriculeetu(request.getParameter("matricule_etu"));
					s.setSallesoutenance(request.getParameter("salle"));
					String dateHeure = request.getParameter("date_heure"); // yyyy-MM-ddTHH:mm
					s.setDatesoutenance(Timestamp.valueOf(dateHeure.replace('T', ' ') + ":00"));
					String[] jury = request.getParameterValues("jury");
					String[] qualites = new String[jury != null ? jury.length : 0];
					for (int i = 0; i < qualites.length; i++) {
						String q = request.getParameter("qualite_" + jury[i]);
						qualites[i] = (q != null && !q.isEmpty()) ? q : (i == 0 ? "President" : "Examinateur");
					}
					SoutenanceDAO.creer(s, jury, qualites);
				}
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/administrateur?page=" + (page == null ? "tableauDeBord" : page));
	}
}
