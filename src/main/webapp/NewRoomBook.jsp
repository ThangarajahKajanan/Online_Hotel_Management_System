<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
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
	<%@include file="header.jsp"%>
	<div class="container" style="margin-left: 20%; padding-top: 5%;">
		<div class="card"
			style="background-color: #F3F3F3; border-radius: 15px 15px 15px 15px; box-shadow: 0 0 20px rgba(0, 0, 0, .15)">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updateRoomBook" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insertRoomBook" method="post">
				</c:if>

				<caption>
					<h2
						style="margin-left: 36%; font-size: 40px; font-weight: bold; color: #012840; margin-top: 20px">
						<c:if test="${user != null}">
            			Edit ROom
            		</c:if>
						<c:if test="${user == null}">
            			Add Room
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
				<br> <br>

				<fieldset class="form-group">
					<label>Room Type</label>
						<select id="roomType" name="roomType" required="required">
							<option value="Non A/C">Non A/C </option>
							<option value="A/C">A/C </option>
						</select>
				</fieldset>
				
				
				

				<fieldset class="form-group">
					<label> Cost</label> <input type="text"
						value="<c:out value='${user.cost}' />" class="form-control"
						name="cost" required="required" >
				</fieldset>
				

				<fieldset class="form-group">
					<label>No of Beds</label> <input type="text"
						value="<c:out value='${user.bed}' />" class="form-control"
						name="bed" required="required" maxlength="1">
				</fieldset>


				<div class="container text-right" style="margin-top: 50px">

					<button type="submit" class="btn-xl btn-success">Submit</button>
				</div>
				</form>
			</div>
		</div>
		<br> <br> <br>
	</div>
</body>
</html>