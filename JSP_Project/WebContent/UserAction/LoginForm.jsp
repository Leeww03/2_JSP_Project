<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>집에 가는길에 홀로</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="../Bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<form method="POST" action="LoginAction.jsp" id="windowlogin">
		<label>ID</label> <input type="text" class="form-control" placeholder="ID" name="id">
		<label>Password</label> <input type="password" class="form-control" placeholder="Password" name="pw"><br>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
</body>
</html>

