<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%
	int cnum=Integer.parseInt(request.getParameter("cnum"));
	CommentDAO cdao = new CommentDAO();
	cdao.cmtdelete(cnum); 
%>
<script type="text/javascript">
	alert("댓글이 성공적으로 삭제되었습니다!");
	location = document.referrer;//이전페이지 이동/새로고침
</script>