<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>집에 가는길에 홀로</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/mediaquery.css"><!-- 화면 비율에 따라 바꿔야하는 mediaquery -->
<link rel="stylesheet" href="css/main.css">
<script src="Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="Bootstrap/js/popper.js"></script>
<script src="Bootstrap/js/bootstrap.min.js"></script>
<script src="javascript/Comment.js"></script>
<script src="javascript/Board.js"></script>
</head>
<body id="bodybg">
	<%
		String num=request.getParameter("Bnum");//게시글 번호를 가져옴
		BoardDAO bdao = new BoardDAO();
		Board b=bdao.getViewList(num);
		long cnt = bdao.Updatecnt(b.getCnt(),num);//조회수 업데이트후 cnt에 저장
		String id= b.getBid();
		String tag = b.getTag();
		
		/*댓글 라인*/
		CommentDAO cmt = new CommentDAO();
		List<Comment> clist = null;
		clist=cmt.getComment(num);
	%> 
	<jsp:include page="Header.jsp" flush="false" /><!-- header -->
	<jsp:include page="navbar.jsp" flush="false" /><!-- navbar -->
	<div class="container-fluid" style="">
    <div class="row" id="bmain">
    <jsp:include page="L_Side.jsp" flush="false" /><!-- L-side -->
        <div id="MenuBoard">
        		<table class="table" id="viewtable">
        			<tr>
        				<th colspan="2">작성자 : <%=id%> / 조회수 : <%=cnt %></th>
        			</tr>
        			<tr>
        				<td>제목</td>
        				<td><%=b.getTitle()%></td>
        			</tr>
        			<tr>
        				<td>태그</td>
        				<td><%=tag%></td>
        			</tr>
        			<tr>
        				<td>내용</td>
        				<td><%=b.getContent() %></td>
        			</tr>
        			<%if(b.getImg()!=null){ %>
        			<tr>
        				<td>이미지</td>
        				<td><img src="img/boardimg/<%=b.getImg()%>"></td>
        			</tr>
        			<%} %>
        		</table>
        		<%if(!tag.equals("공지")){ %>
        		<table class="table" id="viewcomment">
        			<tr>
        				<th colspan="4">댓글</th>
        			</tr>
        			<%if(clist.size()>0){
        			%>
        			<tr>
        				<th>작성자 ID</th>
        				<th>내용</th>
        				<th>작성날짜</th>
        				<th></th>
        			</tr>
        			<%
        				for(Comment c:clist){
        			%>
        			<tr>
        				<td id="view1">ID : <%=c.getId() %></td>
        				<td id="view2"><%=c.getComment() %></td>
        				<td id="view3"><%=c.getDate() %></td>
        				<%if(session.getAttribute("num")==null){ %><!-- 로그인 X -->
        				<td id="view4"></td>
        				<%}else if(c.getId().equals((String)session.getAttribute("id"))){%><!-- 자신이쓴 댓글 -->
        				<td id="view4">
        					<a onclick="window.open('UserAction/Commentchange.jsp?cnum=<%=c.getCnum()%>','댓글수정','width=600,height=130')">[수정]</a>/
        					<a href="UserAction/CommentDelete.jsp?cnum=<%=c.getCnum()%>" onclick="return CommentDelete()">[삭제]</a>
        				</td>
        				<%}else if(session.getAttribute("num").equals(0)){ %><!-- 관리자 -->
        				<td id="view4"><a href="UserAction/CommentDelete.jsp?cnum=<%=c.getCnum()%>" onclick="return CommentDelete()">[삭제]</a></td>
        				<%}else{ %>
        				<td id="view4"></td>
        				<%} %>
        			</tr>
        			<%}}else{ %>
        			<tr>
        				<td colspan="4" id="notcomment">등록된 댓글이 없습니다!</td>
        			</tr>
        			<%} %>
        		</table>
        		<%} %>
        		<%if(session.getAttribute("num")!=null && !tag.equals("공지")){ //로그인을 했을 때만 댓글 등록가능%>
        		<form action="UserAction/CommentAction.jsp?bnum=<%=num %>" method="POST" id="incomment">
	        		<table class="table">
	        			<tr>
	        				<th colspan="2">댓글 등록</th>
	        			</tr>
	        			<tr>
	        				<td><textarea name="comment" id="comment"></textarea></td>
	        				<td><input class="btn btn-primary" type="submit" value="댓글 등록" onclick="return Comment()"></td>
	        			</tr>
	        		</table>
        		</form>
        		<%} %>
        		<%if(id.equals(session.getAttribute("id"))&&session.getAttribute("num").equals(1)){ %><!-- 로그인을 했고 게시글을 쓴 사람일경우 -->
        		<div id="userviewboard">
        			<button class="btn btn-primary" onclick="location.href='BoardreWrite.jsp?bnum=<%=num%>'">게시글수정</button>
        			<button class="btn btn-primary" onclick="return BoardDelete(<%=num%>)" >게시글삭제</button>
        		</div>
        		<%} %>
        		<%if(session.getAttribute("num")==null){ %><!-- 로그인을 안한사람일 경우 -->
        		<div>
        		</div>
        		<%}else if(session.getAttribute("num").equals(0)){ %><!-- 관리자 -->
        		<div id="userviewboard">
        			<button class="btn btn-primary" onclick="return BoardDelete(<%=num%>)">게시글삭제</button>
        		</div>
        		<%} %>
        </div>
    </div>
</div>
	<jsp:include page="footer.jsp" flush="false" /><!-- footer -->
</body>
</html>

