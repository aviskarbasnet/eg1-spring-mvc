<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/bulma.min.css" />
<style type="text/css">
.table th, .table td {
	vertical-align: middle;
}
</style>
</head>
<body>

	<section class="section">
		<div class="container">
			<h1 class="title">Student List</h1>
			<h2 class="subtitle">All students data.</h2>
		</div>
	</section>

	<div class="container">
		<div class="columns">
			<div class="column is-full">
				<div class="field is-grouped">
					<div class="control">
						<a href="<%=request.getContextPath()%>/add-student"
							class="button is-success is-small">Add Student</a>
					</div>
				</div>
				<table
					class="table content is-small is-bordered is-striped is-narrow is-hoverable is-fullwidth">
					<thead>
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Address</th>
							<th>Phone No.</th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="6">
								<strong>Total Records :</strong>
								${students.size()}
							</td>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${students}" var="student">
							<tr>
								<td>${student.name}</td>
								<td>${student.age}</td>
								<td>${student.gender}</td>
								<td>${student.address}</td>
								<td>${student.phoneNo}</td>
								<td>
									<a class="button is-primary is-small"
										href="<%=request.getContextPath()%>/edit-student?id=${student.id}">Edit</a>
									<a class="button is-danger is-small"
										href="<%=request.getContextPath()%>/delete-student?id=${student.id}">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>