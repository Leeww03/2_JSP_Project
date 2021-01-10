<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.Board"%>
<%@ page import="board.MainBoardDAO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>집에 가는길에 홀로</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<!-- favicon -->
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/mediaquery.css">
<link rel="stylesheet" href="css/main.css">
<script src="Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="Bootstrap/js/popper.js"></script>
<script src="Bootstrap/js/bootstrap.min.js"></script>
</head>
<body id="bodybg">
	<jsp:include page="Header.jsp" flush="false" /><!-- header -->
	<jsp:include page="navbar.jsp" flush="false" /><!-- navbar -->
	<div class="container-fluid">
		<div class="row" id="bmain">
			<jsp:include page="L_Side.jsp" flush="false" /><!-- L-side -->
			<div id="MenuBoard">
				<%
					MainBoardDAO bdao = new MainBoardDAO();
				List<Board> freelist = bdao.freeBoard("자유");//이거 한줄로도 가능함
				List<Board> horrolist = bdao.freeBoard("공포");
				List<Board> actionlist = bdao.freeBoard("액션");
				List<Board> comedylist = bdao.freeBoard("코미디");
				List<Board> warlist = bdao.freeBoard("전쟁");
				List<Board> sportlist = bdao.freeBoard("스포츠");
				List<Board> crimelist = bdao.freeBoard("범죄/스릴러");
				List<Board> romancelist = bdao.freeBoard("로멘스");
				List<Board> fantasylist = bdao.freeBoard("SF/판타지");
				%>
				<div id="Main">
					<table class="table" border="1">
						<tr>
							<th colspan="2">자유게시판</th>
						</tr>
						<%
							if (freelist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : freelist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<table class="table" border="1">
						<tr>
							<th colspan="2">공포영화 게시판</th>
						</tr>
						<%
							if (horrolist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : horrolist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<table class="table" border="1">
						<tr>
							<th colspan="2">액션영화 게시판</th>
						</tr>
						<%
							if (actionlist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : actionlist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</div>

				<div id="Main">
					<table class="table" border="1">
						<tr>
							<th colspan="2">코미디영화 게시판</th>
						</tr>
						<%
							if (comedylist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : comedylist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<table class="table" border="1">
						<tr>
							<th colspan="2">전쟁영화 게시판</th>
						</tr>
						<%
							if (warlist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : warlist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<table class="table" border="1">
						<tr>
							<th colspan="2">스포츠영화 게시판</th>
						</tr>
						<%
							if (sportlist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : sportlist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</div>

				<div id="Main">
					<table class="table" border="1">
						<tr>
							<th colspan="2">범죄/스릴러 게시판</th>
						</tr>
						<%
							if (crimelist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : crimelist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<table class="table" border="1">
						<tr>
							<th colspan="2">로멘스영화 게시판</th>
						</tr>
						<%
							if (romancelist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : romancelist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<table class="table" border="1">
						<tr>
							<th colspan="2">SF/판타지영화 게시판</th>
						</tr>
						<%
							if (fantasylist.size() > 0) {
							int cnt = 0;
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (Board list : fantasylist) {
							cnt++;
						%>
						<tr>
							<td id="Mainidtd"><%=list.getBid()%></td>
							<td id="Maintitletd"><a
								href="BoardView.jsp?Bnum=<%=list.getBnum()%>" id="Maintitlelist"><%=list.getTitle()%></a></td>
						</tr>
						<%
							}
						for (int i = 0; i < (5 - cnt); i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td id="Mainuser">작성자</td>
							<td id="Maintitle">게시글</td>
						</tr>
						<%
							for (int i = 0; i < 5; i++) {
						%>
						<tr>
							<td colspan="2" id="Maintitletd">&nbsp;</td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="false" /><!-- footer -->
</body>
</html>

