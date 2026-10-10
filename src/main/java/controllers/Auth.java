package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import dao.UtilisateurDAO;
import models.Utilisateurs;

@WebServlet(name = "auth", urlPatterns = { "/login", "/logout" })
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Auth() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getServletPath().equals("/logout")) {
			HttpSession session = request.getSession(false);
			if (session != null) session.invalidate();
			response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/authPage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("email");
		String mdp = request.getParameter("password");

		// La page de connexion utilise 'email' comme login : on accepte login ou email
		if (login == null || login.isEmpty()) login = request.getParameter("login");

		Utilisateurs user = UtilisateurDAO.connexion(login, mdp);

		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("ConnectedUser", user);
			switch (user.getRoleuser()) {
			case 1: response.sendRedirect(request.getContextPath() + "/administrateur"); break;
			case 2: response.sendRedirect(request.getContextPath() + "/Encadrer"); break;
			case 3: response.sendRedirect(request.getContextPath() + "/Etudiant"); break;
			default: response.sendRedirect(request.getContextPath() + "/authPage.jsp");
			}
		} else {
			request.setAttribute("erreur", "Identifiant ou mot de passe incorrect.");
			request.getRequestDispatcher("/authPage.jsp").forward(request, response);
		}
	}
}
