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

@WebServlet("/insertres")
public class RestaurantAddServlet extends HttpServlet {
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
		String user = request.getParameter("user");
		String juice = request.getParameter("juice");
		String main = request.getParameter("main");
		String dessert = request.getParameter("dessert");

		Restaurant newfood = new Restaurant(user, juice, main, dessert);
		try {
			FoodDao.insertRestaurant(newfood);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listres");

	}

}