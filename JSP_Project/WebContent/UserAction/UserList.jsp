<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserInfo"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 목록</title>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"><!-- favicon -->
<link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../Bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="../Bootstrap/js/popper.js"></script>
<script src="../Bootstrap/js/bootstrap.min.js"></script>
</head>
<body id="userbody">
	<%
		UserDAO ulist=new UserDAO();
		int cnt = ulist.getcnt();//전체유저목록 갯수 가져옴
		int usercnt=10;//화면에 보여지는 유저 수
		String pNum = request.getParameter("pageNum");//페이지 번호를 받아옴
		if(pNum == null){//페이지번호가 null이면 1을 준다.(처음 이jsp파일이 켜지면 pageNum을 받지않아 null이기 때문)
			pNum="1";
		} 
		int viewPage = Integer.parseInt(pNum);//현제페이지
		int str = (viewPage - 1) * usercnt +1;//시작행 번호
		int end = viewPage * usercnt;//마지막행 번호
		List<UserInfo> list=null; 
		list = ulist.getUserInfoList(str,end);//getUserInfoList
	%>
	<%if(session.getAttribute("num").equals(0)){%><!-- 관리자가 아니면 화면을 보여주지 않고 경고창을 띄우고 이전페이지로 이동 -->
	<table border="1" class="table table-dark table-striped" id="userList"> 
    <thead>
      <tr>
        <th>이름</th>
        <th>ID</th>
        <th>성별</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      	<%
      		if(list.size() > 0){//유저가 있으면
      			for(UserInfo ui : list){
        %>
        <tr>
        	<td><%=ui.getName()%></td>
        	<td><%=ui.getId()%></td>
        	<td><%=ui.getGender()%></td>
        	<td><a href="Userdelete.jsp?id=<%=ui.getId()%>&img=<%=ui.getImg()%>">[삭제]</a></td>
        </tr>
        <%
      			}
      		}else{//유저가 없으면
        %>
        <tr>
        	<td colspan="4">등록된 유저 없음</td>
        </tr>
        <%
      		}
        %>
    </tbody>
  </table>
	<%
  	if(cnt>0){
  		int pagecnt = cnt/usercnt + (cnt % usercnt == 0 ? 0 : 1);
  		int pageList = 5;//하단부 페이지 숫자
  		int strpage = ((viewPage/pageList)-(viewPage % pageList == 0 ? 1 : 0))* pageList +1;
  		int endpage = strpage + pageList-1;
		if(endpage>pagecnt){
			endpage = pagecnt;			
		}  		
	%>
	<%
		if(strpage>pageList){
	%>
	<a href="UserList.jsp?pageNum=<%=endpage - pageList %>">[이전]</a>
	<%
		}
		for(int i=strpage;i<=endpage;i++){
			if(i==viewPage)	{
	%>
	<b>[<%=i %>]</b>
	<%		}else{%>
	<a href="UserList.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
			}
		}
		if(endpage < pagecnt){
	%>
	<a href="UserList.jsp?pageNum=<%=strpage+pageList%>">[다음]</a>	
	<%
		}
	} 
	%>
	<%
	}else{ 
	%>
	<script>
		alert("권한이 없습니다!");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>