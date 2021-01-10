<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.*"%>
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
<script src="javascript/User.js"></script>
<style>
	
</style>
</head>
<body id="bodybg">
	<jsp:include page="Header.jsp" flush="false" /><!-- header -->
	<jsp:include page="navbar.jsp" flush="false" /><!-- navbar -->
	<div class="container-fluid" >
    <div class="row" id="bmain">
    <jsp:include page="L_Side.jsp" flush="false" /><!-- L-side -->
        <div id="MenuBoard">
        	<%
        		BoardDAO bdao = new BoardDAO();
        		List<Board> list = null;
        		int cnt = bdao.boardcnt();
        		int pageSize = 10;//보여질 글개수
        		String strPageNum = request.getParameter("pageNum");
        		if (strPageNum == null) { 
        			strPageNum = "1";
        		}
        		int pageNum = Integer.parseInt(strPageNum);//현재페이지값
        		int str = (pageNum - 1) * pageSize + 1;//시작행번호 
        		int end = pageNum * pageSize;//마지막행번호
        		list = bdao.getboard(str,end); 
        	%>
        	<table class="table" id="alllist">
        	<thead class="thead-dark">
        		<tr>
        			<th>게시자 ID</th>
        			<th>게시글 제목</th>
        			<th>게시 날짜</th>
        			<th>조회수</th>
        		</tr>
        		</thead>
        		<%if(list.size()>0){
        			for(Board bl:list){
        			%>
        		
        		<tr>
        			<td><%=bl.getBid() %></td>
        			<td><a href="BoardView.jsp?Bnum=<%=bl.getBnum()%>"><%=bl.getTitle()%></a></td>
        			<td><%=bl.getBdate() %></td>
        			<td><%=bl.getCnt() %></td>
        		</tr>
        		<%}}else{ %>
        			<tr>
        				<td colspan="4">게시물이 없습니다!</td>
        			</tr>
        		<%} %>
        	</table>
        	<%
							if (cnt > 0) {
							int pageCount = cnt / pageSize + (cnt % pageSize == 0 ? 0 : 1);
							int pageBlock = 5;//보여지는 전체 페이지숫자
							int strpage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
							int endpage = strpage + pageBlock - 1;

							if (endpage > pageCount) {
								endpage = pageCount;
							}
						%>
						<div id="all">
							<%
								if (strpage > pageBlock) {
							%><a href="BoardList.jsp?pageNum=<%=endpage - pageBlock%>">[이전]</a>
							<%
								}
							for (int i = strpage; i <= endpage; i++) {
								if (i == pageNum) {
							%><b>[<%=i%>]
							</b>
							<%
								} else {
							%><a href="BoardList.jsp?pageNum=<%=i%>">[<%=i%>]
							</a>
							<%
								}
							}
							if (endpage < pageCount) {
							%><a href="BoardList.jsp?pageNum=<%=strpage + pageBlock%>">[다음]</a>
							<%
								}
							%>
						
							<%
								}
        						if(session.getAttribute("num")!=null){
							%>
								<button class="btn btn-primary" id="writebtn" onclick="location.href='BoardWrite.jsp'">게시글 작성</button>
							<%
        						}
							%>
						</div>
						
        </div>
    </div>
</div>
	<jsp:include page="footer.jsp" flush="false" /><!-- footer -->
</body>
</html>

