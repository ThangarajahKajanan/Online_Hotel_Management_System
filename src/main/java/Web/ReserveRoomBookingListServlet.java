package Web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ReserveRoomsBookingDao;
import Model.ReserveRoomBooking;

@WebServlet("/reservelistRoomBook")
public class ReserveRoomBookingListServlet extends HttpServlet {
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
		List<ReserveRoomBooking> listRoomBooking = RoomsBookingDao.selectAllRoomBookings();
		// System.out.print(listUser);
		request.setAttribute("listRoomBooking", listRoomBooking);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ReserveRoomBookingList.jsp");
		dispatcher.forward(request, response);

	}

}