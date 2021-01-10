<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserInfo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW찾기</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String rrn=request.getParameter("rrn");
	String id=request.getParameter("id");
	
	UserDAO findinfo = new UserDAO();
	List<UserInfo> idrequest=null;
	String pw;
	
	if(name==null){//받아오는 이름이 null이면 pw찾기 null이 아니면 id찾기
		pw = findinfo.getpwFind(id,rrn);//pw값 return
		%>
		<script type="text/javascript">
			alert("<%=id%>님의 PW는 <%=pw%>입니다!");
			history.back();
		</script>
		<%
	}else{
		idrequest = findinfo.getidFind(name,rrn);
		String findid="";
		if(idrequest.size()>0){//받아온값이 0보다 크면 실행
			for(UserInfo info:idrequest){//idrequest반복
				findid=findid+info.getId()+" ";
			}
		}
		%>
	 	<script type="text/javascript">
			alert("<%=name%>님의 ID는 <%=findid%>입니다!");
			history.back();
		</script>
		<%
	}
%>
</body>
</html>