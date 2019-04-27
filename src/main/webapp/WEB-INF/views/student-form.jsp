<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Form</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/bulma.min.css" />
</head>
<body>

	<section class="section">
		<div class="container">
			<h1 class="title">Student Form</h1>
			<h2 class="subtitle">All the data submitted to the form should
				be correct.</h2>
		</div>
	</section>

	<div class="container">
		<div class="columns">
			<div class="column is-full">
				<div class="box">
					<form:form modelAttribute="student" method="POST">
						<form:hidden path="id" />
						<div class="field">
							<label class="label is-small">Name</label>
							<div class="control">
								<form:input path="name" cssClass="input is-small" />
							</div>
						</div>
						<div class="field">
							<label class="label is-small">Age</label>
							<div class="control">
								<form:input path="age" cssClass="input is-small" />
							</div>
						</div>
						<div class="field">
							<label class="label is-small">Gender</label>
							<div class="control">
								<form:input path="gender" cssClass="input is-small" />
							</div>
						</div>
						<div class="field">
							<label class="label is-small">Address</label>
							<div class="control">
								<form:input path="address" cssClass="input is-small" />
							</div>
						</div>
						<div class="field">
							<label class="label is-small">Phone No.</label>
							<div class="control">
								<form:input path="phoneNo" cssClass="input is-small" />
							</div>
						</div>
						<div class="field is-grouped">
							<div class="control">
								<button class="button is-success is-small">Submit</button>
							</div>
							<div class="control">
								<a href="<%=request.getContextPath()%>/students"
									class="button is-danger is-small">Cancel</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>