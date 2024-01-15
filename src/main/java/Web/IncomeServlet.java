package Web;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.IncomeDAO;
import Model.Income;


@WebServlet("/IncomeServlet")
public class IncomeServlet extends HttpServlet {
private static final long serialVersionUID = 1L;


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
		List<Income> incDetails = IncomeDAO.display();
		request.setAttribute("incDetails", incDetails);
		
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewIncome.jsp");
		dispatcher.forward(request, response);
		
	}

}
