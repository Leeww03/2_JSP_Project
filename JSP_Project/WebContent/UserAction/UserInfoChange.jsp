<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserInfo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 정보 변경</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="../Bootstrap/js/popper.js"></script>
<script src="../Bootstrap/js/bootstrap.min.js"></script>
<script src="../javascript/User.js"></script>
</head>
<body>
<%if(session.getAttribute("num")==null){ %><!-- 로그인 여부 확인 -->
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요!");
		window.close();//창닫기
	</script>
<%}%>
		<form method="POST" action="infochageAction.jsp" name="userin" enctype="multipart/form-data" onsubmit="imgcheck()" id="userin">
			<label>ID</label>
			<input type="text" class="form-control"placeholder="ID" name="id" id="id">
			<button type="button" class="btn btn-primary" onclick="idcheck('idcheck.jsp')">중복체크</button>
			<div id="idcheck"></div>
			<label>Password</label>
			<input type="password" class="form-control" placeholder="Password" name="pw" id="pw" onchange="pwcheck()">
			<label>PW확인 </label>
        	<input type="password" class="form-control" name="rpw" id="rpw" onchange="pwcheck()">
        	<div id="pwmessage"></div>
        	<input type="checkbox" onclick="lookpw()">Password 보기<br>
			<label>주소</label>
			<input type="text" class="form-control" placeholder="Password" name="address" id="address">
			<label>전화번호</label>
			<input type="text" class="form-control" placeholder="Password" name="tel" id="tel">
			<label>email</label>
			<input type="text" class="form-control" placeholder="Password" name="email" id="email">
			<label>회원 이미지</label><br>
			<input type="file" name="img"><br><br>
			<button type="submit" class="btn btn-primary" onclick="return infochange()">변경하기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='Userdelete.jsp'">계정탈퇴</button>
	</form>
</body>
</html>