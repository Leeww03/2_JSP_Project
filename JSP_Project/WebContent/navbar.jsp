<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>navbar</title>
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/mediaquery.css">
<script src="Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="Bootstrap/js/popper.js"></script>
<script src="Bootstrap/js/bootstrap.min.js"></script>
<script src="javascript/Board.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark" id="nav">
			<a class="navbar-brand" href="index.jsp">Main</a><!-- index.jsp로 이동(메인화면) -->
			<a class="nav-link" href="tagBoard.jsp?tag=자유">자유 게시판</a>
			<a class="nav-link" href="tagBoard.jsp?tag=공지">패치노트</a>
			<form class="form-inline ml-auto" action="searchBoard.jsp" method="POST">
				<input class="form-control" type="search" placeholder="검색" name="search" id="search">
				<button class="btn btn-outline-primary" type="submit" onclick="return searchform()">검색</button>
			</form>
			<div class="dropdown"><!-- dropdown 로그인시 유저면 (정보수정,게시글작성,로그아웃)관리자 계정이면 (유저정보,게시글작성,로그아웃)그게 아니면 로그인,회원가입,ID/PW찾기 -->
				<%
					if(session.getAttribute("num")==null){//session이 num인 값이 null이면 로그인한 상태가 아니므로 로그인창을 보여줌
				%>
				<button class="btn btn-dark dropdown-toggle" data-toggle="dropdown">로그인</button>
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" onclick="window.open('UserAction/LoginForm.jsp','로그인', 'width=500, height=245')">로그인</a>
					<!-- UserAction/LoginForm.jsp를 새창으로 여는데 창이름은 '로그인'이고 가로500세로245으로 크기를 줌 -->
					<a class="dropdown-item"href="UserSignUp.jsp">회원가입</a>
					<a class="dropdown-item" onclick="window.open('UserAction/infoFind.jsp','ID/PW찾기','width=500,height=510')">ID/PW 찾기</a>
				</div>
				<%	}else{ //session이 num인 값이 null이 아니면 로그인된 상태의 창을 보여줌
						if(session.getAttribute("num").equals(0)){//num이 0이면 관리자 계정 이므로 유저관리,게시글작성,로그아웃이 있음
				%>
				<button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("id")+"님환영합니다" %></button>
				<!-- session이 id인 값을 보여줌(로그인한 유저 ID) -->
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" onclick="window.open('UserAction/UserList.jsp','유저 관리','width=500,height=600')">유저관리</a>
					<a class="dropdown-item" onclick="location.href='BoardWrite.jsp'">게시글작성</a>
					<a class="dropdown-item"href="UserAction/Logout.jsp">로그아웃</a>
				</div>
				<%
						}else if(session.getAttribute("num").equals(1)){//num이 1이면 일반 사용자 이므로 정보수정,게시글작성,로그아웃이 있음
				%>
				<button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("id")+"님환영합니다" %></button>
				<!-- session이 id인 값을 보여줌(로그인한 유저 ID) -->
				<div class="dropdown-menu dropdown-menu-right">
					<a class="dropdown-item" onclick="window.open('UserAction/UserInfoChange.jsp','유저정보 변경','width=500,height=510')">정보수정</a>
					<a class="dropdown-item" onclick="location.href='BoardWrite.jsp'">게시글작성</a>
					<a class="dropdown-item" href="UserAction/Logout.jsp">로그아웃</a>
				</div>
				<%
						}
					}
				%>
			</div>
	</nav>
</body>
</html>

