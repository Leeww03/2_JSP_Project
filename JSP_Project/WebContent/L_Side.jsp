<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>L-Side</title>
<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/mediaquery.css">
<link rel="stylesheet" href="css/main.css">
<script src="Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="Bootstrap/js/popper.js"></script>
<script src="Bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="LoginForm" style="height:100%">
		<div class="jumbotron" id="main">
		<%
			if(session.getAttribute("num")==null){//session이 num의 값이 null이면 로그인한 상태가 아니므로 로그인창을 보여줌
		%>
	 		<form method="POST" action="UserAction/LoginAction.jsp">
					<div class="form-group">
						<label>ID</label> <input type="text" class="form-control"placeholder="ID" name="id">
						<label>Password</label> <input type="password" class="form-control" placeholder="Password" name="pw">
					</div>
					<div id="loginbtn">
						<button type="submit" class="btn btn-primary">로그인</button>
						<button class="btn btn-primary" type="button" onclick="location.href='UserSignUp.jsp'">회원가입</button>
						<button class="btn btn-primary" type="button" onclick="window.open('UserAction/infoFind.jsp','ID/PW찾기','width=500,height=510')">ID/PW 찾기</button>
					</div>
			</form>
		<%	}else{//session이 num인 값이 null이 아니면 로그인 상태이므로 num값이 0인지1인지를 확인해 서로 보여주는게 달라야함(0은 관리자,1은 일반 유저)
				if(session.getAttribute("num").equals(0)){
		%>			
					<div id="loginmain">
						<div>
							<img src="img/userimg/<%=session.getAttribute("img")%>" width="150" height="150" onerror="this.src='img/userimg/임시.PNG'">
							<!-- session에 저장해둔 img는 디비에서 가져온 img파일명 파일이 없으면 null이므로 찾을수없음.(onerror으로 대체사진) -->
						</div>
						<div style="padding-top:50px;">
							<label><%=session.getAttribute("id")+"님" %></label><br>
							<label>환영합니다!</label>
							<button class="btn btn-primary" type="button" onclick="location.href='BoardWrite.jsp'">게시글작성</button>
						</div>
					</div>
					<div id="loginbtn">
						<button class="btn btn-primary" type="button" onclick="window.open('UserAction/UserList.jsp','유저 관리','width=451,height=600')">유저관리</button>
						<button class="btn btn-primary" type="button" onclick="window.open('UserAction/UserInfoView.jsp','유저정보 확인','width=450,height=617')">정보확인</button>
						<button class="btn btn-primary" type="button" onclick="location.href='UserAction/Logout.jsp'">로그아웃</button>
					</div>
		<%
				}else if(session.getAttribute("num").equals(1)){
		%>			
					<div id="loginmain">
						<div>
							<img src="img/userimg/<%=session.getAttribute("img")%>" width="150" height="150" onerror="this.src='img/userimg/대체이미지.png'">
							<!-- session에 저장해둔 img는 디비에서 가져온 img파일명 파일이 없으면 null이므로 찾을수없음.(onerror으로 대체사진) -->
						</div>
						<div>
							<label><%=session.getAttribute("id")+"님" %></label><br>
							<label>환영합니다!</label>
							<button class="btn btn-primary" type="button" onclick="location.href='BoardWrite.jsp'">게시글작성</button>
						</div>
					</div>
					<div id="loginbtn">
						<button class="btn btn-primary" type="button" onclick="window.open('UserAction/UserInfoView.jsp','유저정보 확인','width=450,height=617')">정보확인</button>
						<button class="btn btn-primary" type="button" onclick="window.open('UserAction/UserInfoChange.jsp','유저정보 변경','width=500,height=660')">정보수정</button>
						<button class="btn btn-primary" type="button" onclick="location.href='UserAction/Logout.jsp'">로그아웃</button>
					</div>
		<%
				}
			}
		%>
		</div>
		<div>
			<table class="table" id="leftsideboardlist">
				<tr><th>게시판 목록</th></tr>
				<tr><td><a href="BoardList.jsp">전체 게시판</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=자유">자유게시판</a></td></tr>
				<tr><th>장르별 게시판</th></tr>
				<tr><td><a href="tagBoard.jsp?tag=공포">공포 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=액션">액션 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=코미디">코미디 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=전쟁">전쟁 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=스포츠">스포츠 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=범죄/스릴러">범죄/스릴러 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=로멘스">로멘스 영화</a></td></tr>
				<tr><td><a href="tagBoard.jsp?tag=SF/판타지">SF/판타지 영화</a></td></tr>
			</table>
		</div>
	</div>
</body>
</html>