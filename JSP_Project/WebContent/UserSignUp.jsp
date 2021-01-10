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
<script src="javascript/User.js"></script>
</head>
<body id="bodybg">
	<jsp:include page="Header.jsp" flush="false" /><!-- header -->
	<jsp:include page="navbar.jsp" flush="false" /><!-- navbar -->
	<div class="container-fluid" >
    <div class="row" id="bmain">
    <jsp:include page="L_Side.jsp" flush="false" /><!-- L-side -->
        <div id="MenuBoard">
        	<form action="UserAction/SignUpAction.jsp" method="POST" enctype="multipart/form-data" name="userin" id="userin">
        	<!-- 이미지를 업로드해야하기때문에 form에 enctype="multipart/form-data"추가-->
        		<label>이름</label>
        		<input type="text" class="form-control" name="name" id="name" placeholder="이름은 한글 2~10글자만 가능합니다!">
        		
        		<label>주민등록 번호 </label>
        		<input type="text" class="form-control" name="rrn" id="rrn" maxlength="14" placeholder="000000-(1~4)000000형식에 맞춰주세요">
        		<div id="rrncheck"></div>
        		
        		<label>ID </label>
        		<input type="text" class="form-control" name="id" id="id" placeholder="영어/숫자(4~20))/숫자로만 구성되면 안됩니다!">
        		<button type="button" class="btn btn-primary" onclick="idcheck('UserAction/idcheck.jsp')">중복체크</button><div id="idcheck"></div>
        		
        		<label>PW </label>
        		<input type="password" class="form-control" name="pw" id="pw" onchange="pwcheck()" placeholder="영문/숫자/특문포함 4~20">
        		
        		<label>PW확인 </label>
        		<input type="password" class="form-control" name="rpw" id="rpw" onchange="pwcheck()">
        		<div id="pwmessage"></div>
        		<input type="checkbox" onclick="lookpw()">Password 보기<br>
        		
        		<label>성별 </label><br>
        		<label class="radio-inline"><input type="radio" name="gender" value="남자" checked="checked">남자</label>
				<label class="radio-inline"><input type="radio" name="gender" value="여자">여자</label><br>
				
        		<label>주소 </label>
        		<input type="text" class="form-control" name="address" id="address" placeholder="한글과 숫자 1~50글자 사이">
        		
        		<label>전화번호 </label>
        		<input type="text" class="form-control" name="tel" id="tel" placeholder="전화번호는 000-(0)000-0000">
        		
        		<label>E-mail </label>
        		<input type="text" class="form-control" name="email" id="email" placeholder="ex:test@test.com">
        		
        		<label>이미지 파일 (필수X)</label><br>
        		<input type="file" accept="image/*" name="img" ><br><br>
        		
        		<button type="submit" class="btn btn-primary" onclick="return signupcheck()">회원가입</button> 
        	</form>
        </div>
    </div>
</div>
	<jsp:include page="footer.jsp" flush="false" /><!-- footer -->
</body>
</html>

