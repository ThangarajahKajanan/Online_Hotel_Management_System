package Web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FoodDao;
import Model.Restaurant;

@WebServlet("/editres")
public class RestaurantEditServlet extends HttpServlet {
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
		Restaurant existingUser = FoodDao.selectRestaurant(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("NewFood.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}

}