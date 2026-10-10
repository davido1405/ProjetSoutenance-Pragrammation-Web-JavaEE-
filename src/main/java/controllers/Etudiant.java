package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import dao.EvaluationDAO;
import dao.SoutenanceDAO;
import dao.EtudiantsDAO;
import models.Etudiants;
import models.Soutenance;
import models.Utilisateurs;

@WebServlet(name = "etudiant", urlPatterns = { "/Etudiant" })
public class Etudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Etudiant() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("ConnectedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			return;
		}
		Utilisateurs user = (Utilisateurs) session.getAttribute("ConnectedUser");
		if (user.getRoleuser() != 3 || !(user instanceof Etudiants)) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		Etudiants etu = (Etudiants) user;
		String page = request.getParameter("page");
		if (page == null) page = "tableauDeBord";

		try {
			Soutenance maSoutenance = SoutenanceDAO.getByEtudiant(etu.getMatriculEtu());
			request.setAttribute("maSoutenance", maSoutenance);
			request.setAttribute("etudiant", EtudiantsDAO.getByMatricule(etu.getMatriculEtu()));
			if (maSoutenance != null) {
				request.setAttribute("jurys", EvaluationDAO.getBySoutenance(maSoutenance.getIdsoutenance()));
				request.setAttribute("noteFinale", EvaluationDAO.getNoteFinale(maSoutenance.getIdsoutenance()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String vue;
		switch (page) {
		case "maSoutenance": vue = "/WEB-INF/pages/etudiants/maSoutenance.jsp"; break;
		case "monResultat":   vue = "/WEB-INF/pages/etudiants/monResultat.jsp"; break;
		default:             vue = "/WEB-INF/pages/etudiants/tableauDeBord.jsp";
		}
		request.getRequestDispatcher(vue).forward(request, response);
	}
}
