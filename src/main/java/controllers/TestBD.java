package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Servlet implementation class TestBD
 */
@WebServlet(name = "test-bd", urlPatterns = { "/test-bd" })
public class TestBD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestBD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "jdbc:mysql://localhost:3306/soutena?useSSL=false&serverTimezone=UTC";
        String utilisateur = "root";
        String motDePasse = "";

        try (Connection connexion = DriverManager.getConnection(url, utilisateur, motDePasse)) {
            if (connexion != null && !connexion.isClosed()) {
                response.getWriter().append("Connexion réussie à la base " + connexion.getCatalog()).append(request.getContextPath());
            }
        } catch (SQLException e) {
            System.out.println("Échec de connexion : " + e.getMessage());
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
