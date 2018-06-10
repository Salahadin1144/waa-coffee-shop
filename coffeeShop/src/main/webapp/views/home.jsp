<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="container" id="login-container" style="margin-left: auto; mergin-right: auto;">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="account-wall">
					<div >
						<span> <a class="text-center login-title" href="<c:url value="/login" />"> Go to Secure
								Area </a>
						</span> 
						<br/>
						<span> <a class="text-center login-title" href="<c:url value="/register" />"> Go to
								Registration Area </a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>