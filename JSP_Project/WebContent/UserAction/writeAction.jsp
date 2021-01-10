<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="board" class="board.Board"/>
<%
	BoardDAO b=new BoardDAO();	//UserDAO 선언
	String id=(String)session.getAttribute("id");
	String enctype="utf-8";		//인코딩언어 선언
	int maxSize = 10*1024*1024; //10MB
	ServletContext context=getServletContext();
	String Folder = context.getRealPath("img/boardimg");
	/*"저장경로(.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_Project\img)안에 boardimg폴더"*/
	try{
		MultipartRequest multi=null;
		multi = new MultipartRequest(request,Folder,maxSize,enctype,new DefaultFileRenamePolicy());
		//파일 업로드 new DefaultFileRenamePolicy()는 중복된 이름이 있을시 이름변경해줌
		Enumeration<?> file=multi.getFileNames();			//form요소중 input태그에 file속성인 name값을 Enumeration객체 타입으로 반환
		if(file.hasMoreElements()){							//데이터 유무확인
			String name=(String)file.nextElement();			//file의 name값을 받아옴
			String filename = multi.getFilesystemName(name);//저장된 파일 이름
			board.setImg(filename);					//BoardWrite.jsp에 filename setter
		} 
		board.setBid(id);
		board.setTitle(multi.getParameter("title"));
		board.setTag(multi.getParameter("tag"));
		board.setContent(multi.getParameter("content"));
		b.write(board);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script type="text/javascript">
	alert("글작성이 완료 되었습니다!");
	location.href="../index.jsp";
</script>