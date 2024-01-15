package Web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.RoomsBookingDao;
import Model.RoomBooking;

/**
 * Servlet implementation class RoomBookingAddServlet
 */
@WebServlet("/insertRoomBook")
public class RoomBookingAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private RoomsBookingDao RoomsBookingDao;

	public void init() {
		RoomsBookingDao = new RoomsBookingDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		String roomType = request.getParameter("roomType");
		int cost = Integer.parseInt(request.getParameter("cost"));
		int bed = Integer.parseInt(request.getParameter("bed"));

		RoomBooking rm = new RoomBooking(roomType, cost, bed);
		try {
			RoomsBookingDao.insertRoomsBook(rm);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("listRoomBook");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
