package Web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.RoomsBookingDao;

/**
 * Servlet implementation class RoomBookingDelete
 */
@WebServlet("/deleteRoomBook")
public class RoomBookingDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RoomsBookingDao RoomsBookingDao;

	public void init() {
		RoomsBookingDao = new RoomsBookingDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 * 
	 *      /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getServletPath();

		int id = Integer.parseInt(request.getParameter("id"));
		try {
			RoomsBookingDao.deleteRoomsBook(id);
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
