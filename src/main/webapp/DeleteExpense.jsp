<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Expense</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
	<script type="text/javascript">
        function validate(){
        	
            alert ("Data Deleted Successfully!");
            	
        }
        
        </script>
        
         <style>
fieldset label {
font-size: 20px; 
}

.btn-xl{
padding:5px 30px;
font-size:20px;
border-radius: 10px;
}
</style>
</head>
<body >

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #FF5722 ; padding: 20px;">
			<div>
				<a href="header.jsp" class="navbar-brand"> Revenue </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="ViewExpense.jsp"
					class="nav-link">View Expense</a></li>
			</ul>
			
			<ul class="navbar-nav">
				<li><a href="Expense.jsp"
					class="nav-link">Add Expense</a></li>
			</ul>
			<ul class="navbar-nav">
				<li><a href="ViewIncome.jsp"
					class="nav-link">View Income</a></li>
			</ul>
			
			<ul class="navbar-nav">
				<li><a href="Income.jsp"
					class="nav-link">Add Income</a></li>
			</ul>
			<ul class="navbar-nav">
				<li><a href="Report.jsp"
					class="nav-link">Reports</a></li>
			</ul>
			
		</nav>
	</header>
	

	<%
		int id = Integer.parseInt(request.getParameter("id"));
		String date = request.getParameter("date");
		String division = request.getParameter("division");
		String type = request.getParameter("type");
		int quantity =Integer.parseInt(request.getParameter("quantity"));
		float total = Float.parseFloat(request.getParameter("total"));
	%>
	
	<div class="container" style="margin-left: 20%; padding-top: 5%">
		<div class="card" style="background-color:#F3F3F3; border-radius:15px 15px 15px 15px; box-shadow:0 0 20px rgba(0, 0, 0, .15)">
			<div class="card-body">

				<form action = "DeleteExpense" method = "post">
		
					<fieldset class="form-group">
						<label>InvoiceID</label> <input type = "text" name ="id" class="form-control" value = "<%= id %>" readonly><br>
					</fieldset>
					<fieldset class="form-group">
						<label>Date</label><br> <input type = "text" name = "date" class="form-control" value ="<%= date %>" readonly> <br><br>
						<label>Division </label>
							<select id = "div" name = "division" class="form-control" >
								<option value="Resort Room">Resort Room</option>
    							<option value="Event">Event </option>
    							<option value="Restaurant">Restaurant</option>
    							<option value="Transport">Transport</option>
    							<option value="Other">Other</option>
							</select> <br>
					</fieldset>
					<fieldset class="form-group">
						<label>Type</label> <br> <input type = "text" name = "type" class="form-control" value ="<%= type %>" readonly> <br>
					</fieldset>
					<fieldset class="form-group">
						<label>Quantity </label><br> <input type = "text" name = "quantity" class="form-control" value ="<%= quantity %>" readonly> <br>
					</fieldset>
					<fieldset class="form-group">
						<label>Total</label> <br> <input type ="text" name = "total" class="form-control" value ="<%= total %>" readonly> 
					</fieldset>
		
						<button  type ="submit" name = "submit" onClick = "return validate();" class="btn-xl btn-danger">Delete Expense</button>
				</form> 
		</div>
	</div>
</div>
</body>
</html>