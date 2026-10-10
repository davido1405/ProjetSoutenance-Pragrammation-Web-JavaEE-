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
import dao.EtudiantsDAO;
import dao.EnseignantsDAO;
import models.Enseignants;
import models.Utilisateurs;

@WebServlet(name = "evaluation", urlPatterns = { "/Evaluation" })
public class Evaluation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Evaluation() {
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

		try {
			request.setAttribute("evaluations", EvaluationDAO.getAll());
			request.setAttribute("etudiants", EtudiantsDAO.getAll());
			request.setAttribute("enseignants", EnseignantsDAO.getAll());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("cheminContenu", "/WEB-INF/pages/admin/evaluations.jsp");
		request.getRequestDispatcher("/WEB-INF/pages/admin/tableauDeBord.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Saisie par un enseignant (depuis le modal 'Mon évaluation')
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("ConnectedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			return;
		}
		Utilisateurs user = (Utilisateurs) session.getAttribute("ConnectedUser");
		if (user.getRoleuser() == 2 && user instanceof Enseignants) {
			try {
				int idSout = Integer.parseInt(request.getParameter("id_soutenance"));
				double note = Double.parseDouble(request.getParameter("note").replace(',', '.'));
				String avis = request.getParameter("avis");
				EvaluationDAO.saisir(idSout, ((Enseignants) user).getMatriculEns(), note, avis);
				EvaluationDAO.getNoteFinale(idSout); // met à jour le statut si complet
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/Encadrer?page=mesEvaluations");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/Evaluation");
	}
}
