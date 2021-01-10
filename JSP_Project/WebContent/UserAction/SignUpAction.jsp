<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %><!-- 한글깨짐방지 -->
	<jsp:useBean id="signup" class="user.UserInfo"/> <!-- 자바빈 선언 -->
	<%
		UserDAO sign=new UserDAO();	//UserDAO 선언
		String enctype="utf-8";		//인코딩언어 선언
		int maxSize = 10*1024*1024; //10MB
		ServletContext context=getServletContext();
		String Folder = context.getRealPath("img/userimg");
		/*"저장경로(.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_Project\img)안에 userimg폴더"*/
		try{
			MultipartRequest multi=null;
			multi = new MultipartRequest(request,Folder,maxSize,enctype,new DefaultFileRenamePolicy());
			//파일 업로드 new DefaultFileRenamePolicy()는 중복된 이름이 있을시 이름변경해줌
			Enumeration<?> file=multi.getFileNames();			//form요소중 input태그에 file속성인 name값을 Enumeration객체 타입으로 반환
			if(file.hasMoreElements()){							//데이터 유무확인
				String name=(String)file.nextElement();			//file의 name값을 받아옴
				String filename = multi.getFilesystemName(name);//저장된 파일 이름
				signup.setImg(filename);					//UserSignUp.jsp에 filename setter
			}
			signup.setName(multi.getParameter("name"));		//UserSignUp.jsp에서 입력한 name
			signup.setRrn(multi.getParameter("rrn"));		//UserSignUp.jsp에서 입력한 rrn
			signup.setId(multi.getParameter("id"));			//UserSignUp.jsp에서 입력한 id
			signup.setPw(multi.getParameter("pw"));			//UserSignUp.jsp에서 입력한 pw
			signup.setGender(multi.getParameter("gender"));	//UserSignUp.jsp에서 입력한 gender
			signup.setAddress(multi.getParameter("address"));//UserSignUp.jsp에서 입력한 address
			signup.setTel(multi.getParameter("tel"));		//UserSignUp.jsp에서 입력한 tel
			signup.setEmail(multi.getParameter("email"));	//UserSignUp.jsp에서 입력한 email
			sign.SignUp(signup);		//UserDAO의 SignUp호출
		}catch(Exception e){
			e.printStackTrace();
		}
	%>		
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다!");
			location.href="../index.jsp";//indes.jsp로 이동
		</script>
</body>
</html>