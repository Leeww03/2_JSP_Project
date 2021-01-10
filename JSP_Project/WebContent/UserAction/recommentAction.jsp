<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	String cmt = request.getParameter("comment");
	CommentDAO cdao = new CommentDAO();
	cdao.cmtupdate(cnum,cmt);
%>
<script type="text/javascript">
	alert("댓글이 수정되었습니다!");
	opener.parent.location.reload();//부모창 새로고침
	window.close();//새창 닫기
</script>