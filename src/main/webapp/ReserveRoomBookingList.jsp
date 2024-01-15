<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
  crossorigin="anonymous">
  <style>
  
  .table{
  border-collapse: collapse;
  min-width:400px;
  border-radius:15px 15px 15px 15px;
  overflow:hidden;
  box-shadow:0 0 20px rgba(0, 0, 0, .15);
  background-color:#fff;
  }
  
 
  
tbody tr:nth-of-type(even){
  background-color:#F3F3F3;
  
  font-weight:500;
}
tbody tr:last-of-type{
  border-bottom:2px solid #012840;
}
.report{
width:28px;
height:28px;
}
.edit{
width:25px;
height:25px;
}
</style>
</head>

<body style="background-color: #F3F3F3">      
  <%@include file="header.jsp" %>
    <div class="container" style="margin-left: 20%; padding-top:5%">
      <h3 class="text-center" style="margin-left:80px;font-size:50px; font-weight:bold">Room Reservations</h3>
      <hr style="width:1050px; border:2px solid #fff">
      <div class="container" style="padding-top:3%">

        <a href="<%=request.getContextPath()%>/reservenewRoomBook" class="btn btn-Info" style="margin-left:-10px"><img src="header/images/add.png" class="report">Reserve Room</a>
      </div>
      

      <br>
      <table class="table">
        <thead>
          <tr>
          
            <th>Customer Name</th>
            <th>NIC</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>No Of Rooms</th>
            <th>Total Members</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        
          <c:forEach var="user" items="${listRoomBooking}">

            <tr>
              <td><c:out value="${user.user}" /></td>
              <td><c:out value="${user.nic}" /></td>
              <td><c:out value="${user.mobile}" /></td>
              <td><c:out value="${user.email}" /></td>
              <td><c:out value="${user.checkin}" /></td>
              <td><c:out value="${user.checkout}" /></td>
              <td><c:out value="${user.noofrooms}" /></td>
              <td><c:out value="${user.members}" /></td>
              

              <td><a href="reserveeditRoomBook?id=<c:out value='${user.id}' />"><img src="header/images/edit (2).png" class="edit"></a>
                <a href="reservedeleteRoomBook?id=<c:out value='${user.id}' />"><img src="header/images/delete (2).png" class="edit"></a></td>
            </tr>
          </c:forEach>
          <!-- } -->
        </tbody>

      </table>
            <div class="container text-center">

        <a href="<%=request.getContextPath()%>/reserveroombookpdf" class="btn btn-success" style="margin-left:30px"><img src="header/images/report.png" class="report">Generate Report</a>
      </div>
    </div>
</body>
</html>