<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW찾기</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="../Bootstrap/js/bootstrap.min.js"></script>
<script src="../javascript/User.js"></script>
</head>
<body id="userbody">
	<form method="POST" action="infoFindAction.jsp" id="findinfo" name="findform">
		<label><b>ID찾기</b></label><br>
		<label>이름</label> <input type="text" class="form-control" placeholder="이름" name="name">
		<label>주민등록번호</label> <input type="password" class="form-control" placeholder="주민등록번호" name="rrn"><br>
		<button type="submit" class="btn btn-primary" onclick="return idfind()">ID찾기</button>
	</form>
	<form method="POST" action="infoFindAction.jsp" id="findinfo" name="findform2">
		<label><b>PW찾기</b></label><br>
		<label>ID</label> <input type="text" class="form-control" placeholder="ID" name="id">
		<label>주민등록번호</label> <input type="password" class="form-control" placeholder="주민등록번호" name="rrn"><br>
		<button type="submit" class="btn btn-primary" onclick="return pwfind()">PW찾기</button>
	</form>
</body>
</html>