<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	String getid=request.getParameter("id");
	int num;
	UserDAO idcheck=new UserDAO();
	num=idcheck.getIdcheck(getid);
		
	if(num==1){
%>
	사용가능한 ID 입니다!
<%
	}else{
%>
	중복된 ID 입니다.
<%
	}
%>
