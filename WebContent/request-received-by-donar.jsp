<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!doctype html>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="theme-color" content="#3e454c">

<title>BBMS | Donor List</title>

<!-- Font awesome -->
<link rel="stylesheet" href="admin/css/font-awesome.min.css">
<!-- Sandstone Bootstrap CSS -->
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<!-- Bootstrap Datatables -->
<link rel="stylesheet" href="admin/css/dataTables.bootstrap.min.css">
<!-- Bootstrap social button library -->
<link rel="stylesheet" href="admin/css/bootstrap-social.css">
<!-- Bootstrap select -->
<link rel="stylesheet" href="admin/css/bootstrap-select.css">
<!-- Bootstrap file input -->
<link rel="stylesheet" href="admin/css/fileinput.min.css">
<!-- Awesome Bootstrap checkbox -->
<link rel="stylesheet" href="admin/css/awesome-bootstrap-checkbox.css">
<!-- Admin Stye -->
<link rel="stylesheet" href="admin/css/style.css">
<style>
.errorWrap {
	padding: 10px;
	margin: 0 0 20px 0;
	background: #fff;
	border-left: 4px solid #dd3d36;
	-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
}

.succWrap {
	padding: 10px;
	margin: 0 0 20px 0;
	background: #fff;
	border-left: 4px solid #5cb85c;
	-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("UserName") != null && session.getAttribute("UserName") != "") {
	%>
	<jsp:include page="admin-header.jsp"></jsp:include>
	<div class="ts-main-content">
		<jsp:include page="admin-leftbar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row"><br><br><br><br><br>
					<form action="request-received-by-donar.jsp" method="post"
						name="search" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label">Search by Donor or
								Requirer Name / Phone Number</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="searchdata"
									id="searchdata" required>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-4">
								<button class="btn btn-primary" name="search" type="submit">Search</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-12">
					<!-- Zero Configuration Table -->
					<div class="panel panel-info">
						<div class="panel-heading">Blood Info</div>
						<div class="panel-body">
							<table border="1"
								class="table table-responsive table-hover table-striped">
								<thead>
									<tr>
										<th>S.No</th>
										<th>Name of Donar</th>
										<th>Conatact Number of Donar</th>
										<th>Name of Requirer</th>
										<th>Mobile Number of Requirer</th>
										<th>Email of Requirer</th>
										<th>Blood Require For</th>
										<th>Message of Requirer</th>
										<th>Apply Date</th>
									</tr>
								</thead>
								<%
									int count = 0;
								String searchdata = request.getParameter("searchdata");
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery(
										"SELECT tblbloodrequirer.BloodDonarID,tblbloodrequirer.name,tblbloodrequirer.EmailId,tblbloodrequirer.ContactNumber,tblbloodrequirer.BloodRequirefor,tblbloodrequirer.Message,tblbloodrequirer.ApplyDate,tblblooddonars.id as donid,tblblooddonars.FullName,tblblooddonars.MobileNumber from  tblbloodrequirer join tblblooddonars on tblblooddonars.id=tblbloodrequirer.BloodDonarID where tblblooddonars.FullName like '"
										+ searchdata + "' || tblblooddonars.MobileNumber like '" + searchdata
										+ "' || tblbloodrequirer.name like '" + searchdata + "' || tblbloodrequirer.ContactNumber like '"
										+ searchdata + "'");
								while (resultset.next()) {
									count++;
								%>
								<tbody>

									<tr>
										<td><%=count%></td>
										<td><%=resultset.getString("FullName")%></td>
										<td><%=resultset.getString("MobileNumber")%></td>
										<td><%=resultset.getString("name")%></td>
										<td><%=resultset.getString("ContactNumber")%></td>
										<td><%=resultset.getString("EmailId")%></td>
										<td><%=resultset.getString("BloodRequirefor")%></td>
										<td><%=resultset.getString("Message")%></td>
										<td><%=resultset.getString("ApplyDate")%></td>
									</tr>
								</tbody>
								<%
									}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Loading Scripts -->
	<script src="admin/js/jquery.min.js"></script>
	<script src="admin/js/bootstrap-select.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/jquery.dataTables.min.js"></script>
	<script src="admin/js/dataTables.bootstrap.min.js"></script>
	<script src="admin/js/Chart.min.js"></script>
	<script src="admin/js/fileinput.js"></script>
	<script src="admin/js/chartData.js"></script>
	<script src="admin/js/main.js"></script>
	<%
		} else {
		response.sendRedirect("index.jsp");
	}
	%>
</body>
</html>

