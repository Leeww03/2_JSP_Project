<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserInfo" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="userchange" class="user.UserInfo"/> <!-- 자바빈 선언 -->
	<%
		UserDAO change=new UserDAO();	//UserDAO 선언
		String id=(String)session.getAttribute("id");
		List<UserInfo> myinfo=null; 
		myinfo = change.userInfo(id);
		
		String enctype="utf-8";		//인코딩언어 선언
		int maxSize = 10*1024*1024; //10MB
		ServletContext context=getServletContext();
		String Folder = context.getRealPath("img/userimg");
		/*"저장경로(.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_Project\img)안에 userimg폴더"*/
		try{
			MultipartRequest multi=null;
			multi = new MultipartRequest(request,Folder,maxSize,enctype,new DefaultFileRenamePolicy());
			//파일 업로드 new DefaultFileRenamePolicy()는 중복된 이름이 있을시 이름변경해줌
				Enumeration<?> file=multi.getFileNames();//form요소중 input태그에 file속성인 name값을 Enumeration객체 타입으로 반환
				UserInfo uinfo = new UserInfo();
				if(myinfo.size()>0){
					for(UserInfo in : myinfo){
						/*가져온 갑들을 UserInfo에 setter해줌*/
						uinfo.setId(in.getId());
						uinfo.setPw(in.getPw());
						uinfo.setAddress(in.getAddress());
						uinfo.setTel(in.getTel());
						uinfo.setEmail(in.getEmail());
						uinfo.setImg(in.getImg());
						/*이전페이지에서 입력한 값들을 변수에 넣어줌*/
						String getid=multi.getParameter("id");
						String getpw=multi.getParameter("pw");
						String getaddress=multi.getParameter("address");
						String gettel=multi.getParameter("tel");
						String getemail=multi.getParameter("email");
						String getimg=null; 
						if(file.hasMoreElements()){							//데이터 유무확인
							String name=(String)file.nextElement();			//file의 name값을 받아옴
							String filename = multi.getFilesystemName(name);//저장된 파일 이름
							if(filename!=null){
								getimg = filename;					//UserSignUp.jsp에 filename setter
							}
						}
						if(getid.length()!=0){//ID의 길이가 0아 아니면 입력한것이므로 이전 session을 삭제 후 session을 다시 생성
							session.removeAttribute("id");//id세션삭제
							session.setAttribute("id",getid);//id세션 생성
						}
						 if(getimg!=null){//img가 null이 아니면 이미지를 새로 바꾸는것이기 때문에 이전에 session에 들어있던 filename을 가져와 삭제후 기존 img session을 제거후 다시 생성
							String filenames=(String)session.getAttribute("img");
							File files= new File(Folder+"\\"+filenames);
							if(files.exists()){
								files.delete();
							}
							session.removeAttribute("img");
							session.setAttribute("img", getimg);//img세션 생성
						} 
						change.userUpdate(uinfo,getid,getpw,getaddress,gettel,getemail,getimg);
					}
				}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
 	<script type="text/javascript">
		alert("변경완료");
		opener.parent.location.reload();
		window.close();
	</script> 
</body>
</html>