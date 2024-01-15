<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
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

<body>
	<%@include file="header.jsp" %>
		<div class="container" style="margin-left: 20%; padding-top:5%">
		<div class="card"  style="background-color:#F3F3F3; border-radius:15px 15px 15px 15px; box-shadow:0 0 20px rgba(0, 0, 0, .15)">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="updateres" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insertres" method="post">
				</c:if>

				<caption>
					<h2 style="margin-left: 36%;font-size: 40px; font-weight:bold;color:Black; margin-top: 20px">
						<c:if test="${user != null}">
            			Edit Restaurant Order
            		</c:if>
						<c:if test="${user == null}">
            			Welcome To US Restaurant
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}'/>" />
				</c:if>

				<fieldset class="form-group">
					<label> Customer Name</label> <input type="text"
						value="<c:out value='${user.user}' />" class="form-control"
						name="user" required="required">
				</fieldset>

				<fieldset class="form-group">
					
					 <select  name="juice"  required>
                                    <option value="">Beverage</option>
                                    <option value="Banana Juice">Banana Juice</option>
                                    <option value="Orange Juice">Orange Juice</option>
                                     <option value="PineApple Juice">PineApple Juice</option>
                                    <option value="Apple Juice">Apple Juice</option>
                                  <option value="Mango Juice">Mango Juice</option>
                                  <option value="Chocolate Milkshake">Chocolate Milkshake</option>
                                  <option value="Mojito">Mojito</option>
                                  
                         </select> 	
				</fieldset>

				<fieldset class="form-group">
					
                                <select  name="main"  required>
                                    <option value="">Main Food</option>
                                    <option value="chicken briyani">Chicken Briyani</option>
                                    <option value="chicken nasi goreng">Chicken Nasi goreng</option>
                                    <option value="vegetable rice with curry">Vegetable rice with curry</option>
                                    <option value="egg noodles">Egg Noodles</option>
                                    <option value="garlic naan with paneer butter masala">Garlic naan with paneer butter masala</option> 
                                    <option value="Mongolian rice">Mongolian rice</option>
                                    <option value="Chicken Pizza">Chicken Pizza</option>
                                    <option value="Chicken Burger">Chicken Burger</option>
                                </select>	
				</fieldset>
				<fieldset class="form-group">
					
						 <select  name="dessert"  required>
                                    <option value="">Dessert</option>
                                    <option value="chocolate mousse">Chocolate mousse</option>
                                    <option value="cheese cake">Cheese cake</option>
                                    <option value="brownie with ice cream">brownie with ice cream</option> 
                                    <option value="Fruit Salad">Fruit Salad</option>
                                     <option value="Caremal Pudding">Caremal Pudding</option>
                                     <option value="Faluda">Faluda</option>
                                </select>   
				</fieldset>

              <div class="container text-right" style="margin-top:50px">
				<button type="submit" class="btn btn-success">Submit</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>