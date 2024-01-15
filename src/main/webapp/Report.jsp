<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
fieldset label {
	font-size: 20px;
}

.center {
	margin: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	
}

.button {
	 display: inline-block;
     outline: none;
     cursor: pointer;
     font-weight: 600;
     border-radius: 3px;
     padding: 12px 24px;
     border: 0;
     background: #FF5722;
     line-height: 1.15;
     font-size: 20px;
     
}
.button:hover {
     	transition: all .1s ease;
        box-shadow: 0 0 0 0 #fff, 0 0 0 3px #FF5722;
     }


</style>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #FF5722; padding: 20px;">
			<div>
				<a href="header.jsp" class="navbar-brand">Revenue</a>
			</div>

			<ul class="navbar-nav">
				<li><a href="ViewExpense.jsp" class="nav-link">View Expense</a></li>
			</ul>

			<ul class="navbar-nav">
				<li><a href="Expense.jsp" class="nav-link">Add Expense</a></li>
			</ul>

			<ul class="navbar-nav">
				<li><a href="ViewIncome.jsp" class="nav-link">View Income</a></li>
			</ul>

			<ul class="navbar-nav">
				<li><a href="Income.jsp" class="nav-link">Add Income</a></li>
			</ul>

			<ul class="navbar-nav">
				<li><a href="Report.jsp" class="nav-link">Reports</a></li>
			</ul>
		</nav>

	</header>
	<div class="container">
		<div class="center">

			<a href="<%=request.getContextPath()%>/incomeReport.jsp">
			<button type="submit" name="submit" onClick="return validate();"
					class="button">Generate Income Report </button>
					
			 <a href="<%=request.getContextPath()%>/expenseReport.jsp">			 
			<button type="submit" name="submit" onClick="return validate();"
					class="button">Generate Expense Report </button>		
		</div>
	</div>
</body>
</html>