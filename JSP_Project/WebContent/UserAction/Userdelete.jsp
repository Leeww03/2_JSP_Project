<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
	UserDAO delete = new UserDAO();
	BoardDAO bdelete = new BoardDAO();
	List<Board> blist = null;
	String id=(String)session.getAttribute("id");
	String UserId=request.getParameter("id");
	String imgname2=request.getParameter("img");
	
	if(UserId==null){//받아온 값이 없으면 일반 유저가 계정삭제
		blist = bdelete.getBoardImg(id);//게시글의 img를 받아옴
		delete.UserDelete(id);
		if(session.getAttribute("img")!=null){
			ServletContext context=getServletContext();
			String Folder = context.getRealPath("/img/userimg");
			String filename=(String)session.getAttribute("img");
			File file= new File(Folder+"\\"+filename);
			if(file.exists()){
				file.delete();
			}
		}
		if(blist.size()>0){//게시물에 img가 있으면 실행
			for(Board b:blist){
				String getimg=b.getImg();
				out.print(getimg);
				ServletContext context=getServletContext();
				String Folder = context.getRealPath("/img/boardimg");
				String filename=getimg;
				File file= new File(Folder+"\\"+filename);
				if(file.exists()){
					file.delete();
				}
			}
		}
		session.invalidate();//세션초기화
		%>
		<script type="text/javascript">
			alert("성공적으로 탈퇴처리 되었습니다!");
			window.close();
			opener.parent.location.reload();//창닫고 새로고침
		</script>  
		<%
	}else{//그게아니면 관리자가 유저 삭제
		blist = bdelete.getBoardImg(UserId);//게시글의 img를 받아옴
		delete.UserDelete(UserId);
		String imgname=request.getParameter("img");//유저의 이미지를 받아와 있으면 삭제
		if(imgname!=null){
			ServletContext context=getServletContext();
			String Folder = context.getRealPath("/img/userimg");
			File file= new File(Folder+"\\"+imgname);
			if(file.exists()){
				file.delete();
			}
		}
		if(blist.size()>0){//게시물에 img가 있으면 실행
			for(Board b:blist){
				String getimg=b.getImg();
				out.print(getimg);
				ServletContext context=getServletContext();
				String Folder = context.getRealPath("/img/boardimg");
				String filename=getimg;
				File file= new File(Folder+"\\"+filename);
				if(file.exists()){
					file.delete();
				}
			}
		}
		%>
		<script type="text/javascript">
			alert("성공적으로 탈퇴처리 되었습니다!");
			location = document.referrer;
		</script> 
		<%
		}
		%>
