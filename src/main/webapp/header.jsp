<html>
<head>
<title>Welcome To Admin Dashboard</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<style>
html {
	background-image: url('../assets/background.png') !important;
}

thead {
	background: #012840;
	color: white;
}

table.dataTable tbody tr {
	background: #b4c8f7;
	font-weight: 600;
	color: black;
}

.sidebar-container {
	position: fixed;
	width: 260px;
	height: 100%;
	left: 0;
	overflow-x: hidden;
	overflow-y: auto;
	background: #FF5722;
	color: #fff;
}

.content-container {
	padding-top: 20px;
}

.sidebar-logo {
	padding: 10px 15px 10px 30px;
	font-size: 30px;
	background-color: #D0F2F2;
	color: #012840;
}

.sidebar-logo div {
	font-size: 16px;
	padding: 0px 0px 8px 0px;
}

.sidebar-navigation {
	padding: 0;
	margin: 0;
	list-style-type: none;
	position: relative;
}

.sidebar-navigation li {
	background-color: transparent;
	position: relative;
	display: inline-block;
	width: 100%;
	line-height: 20px;
}

.sidebar-navigation li a {
	padding: 10px 15px 10px 30px;
	display: block;
	color: #fff;
}

.sidebar-navigation li .fa {
	margin-right: 10px;
}

.sidebar-navigation li a:active, .sidebar-navigation li a:hover,
	.sidebar-navigation li a:focus {
	text-decoration: none;
	outline: none;
}

.sidebar-navigation li:hover {
	width: 100%;
	background-color: #7ED9D9;
}

.sidebar-navigation .header::before {
	background-color: transparent;
}

.content-container {
	padding-left: 220px;
}

.sidebar-navigation li a {
	padding: 10px 15px 10px 30px;
	display: block;
	color: #fff;
	line-height: 40px;
	font-size: 18px;
	font-weight: 600;
}

.footer {
	position: absolute;
	left: 5px;
	font-size: 10px;
	color: #F3F3F3;
}

li img {
	width: 30px;
	height: 30px;
}
</style>

</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="sidebar-container">
			<div class="sidebar-logo">
				<b>Admin</b>
				<div>Dashboard</div>
			</div>
			<ul class="sidebar-navigation">
				<li><a href="#"><img src="header/images/inventories.png">
						<i class="fa fa-home" aria-hidden="true"></i> Supply </a></li>

				<li><a href="#"> <img
						src="header/images/employee.png"><i class="fa fa-cog"
						aria-hidden="true"></i> Employees
				</a></li>

				<li><a href="listRoomBook"> <img src="header/images/room.png"><i
						class="fa fa-tachometer" aria-hidden="true"></i>Rooms
				</a></li>

				<li><a href="reservelistRoomBook"> <img
						src="header/images/roombook.png"><i class="fa fa-tachometer"
						aria-hidden="true"></i>Rooms Reservation
				</a></li>

				<li><a href="#"><img src="header/images/event.png">
						<i class="fa fa-info-circle" aria-hidden="true"></i>Event Bookings
				</a></li>

				<li><a href="FoodList.jsp"><img
						src="header/images/restaurent.png"> <i
						class="fa fa-info-circle" aria-hidden="true"></i>Restaurant </a></li>

				<li><a href="#"> <img
						src="header/images/tours.png"><i class="fa fa-info-circle"
						aria-hidden="true"></i>Tour Packages
				</a></li>

				<li><a href="#"> <img
						src="header/images/vehicle.png"><i class="fa fa-info-circle"
						aria-hidden="true"></i>Vehicle Reservation
				</a></li>

				<li><a href="ViewIncome.jsp"> <img
						src="header/images/finanance.png"><i
						class="fa fa-info-circle" aria-hidden="true"></i> Revenue
				</a></li>

				<li><a href="index.html"><img
						src="header/images/logout.png"> <i class="fa fa-info-circle"
						aria-hidden="true"></i>LogOut </a></li>

			</ul>
			<div class="footer">© ITP Project 2022. All Rights Reserved</div>
		</div>
	</div>
</body>
</html>