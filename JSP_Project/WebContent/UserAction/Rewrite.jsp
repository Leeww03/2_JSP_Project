<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String num = request.getParameter("bnum");
	BoardDAO bdao = new BoardDAO();
	Board b=bdao.getViewList(num);
	String imgname=b.getImg();
	String enctype="utf-8";		//인코딩언어 선언
	int maxSize = 10*1024*1024; //10MB
	ServletContext context=getServletContext();
	String Folder = context.getRealPath("img/boardimg");
	/*"저장경로(.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_Project\img)안에 boardimg폴더"*/
	try{
		MultipartRequest multi=null;
		multi = new MultipartRequest(request,Folder,maxSize,enctype,new DefaultFileRenamePolicy());
		//파일 업로드 new DefaultFileRenamePolicy()는 중복된 이름이 있을시 이름변경해줌
			Enumeration<?> file=multi.getFileNames();//form요소중 input태그에 file속성인 name값을 Enumeration객체 타입으로 반환
			String gettitle=multi.getParameter("title");
			String getcontent=multi.getParameter("content");
			b.setTitle(gettitle);//입력한 title을 setter
			b.setContent(getcontent);//입력한 content를 setter
			String getimg=null; 
			if(file.hasMoreElements()){							//데이터 유무확인
				String name=(String)file.nextElement();			//file의 name값을 받아옴
				String filename = multi.getFilesystemName(name);//저장된 파일 이름
				if(filename!=null){//filename이 null이 아니면 이미지를 업로드한것이므로  setter
					getimg = filename;					
					b.setImg(getimg);
				}
			}
			if(getimg!=null){//img가 null이 아니면 이미지를 새로 바꾸는것이기 때문에 이전에 이미지를  filename으로 가져와 삭제
				String filenames=imgname;
				File files= new File(Folder+"\\"+filenames);
				if(files.exists()){
					files.delete();
				}
			}
			bdao.updateBoard(b); //쿼리문 실행
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script type="text/javascript">
	alert("성공적으로 변경되었습니다!");
	location.href="../index.jsp";
</script>