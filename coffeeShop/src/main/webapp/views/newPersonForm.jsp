<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>New Person Form Page</title>
</head>
<body>

	<div class="panel panel-default panel-info"
		style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 300px;">
		<div class="panel-heading">New Person Form</div>
		<div class="panel-body">

			<form:form class="form-horizontal" action="/createPerson"
				method="POST" modelAttribute="newPerson">

				<%-- <div class="form-group">
					<div class="col-sm-10">
						<form:input path="${newPerson.id}" class="form-control" type="hidden"/>
					</div>
				</div> --%>

				<div class="form-group">
					<label class="control-label col-sm-2" for="person-name">Person
						First Name:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="firstName" name="firstName"
							path="firstName" />
						<%-- "${newPerson.firstName}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-name">Person
						Last Name:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="lastName" name="lastName"
							path="lastName" />
						<%-- ${newPerson.lastName}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-price">Person
						Email:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="email" name="email"
							path="email" />
						<%-- "${newPerson.email}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-desc">Person
						Phone:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="phone" name="phone"
							path="phone" />
						<%-- "${newPerson.phone}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-name">Person
						City:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="city" name="city" path="${address.city}" />
						<%-- "${newPerson.address.city}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-name">Person
						Country:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="country" name="${newPerson.address.country}"
							path="${newPerson.address.country}" />
						<%-- "${newPerson.address.country}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-name">Person
						State:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="state" name="${newPerson.address.state}"
							path="${newPerson.address.state}" />
						<%-- "${newPerson.address.state}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-name">Person
						ZIP-Code:</label>
					<div class="col-sm-10">
						<form:input class="form-control" id="zipcode" name="${newPerson.address.zipcode}"
							path="${newPerson.address.zipcode}" />
						<%-- "${newPerson.address.zipcode}"/> --%>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form:form>
		</div>
	</div>
</body>
</html>