<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>New Product Form Page</title>
</head>
<body>

	<div class="panel panel-default panel-info"
		style="width: 700px; margin-left: auto; margin-right: auto; margin-top: 300px;">
		<div class="panel-heading">New Product Form</div>
		<div class="panel-body">
			<form class="form-horizontal" action="/create" method="POST" modelAttribute="productToEdit">
				<div class="form-group">
					<label class="control-label col-sm-2" for="product-name">Product
						Name:</label>
					<div class="col-sm-10">
						<input type="hidden" id="product-id" name="id" value="${productToEdit.id}">
						<input class="form-control" id="product-name" name="productName" value="${productToEdit.productName}"
							placeholder="Enter Product Name">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="product-type">Product
						Type:</label>
					<div class="col-sm-10">
						<!-- <input class="form-control" id="product-type" name="productType"
							placeholder="Enter Product Type"> -->
							<select name="productType">
								<option value="BREAKFAST">BREAKFAST</option>
								<option value="LUNCH">LUNCH</option>
								<option value="DINNER">DINNER</option>
							</select>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-price">Product
						Price:</label>
					<div class="col-sm-10">
						<input class="form-control" id="product-price" name="price" value="${productToEdit.price}"
							placeholder="Enter Product Price">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="product-desc">Product
						Description:</label>
					<div class="col-sm-10">
						<input class="form-control" id="product-desc"
							placeholder="Enter Product Description" name="description" value="${productToEdit.description}"
							></input>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>