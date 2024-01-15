package Web;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ReserveRoomsBookingDao;
import Model.ReserveRoomBooking;

@WebServlet("/reserveeditRoomBook")
public class ReserveRoomBookingEditServlet extends HttpServlet {
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

		int id = Integer.parseInt(request.getParameter("id"));
		ReserveRoomBooking existingUser = RoomsBookingDao.selectRoomBooking(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ReserveNewRoomBook.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}

}