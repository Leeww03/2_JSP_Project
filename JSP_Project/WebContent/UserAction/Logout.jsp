<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃처리</title>
</head>
<body>
<%
	session.invalidate(); 				  //session초기화
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다!");
	location.href="../index.jsp";
</script>
</body>
</html>