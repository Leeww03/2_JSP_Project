<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="javascript/Board.js"></script>
</head>
<body id="bodybg">
	<%if(session.getAttribute("num")==null){ %>
		<script type="text/javascript">
			alert("로그인 후 이용해주세요");
			location.href="index.jsp";
		</script>
	<%}else{ %>
	<jsp:include page="Header.jsp" flush="false" /><!-- header -->
	<jsp:include page="navbar.jsp" flush="false" /><!-- navbar -->
	<div class="container-fluid" style="">
    <div class="row" id="bmain">
    <jsp:include page="L_Side.jsp" flush="false" /><!-- L-side -->
        <div id="MenuBoard">
        	<form action="UserAction/writeAction.jsp" method="POST" enctype="multipart/form-data" id="board">
        		<table border="1" class="table table-striped" id="Writetable">
        			<tr>
        				<th colspan="2">게시글 작성</th>
        			</tr>
        			<tr>
        				<td>제목</td>
        				<td><input type="text" class="form-control" name="title" id="title"></td>
        			</tr>
        			<tr>
        				<td>태그</td>
        				<td>
        					<select name="tag">
        						<%if(session.getAttribute("num").equals(0)) {%>
        						<option value="공지">공지사항</option>
        						<%}else{ %>
        						<option value="자유">자유게시판</option>
        						<option value="공포">공포영화</option>
        						<option value="액션">액션영화</option>
        						<option value="코미디">코미디영화</option>
        						<option value="전쟁">전쟁영화</option>
        						<option value="스포츠">스포츠영화</option>
        						<option value="범죄/스릴러">범죄/스릴러영화</option>
        						<option value="로멘스">로멘스영화</option>
        						<option value="SF/판타지">SF/판타지영화</option>
        						<%} %>
        					</select>
        				</td>
        			</tr>
        			<tr>
        				<td>내용</td>
        				<td><textarea name="content" id="content"></textarea></td>
        			</tr>
        			<tr>
        				<td>이미지</td>
        				<td><input type="file" accept="image/*" name="img"></td>
        			</tr>
        		</table>
        		<input type="submit" class="btn btn-primary" id="writebtn" value="게시글 작성" onclick="return checkboard()">
        	</form>
        </div>
    </div>
</div>
	<jsp:include page="footer.jsp" flush="false" /><!-- footer -->
	<%} %>
</body>
</html>

