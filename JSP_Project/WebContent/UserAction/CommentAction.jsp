<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<jsp:useBean id="cmt" class="comment.Comment"/>
<%
	request.setCharacterEncoding("UTF-8");
	CommentDAO cdao = new CommentDAO();
	String id=(String)session.getAttribute("id");
	String comment = request.getParameter("comment");
	int num=Integer.parseInt(request.getParameter("bnum"));//게시글 번호를 가져옴
	cmt.setId(id);
	cmt.setComment(comment);
	cmt.setBnum(num);
	cdao.incmt(cmt);
%>
 <script type="text/javascript">
	alert("댓글이 등록 되었습니다!");
	window.location = document.referrer;
</script> 