package Web;
import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ExpenseDAO;
import Model.Expense;


@WebServlet("/SelectExpense")
public class SelectExpense extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String division = request.getParameter("division");
		
		try {
			List<Expense> expDetails = ExpenseDAO.displaySelected(division, sDate, eDate);
			request.setAttribute("expDetails", expDetails);
			
			}catch (Exception e) {
				
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExpense.jsp");
			dispatcher.forward(request, response);
	}

}
