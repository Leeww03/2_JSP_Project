<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지 인코딩 설정
	%>
	<jsp:useBean id="login" class="user.UserInfo"/> <!-- javabean선언 -->
	<jsp:setProperty property="*" name="login"/><!-- Login시 name이 UserInfo와 같은 메소드가있을시 값저장(*은 전체 비교)-->
	<%
		UserDAO logincheck = new UserDAO();//UserDAO 선언
		int num;						   //반환을 받을 num 선언
		num = logincheck.LoginCheck(login);//return받은 값을 num에 저장
		String id = request.getParameter("id");//로그인시 받아온 name값이 id의 값을 저장
		String imgname = login.getImg();//디비에서 setter한 이미지 명을 가져옴
		if(num==0 || num==1){			//num이 0이나 1이면 로그인 성공 아니면 로그인 실패
			session.setAttribute("num", num);//로그인 성공시 session에 num값 저장
			session.setAttribute("id", id); //로그인 성공시 session에 id값 저장
			session.setAttribute("img", imgname);//img저장 디비에서 값이 null이었으면 null저장 값이 있었으면 파일명 저장
	%>
		<!-- 로그인시 새창으로 로그인하는것과 index.jsp에서 바로 로그인하는경우가 다르므로 페이지 확인 -->
		<script type="text/javascript">
			var referrer =  document.referrer;	//이전페이지 URL을 가져옴
			var leftfilename = referrer.substring(referrer.lastIndexOf("/") + 1); //이전페이지 파일명추출(마지막/다음글자부터 끝까지)
			if(leftfilename == "LoginForm.jsp"){//이전 파일 명이 LoginForm.jsp이면 새창이기때문에 창을 닫아야함
				alert("로그인되었습니다!");
				opener.parent.location.reload();//부모창 새로고침
				window.close();//새창 닫기
			}else{								//이전 페이지의 파일명이 LofinForm.jsp가 아니면 index.jsp이기 떄문에 창을 닫는게 아닌 index.jsp로 이동시킴
				alert("로그인되었습니다!");
				location.href="../index.jsp";	//페이지 이동
			}
		</script>			
	<%
		}else{//return받은 num이 0또는1이 아니면 ID또는 PW가 틀린것이므로 ID/PW가 틀렸다고 알려줌
	%>
		<script type="text/javascript">
		var referrer =  document.referrer;		//이전페이지 URL
		var leftfilename = referrer.substring(referrer.lastIndexOf("/") + 1); //이전페이지 파일명추출(마지막/다음글자부터 끝까지)
			if(leftfilename == "LoginForm.jsp"){//이전 파일 명이 LoginForm.jsp이면 새창이기때문에 창을 닫아야함
				alert("ID 또는 PW가 틀렸습니다!");
				history.back();
			}else{								//이전 페이지의 파일명이 LofinForm.jsp가 아니면 index.jsp이기 떄문에 창을 닫는게 아닌 index.jsp로 이동시킴
				alert("ID 또는 PW가 틀렸습니다!");
				location.href="../index.jsp";	//페이지 이동
			}
		</script>
	<%
		}
	%>
</body>
</html>