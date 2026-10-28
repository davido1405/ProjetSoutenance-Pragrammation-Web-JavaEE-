package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import dao.SoutenanceDAO;
import models.Enseignants;
import models.Utilisateurs;

@WebServlet(name = "encadrer", urlPatterns = { "/Encadrer" })
public class Encadrer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Encadrer() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("ConnectedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			return;
		}
		Utilisateurs user = (Utilisateurs) session.getAttribute("ConnectedUser");
		if (user.getRoleuser() != 2 || !(user instanceof Enseignants)) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		Enseignants enseignant = (Enseignants) user;

		String page = request.getParameter("page");
		if (page == null) page = "tableauDeBord";

		try {
			request.setAttribute("dateJour", utils.DateUtils.aujourdHui());
			java.util.List<models.Soutenance> convocations = SoutenanceDAO.getByEnseignant(enseignant.getMatriculEns());
			String q = request.getParameter("q");
			if (q != null && !q.trim().isEmpty()) {
				final String qq = q.trim().toLowerCase();
				convocations = new java.util.ArrayList<models.Soutenance>(convocations.stream().filter(s ->
					(s.getNometu() != null && s.getNometu().toLowerCase().contains(qq))
					|| (s.getPrenometu() != null && s.getPrenometu().toLowerCase().contains(qq))
				).collect(java.util.stream.Collectors.toList()));
			}
			request.setAttribute("convocations", convocations);
			int nbAEvaluer = 0, nbTransmises = 0;
			for (models.Soutenance s : SoutenanceDAO.getByEnseignant(enseignant.getMatriculEns())) {
				if (s.getNote() == null) nbAEvaluer++; else nbTransmises++;
			}
			request.setAttribute("nbAEvaluer", nbAEvaluer);
			request.setAttribute("nbTransmises", nbTransmises);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String vue;
		switch (page) {
		case "mesSoutenances": vue = "/WEB-INF/pages/enseignants/mesSoutenances.jsp"; break;
		case "mesEvaluations": vue = "/WEB-INF/pages/enseignants/mesEvaluations.jsp"; break;
		default:             vue = "/WEB-INF/pages/enseignants/tableauDeBord.jsp";
		}
		request.getRequestDispatcher(vue).forward(request, response);
	}
}
