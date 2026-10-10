import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class TestConnexionBD {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/soutena?useSSL=false&serverTimezone=UTC";
        String utilisateur = "root";
        String motDePasse = "";

        try (Connection connexion = DriverManager.getConnection(url, utilisateur, motDePasse)) {
            if (connexion != null && !connexion.isClosed()) {
                System.out.println("Connexion réussie à la base " + connexion.getCatalog());
            }
        } catch (SQLException e) {
            System.out.println("Échec de connexion : " + e.getMessage());
            e.printStackTrace();
        }

	}

}
