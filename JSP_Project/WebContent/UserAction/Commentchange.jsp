<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="comment.Comment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/mediaquery.css"><!-- 화면 비율에 따라 바꿔야하는 mediaquery -->
<link rel="stylesheet" href="../css/main.css">
<script src="../Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="../Bootstrap/js/popper.js"></script>
<script src="../Bootstrap/js/bootstrap.min.js"></script>
<script src="../javascript/Comment.js"></script>
<title>댓글 수정</title>
</head>
<body id="cmtchange">
<%
	request.setCharacterEncoding("UTF-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	CommentDAO cdao = new CommentDAO();
	Comment c = new Comment();
	c = cdao.Recomment(cnum); 
%>
	<form action="recommentAction.jsp?cnum=<%=cnum%>" method="POST">
		<table class="table">
			<tr>
				<th colspan="2">댓글 수정</th>
			</tr>
			<tr>
				<td><textarea name="comment" id="comment"><%=c.getComment() %></textarea></td>
				<td><input class="btn btn-primary" type="submit" value="수정하기" id="recommentbtn" onclick="return Comment()"></td>
			</tr>
		</table>
	</form>
</body>
</html>