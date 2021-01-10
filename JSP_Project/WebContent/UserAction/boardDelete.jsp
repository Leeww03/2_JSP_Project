<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.*" %>
<%
	String num = request.getParameter("bnum");
	BoardDAO bdao = new BoardDAO();
	String imgname = bdao.getimg(num);
	ServletContext context=getServletContext();
	String Folder = context.getRealPath("img/boardimg");
	bdao.deleteBoard(num); 
	
	if(imgname!=null){//img가 null이 아니면 이미지를 새로 바꾸는것이기 때문에 이전에 이미지를  filename으로 가져와 삭제
		String filenames=imgname;
		File files= new File(Folder+"\\"+filenames);
		if(files.exists()){
			files.delete();
		}
	}
%>
<script type="text/javascript">
	alert("게시글이 삭제되었습니다!");
	location.href="../index.jsp";
</script>