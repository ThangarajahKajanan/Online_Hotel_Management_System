package Web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ReserveRoomsBookingDao;

@WebServlet("/reservenewRoomBook")
public class ReserveRoomBookingNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReserveRoomsBookingDao RoomsBookingDao;

	public void init() {
		RoomsBookingDao = new ReserveRoomsBookingDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		RequestDispatcher dispatcher = request.getRequestDispatcher("ReserveNewRoomBook.jsp");

		dispatcher.forward(request, response);
	}

}