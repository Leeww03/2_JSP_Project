var idch;//id체크(사용가능 1,사용불가 0)
var pwch;//pw체크(같으면 1,다르면 0)
var id;//중복체크시 id값 저장
var xtp;

function signupcheck(){/* 회원가입 제어 */
	/*회원가입 체크 ID*/
	/*name=20byte,rrn=14byte,id=20byte,pw=20byte,address=50byte,tel=13byte,email=30byte*/
	var sname=document.getElementById('name').value;//입력한 name
	var srrn=document.getElementById('rrn').value;	//입력한 주민등록 번호
	var sid=document.getElementById('id').value;	//입력한 id
	var spw=document.getElementById('pw').value;	//입력한 pw
	var saddress=document.getElementById('address').value;//입력한 주소
	var stel=document.getElementById('tel').value;	//입력한 전화번호
	var semail=document.getElementById('email').value;//입력한 Email
	/*=======================================================================================================================*/
	/*정규식*/
	var reg =/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/; /*특문 체크*/
	var eng=/[A-Za-z]/;/*영어 체크*/
	var kor=/[ㄱ-ㅎㅏ-ㅣ가-힣]/;/*한글 체크*/
	var number=/[0-9]/;/*숫자체크*/
	var blank = /\s/; /*공백체크*/
	var namecheck=/^[ㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;//한글만 가능
	var rrncheck=/[0-9]{6}[-]{1}[1-4]{1}[0-9]{6}/;//000000-(1~4)000000형식
	var idcheck=/[A-Za-z0-9]{4,20}/;//영어,숫자만 가능 4~20글자
	var notid1=/^[0-9]*$/;//id가 숫자만 있으면 안 됨
	//영문은꼭있어야함,특문있으면안됨,(숫자만 있으면 안됨)
	
	var pwcheck=/^[A-Za-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]{4,20}$/; //영어,숫자,특문포함 4~20글자
	//한글 따로 체크바람,(영어,숫자,특문은 꼭있어야함)
	var addresscheck=/^[ㄱ-ㅎㅏ-ㅣ가-힣0-9-\s]{1,50}$/;//주소 한글 숫자만 포함
	//영어 특문체크해야함
	var telcheck=/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/; //000-(0)000-0000 형식
	var emailcheck=/([\w\d]+@[\w\d]+\.[\w\d]{2,6}){1,30}/;//test@test.com 형식 
	//한글있으면X,특문은 @와 .만 허용
	/*=======================================================================================================================*/
	if(sname.trim()==""){/*ID 공백체크*/
		alert("이름을 입력해주세요!");
		return false;
	}else if(!namecheck.test(sname)){/*ID 입력 조건 true여부*/
		alert("이름은 한글 2~10글자만 가능합니다!");
		return false;
	}else if(srrn.trim()==""){/*주민등록번호 공백 여부*/
		alert("주민등록번호를 입력해주세요!");
		return false;
	}else if(!rrncheck.test(srrn)){/*주민등록번호 입력 조건 true여부*/
		alert("주민등록 번호 형식에 맞지않습니다!(000000-(1~4)000000)");
		return false;
	}else if(sid.trim()==""){/*입력한 ID 가 없으면*/
		alert("아이디를 입력해주세요!");
		return false;
	}else if(!idcheck.test(sid)||kor.test(sid)||notid1.test(sid)||reg.test(sid)||blank.test(sid)){/*ID가 영문/숫자가 아니고 한글이 있는경우,숫자만있는경우,특수문자가있는경우,공백여부체크*/
		alert("ID 형식에 맞지 않습니다!(영어/숫자(4~20))/숫자만 포함X");
		return false;
	}else if(idch==null){/*null이면 중복체크를 하지않은 상태*/
		alert("ID중복체크를 해주세요!");
		return false;
	}else if(idch==0){/*0이면 중복된 ID가 있는 상태*/
		alert("중복된 ID입니다!");
		return false;
	}else if(sid!=id){/*중복체크를 눌렀을때 ID와 현제 ID가 다르면 중복체크를 다시해야함*/
		alert("중복체크를 다시해주세요!");
		return false;
	}else if(spw.trim()==""){/*PW 빈칸 체크*/
		alert("PW를 입력해주세요!");
		return false;
	}else if(!pwcheck.test(spw)){/*PW가 (영문/숫자/특문)로 구성되어있는지 체크(3개중 하나로만 만족해도 통과)*/
		alert("PW형식에 맞지 않습니다!(영문/숫자/특문포함 4~20)");
		return false;
	}else if(!eng.test(spw)||!number.test(spw)||!reg.test(spw)){/*영문/숫자/특수문자는 하나씩 들어가야함*/
		alert("PW에는 영어/숫자/특수문자가 하나씩은 포함되어야합니다!");
		return false;
	}else if(pwch!=1){/*pw와 pw재입력의 값으면 1, 1이아니면 입력을 안했거나 pw가 틀림*/
		alert("입력하신 pw가 다릅니다!");
		return false;
	}else if(saddress.trim()==""){/*주소 빈칸 체크*/
		alert("주소를 입력해 주세요!");
		return false;
	}else if(!addresscheck.test(saddress)){/*주소에 한글,숫자 -만 들어감*/
		alert("주소 형식에 맞지 않습니다!")
		return false;
	}else if(stel.trim()==""){/*전화번호 빈칸 체크*/
		alert("전화번호를 입력해주세요!");
		return false;
	}else if(!telcheck.test(stel)){/*000-(0)000-0000형식에 맞는지 체크*/
		alert("전화번호 형식에 맞지않습니다!(000-(0)000-0000)");
		return false;
	}else if(semail.trim()==""){/*Email공백체크*/
		alert("Email을 입력해주세요!");
		return false;
	}else if(!emailcheck.test(semail)){//?
		alert("Email형식에 맞지않습니다!(ex:test@test.com)");
		return false;
	}else{
		var clearcheck=confirm("회원가입을 진행하시겠습니까?");
		if(clearcheck==true){
			return true;
		}else{
			return false;
		}
	}
}
function infochange(){/*회원 정보 변경*/
	/*회원가입 체크 ID*/
	/*name=20byte,rrn=14byte,id=20byte,pw=20byte,address=50byte,tel=13byte,email=30byte*/
	var sid=document.getElementById('id').value;	//입력한 id
	var spw=document.getElementById('pw').value;	//입력한 pw
	var saddress=document.getElementById('address').value;//입력한 주소
	var stel=document.getElementById('tel').value;	//입력한 전화번호
	var semail=document.getElementById('email').value;//입력한 Email
	/*=======================================================================================================================*/
	/*정규식*/
	var reg =/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/; /*특문 체크*/
	var eng=/[A-Za-z]/;/*영어 체크*/
	var kor=/[ㄱ-ㅎㅏ-ㅣ가-힣]/;/*한글 체크*/
	var number=/[0-9]/;/*숫자체크*/
	var blank = /\s/; /*공백체크*/
	var idcheck=/[A-Za-z0-9]{4,20}/;//영어,숫자만 가능 4~20글자
	var notid1=/^[0-9]*$/;//id가 숫자만 있으면 안 됨
	//영문은꼭있어야함,특문있으면안됨,(숫자만 있으면 안됨)
	
	var pwcheck=/^[A-Za-z0-9\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]{4,20}$/; //영어,숫자,특문포함 4~20글자
	//한글 따로 체크바람,(영어,숫자,특문은 꼭있어야함)
	var addresscheck=/^[ㄱ-ㅎㅏ-ㅣ가-힣0-9-\s]{1,50}$/;//주소 한글 숫자만 포함
	//영어 특문체크해야함
	var telcheck=/^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/; //000-(0)000-0000 형식
	var emailcheck=/([\w\d]+@[\w\d]+\.[\w\d]{2,6}){1,30}/;//test@test.com 형식 
	//한글있으면X,특문은 @와 .만 허용
	/*=======================================================================================================================*/
	if(sid.trim()!=""){/*입력한 ID 가 없으면*/
		if(!idcheck.test(sid)||kor.test(sid)||notid1.test(sid)||reg.test(sid)||blank.test(sid)){/*ID가 영문/숫자가 아니고 한글이 있는경우,숫자만있는경우,특수문자가있는경우,공백여부체크*/
			alert("ID 형식에 맞지 않습니다!(영어/숫자(4~20))/숫자만 포함X");
			return false;
		}else if(idch==null){/*null이면 중복체크를 하지않은 상태*/
			alert("ID중복체크를 해주세요!");
			return false;
		}else if(idch==0){/*0이면 중복된 ID가 있는 상태*/
			alert("중복된 ID입니다!");
			return false;
		}else if(sid!=id){/*중복체크를 눌렀을때 ID와 현제 ID가 다르면 중복체크를 다시해야함*/
			alert("중복체크를 다시해주세요!");
			return false;
		}
	}
	if(spw.trim()!=""){/*PW 빈칸 체크*/
		if(!pwcheck.test(spw)){/*PW가 (영문/숫자/특문)로 구성되어있는지 체크(3개중 하나로만 만족해도 통과)*/
			alert("PW형식에 맞지 않습니다!(영문/숫자/특문포함 4~20)");
			return false;
		}else if(!eng.test(spw)||!number.test(spw)||!reg.test(spw)){/*영문/숫자/특수문자는 하나씩 들어가야함*/
			alert("PW에는 영어/숫자/특수문자가 하나씩은 포함되어야합니다!");
			return false;
		}else if(pwch!=1){/*pw와 pw재입력의 값으면 1, 1이아니면 입력을 안했거나 pw가 틀림*/
			alert("입력하신 pw가 다릅니다!");
			return false;
		}
	}
	if(saddress.trim()!=""){/*주소 빈칸 체크*/
		if(!addresscheck.test(saddress)){/*주소에 한글,숫자 -만 들어감*/
			alert("주소 형식에 맞지 않습니다!")
			return false;
		}
	}
	if(stel!=""){/*전화번호 빈칸 체크*/
		if(!telcheck.test(stel)){/*000-(0)000-0000형식에 맞는지 체크*/
			alert("전화번호 형식에 맞지않습니다!(000-(0)000-0000)");
			return false;
		}
	}
	if(semail!=""){/*Email공백체크*/
		if(!emailcheck.test(semail)){//test@test.com(net/kr등)형식에 맞는지 체크
			alert("Email형식에 맞지않습니다!(ex:test@test.com)");
			return false;
		}
	}
		var clearcheck=confirm("회원정보를 수정하시겠습니까?");
		if(clearcheck==true){
			return true;
		}else{
			return false;
		}
	
}
function idcheck(URL){
	id=document.getElementById('id').value;//중복버튼 눌렀을떄 입력한 ID
	URL = URL + "?id="+id;
	xtp=new XMLHttpRequest();//XMLHttpRequest 객체 얻어옴
	xtp.onreadystatechange=responseId;//콜백 함수 등록
	xtp.open("GET",URL,true);//GET방식으로 URL을 비동기 방식으로 연결
	xtp.send();//전송
}
function responseId(){
	if(xtp.readyState == 4 ){ //완료(4는 데이터를 전부 받은 상태)
		if(xtp.status==200){//오류없이OK일때(200은 요청 성공)
			var str = xtp.responseText;//요청받은 내용 받기
			if(str.trim() == "중복된 ID 입니다."){
				idch=0;
				document.getElementById("idcheck").style.color='red';
			}else if(str.trim() == "사용가능한 ID 입니다!"){
				idch=1;
				document.getElementById("idcheck").style.color='green';
			}
			document.getElementById("idcheck").innerHTML = str;
		}else{
			alert("Error");
		}
	}
} 
 function pwcheck(){//입력한 pw가 같은지 체크
 	var pw=document.userin.pw.value;
 	var rpw=document.userin.rpw.value;
 	if(pw==rpw){//pw와 rpw가 같으면
 		document.getElementById("pwmessage").innerHTML="비밀번호가 일치합니다.";//id가 pwmessage의 value를 변경
 		document.getElementById("pwmessage").style.color='green';		  //id가 pwmessage의 글자색 변경
 		pwch=1;//pwch에 값 1
 	}else{
 		document.getElementById("pwmessage").innerHTML="비밀번호가 일치하지않습니다!";
 		document.getElementById("pwmessage").style.color='red';
 		pwch=0;//pwch에 값 0
 	}
 }
function lookpw(){//pw입력창 pw확인(입력한 pw확인)
 	var pw=document.getElementById("pw");
 	var rpw=document.getElementById("rpw");
 	if(pw.type=="password"&&rpw.type=="password"){//pw와rpw의 type이 password면
 		pw.type="text";	rpw.type="text";		  //pw와rpw의 type을 text로 변경
 	}else{
 		pw.type="password"; rpw.type="password";  //pw와 rpw가 password가 아니면 password로 변경
 	}
 } 
function idfind(){//id찾기
	var findname=document.findform.name.value;
	var findrrn=document.findform.rrn.value;
	if(findname==""||findname==null){
		alert("이름을 입력해주세요!");
		return false;
	}else if(findrrn==""||findrrn==null){
		alert("주민등록 번호를 입력해주세요!");
		return false;
	}else{
		return true;
	}
}
function pwfind(){//pw찾기
	var findid=document.findform2.id.value;
	var findrrn=document.findform2.rrn.value;
	if(findid==""||findid==null){
		alert("ID를 입력해주세요!");
		return false;
	}else if(findrrn==""||findrrn==null){
		alert("주민등록 번호를 입력해주세요!");
		return false;
	}else{
		return true;
	}
}