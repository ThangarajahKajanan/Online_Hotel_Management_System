package Web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.FoodDao;
import Model.Restaurant;

@WebServlet("/updateres")
public class RestaurantUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodDao FoodDao;

	public void init() {
		FoodDao = new FoodDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		int id = Integer.parseInt(request.getParameter("id"));
		String user = request.getParameter("user");
		String juice = request.getParameter("juice");
		String main = request.getParameter("main");
		String dessert = request.getParameter("dessert");

		System.out.println("..............");

		System.out.println("id" + id + "user" + user);
		Restaurant updfood = new Restaurant(id, user, juice, main, dessert);
		try {
			FoodDao.updateRestaurant(updfood);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listres");

	}

}