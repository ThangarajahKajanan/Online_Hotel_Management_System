<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Income List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.table {
	border-collapse: collapse;
	min-width: 400px;
	border-radius: 15px 15px 15px 15px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, .15);
	background-color: #fff;
}

.tbody tr:nth-of-type(even) {
	background-color: #F3F3F3;
	color: #012840;
	font-weight: 500;
}

tbody tr:last-of-type {
	border-bottom: 2px solid #012840;
}
.btn-outline-dark:hover{
	background-color: #FF5722;

}
</style>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#sdatepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#edatepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
<script type="text/javascript">
	function validate() {
		var sdate = document.getElementById("sdatepicker");
		var edate = document.getElementById("edatepicker");
		if (sdate.value == "") {
			alert("Please Pick A Start Date");
			return false;
		}

		else if (edate.value == "") {
			alert("Please Pick An End Date");
			return false;
		}

		else {
			alert("Results Ready");
			return true;
		}
	}
</script>

<style>
fieldset label {
	font-size: 20px;
}

.btn-xl {
	padding: 5px 30px;
	font-size: 20px;
	border-radius: 10px;
}
</style>

</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #FF5722 ; padding: 20px;">
			<div>
				<a href="header.jsp" class="navbar-brand"> Revenue </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="ViewExpense.jsp" class="nav-link"> View Expense</a></li>
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
				<li><a href="Report.jsp"
					class="nav-link">Reports</a></li>
			</ul>

		</nav>
	</header>


	<div class="container" style="margin-left: 20% ; padding-top: 5%">
		<div class="card"
			style="background-color: #F3F3F3; border-radius: 15px 15px 15px 15px; box-shadow: 0 0 20px rgba(0, 0, 0, .15)">
			<div class="card-body">

				<form action="IncomeServlet" method="post">

					<button type="submit" name="submit" class="btn-xl btn-outline-dark">View
						All Income</button>
					<br> <br>

				</form>

				<form action="SelectIncome" method="post">

					<fieldset>
						<label>From</label> <br> <input type="text" name="sDate" id="sdatepicker" class="form-control"> <br>
					</fieldset>
					<fieldset>
						<label>To</label> <br> <input type="text" name="eDate" id="edatepicker" class="form-control"> <br> <br>
					</fieldset>
					<fieldset class="form-group">
						<label>Division</label> <select id="div" name="division"
							class="form-control">
							<option value="Resort Room">Resort Room</option>
							<option value="Event">Event</option>
							<option value="Restaurant">Restaurant</option>
							<option value="Transport">Transport</option>
							<option value="Other">Other</option>
						</select> <br>
					</fieldset>

					<button type="submit" name="submit" onClick="return validate();"
						class="btn-xl btn-outline-dark">Search</button>
				</form>
			</div>
		</div>
	</div>

	<div class="container" style="margin-left: 20%; padding-top: 5%">
		<div class="card"
			style="background-color: #F3F3F3; border-radius: 15px 15px 15px 15px; box-shadow: 0 0 20px rgba(0, 0, 0, .15)">
			<div class="card-body">
				<table>
					<tr>
						<th style="text-align: center">InvoiceID</th>
						<th style="text-align: center">Date</th>
						<th style="text-align: center">Division</th>
						<th style="text-align: center">Total</th>
						<th style="text-align: center">Remarks</th>
					</tr>

					<c:forEach var="inc" items="${incDetails}">
						<c:set var="id" value="${inc.id}" />
						<c:set var="date" value="${inc.date}" />
						<c:set var="division" value="${inc.division}" />
						<c:set var="total" value="${inc.total}" />
						<c:set var="remarks" value="${inc.remarks}" />

						<tr>
							<td style="text-align: center">${inc.id}</td>
							<td style="text-align: center; width: 110px">${inc.date}</td>
							<td style="text-align: center; width: 110px">${inc.division}</td>
							<td style="text-align: center; width: 110px">${inc.total}</td>
							<td style="text-align: center; width: 200px">${inc.remarks}</td>
							<td>
								<c:url value="UpdateIncome.jsp" var="incUpdate">
									<c:param name="id" value="${id}" />
									<c:param name="date" value="${date}" />
									<c:param name="division" value="${division}" />
									<c:param name="total" value="${total}" />
									<c:param name="remarks" value="${remarks}" />
								</c:url> <a href="${incUpdate}">
							<button type="submit" name="submit" class="btn btn-primary">Update</button></a>
							</td>

							<td>
								<c:url value="DeleteIncome.jsp" var="incDelete">
									<c:param name="id" value="${id}" />
									<c:param name="date" value="${date}" />
									<c:param name="division" value="${division}" />
									<c:param name="total" value="${total}" />
									<c:param name="remarks" value="${remarks}" />

								</c:url> <a href="${incDelete}">
									<button type="submit" name="submit" class="btn btn-danger">Delete</button>
							</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>