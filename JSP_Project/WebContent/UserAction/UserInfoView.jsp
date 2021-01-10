<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserInfo" %>
<%@ page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 정보 확인</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="../Bootstrap/js/popper.js"></script>
<script src="../Bootstrap/js/bootstrap.min.js"></script>
</head>
<body id="userbody">
<%if(session.getAttribute("num")==null){ %><!-- 로그인 여부 확인 -->
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요!");
		window.close();//창닫기
	</script>
<%}%>
<%
	String id = (String)session.getAttribute("id");//session에 저장되있는 id를 가져옴 
	UserDAO info = new UserDAO();
	List<UserInfo> myinfo=null; 
	myinfo = info.userInfo(id);
%>
	<table border="1" class="table table-dark table-striped" id="userinfoview"> 
	<%if(myinfo.size()>0){
		for(UserInfo in : myinfo){
	%>
		<tr>
			<th colspan="2">유저 정보</th>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=in.getName()%></td>
		</tr>
		<tr>
			<td>주민등록 번호</td>
			<td><%=in.getRrn()%></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><%=in.getId()%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=in.getPw()%></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=in.getGender()%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=in.getAddress()%></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=in.getTel()%></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><%=in.getEmail()%></td>
		</tr>
		<tr>
			<td>이미지</td>
			<%
				if(in.getImg()==null){//등록한 이미지가 없으면 이미지 없다고 출력 있으면 등록한 사진을 보여줌
			%>
			<td>등록된 이미지가 없습니다!</td>
			<%}else{%>
			<td><img src="../img/userimg/<%=in.getImg()%>"></td>
			<%} %>
		</tr>
	<%}} %>
	</table>
</body>
</html>