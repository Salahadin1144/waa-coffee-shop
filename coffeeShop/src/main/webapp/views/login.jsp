<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.account-wall {
	margin-top: 20px;
	padding: 40px 0px 20px 0px;
	background-color: #f7f7f7;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.login-title {
	color: #555;
	font-size: 18px;
	font-weight: 400;
	display: block;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

.need-help {
	margin-top: 10px;
}

.new-account {
	display: block;
	margin-top: 10px;
}

#login-container {
	margin-top: 200px;
	margin-bottom: auto;
}

</style>
<title>Login Page</title>
</head>
<body>
	<div class="container" id="login-container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<h1 class="text-center login-title">Sign in to continue</h1>
				<div class="account-wall">
					<img class="profile-img"
						src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
						alt="">
					<c:url value="/welcome" var="loginProcessingUrl" />
					<form class="form-signin" action="/login" method="post">
						<c:if test="${param.error != null}">
							<div>
								Failed to login.
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
	                  						Reason: <c:out
										value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:if>
							</div>
						</c:if>
						<!-- the configured LogoutConfigurer#logoutSuccessUrl is /login?logout and contains the query param logout -->
						<c:if test="${param.logout != null}">
							<div>You have been logged out.</div>
						</c:if>
						<input type="text" id="username" name="username"
							class="form-control"> <input type="password"
							id="password" name="password" class="form-control">
						<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
							in</button>
						<label class="checkbox pull-left"> <input type="checkbox"
							value="remember-me" id="remember-me" name="remember-me">
							Remember me
						</label> <a href="#" class="pull-right need-help">Need help? </a><span
							class="clearfix"></span> <input type="hidden"
							name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
				<a href="#" class="text-center new-account">Create an account </a>
			</div>
		</div>
	</div>

	<!-- <form>
		<fieldset>
			<legend>Please Login</legend>
			use param.error assuming FormLoginConfigurer#failureUrl contains the query parameter error

			<p>
				<label for="username">Username</label> <input type="text"
					 />
			</p>
			<p>
				<label for="password">Password</label> <input type="password"
					/>
			</p>
			if using RememberMeConfigurer make sure remember-me matches RememberMeConfigurer#rememberMeParameter
			<p>
				<label for="remember-me">Remember Me?</label> <input type="checkbox"
					id="remember-me" name="remember-me" />
			</p>
			<div>
				<button type="submit" class="btn">Log in</button>
			</div>
		</fieldset>
	</form> -->

</body>
</html>