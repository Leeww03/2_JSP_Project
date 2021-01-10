/*테이블 id board 제목id title,내용 id content*/
/*title은 50byte content는 4000byte*/
/*제목의 id는 title 내용의 id는 content*/
function checkboard(){
	var title = document.getElementById('title').value;//id가 title인 값 가져오기
	var content = document.getElementById('content').value;//id가 content인 값 가져오기
	var byte;//byte수 체크할 byte선언
	if(title.trim()==""||title.trim()==null){//trim으로 좌우 공백 없애고 그값이 있는지체크,제목 확인
		alert("제목을 입력해주세요!");
		return false;
	}else{
		byte=0;//값이 있으면 byte에 0을 주고 byte체크
		for(var i=0;i<title.length;i++){
			if((escape(title.charCodeAt(i))).length>4){byte+=2;}else{byte++;}
		}
		if(byte>50){
			alert("제목이 너무 깁니다!");
			return false;
		}else if(content.trim()==""||content.trim()==null){/*내용 확인*/
			alert("내용을 입렵해주세요!");
			return false;
		}else{
			byte=0;
			for(var j=0;j<content.length;j++){
				if((escape(content.charCodeAt(j))).length>4){byte+=2;}else{byte++;}
			}
			if(byte>4000){
				alert("내용이 너무 많습니다!");
				return false;
			}else{
				var check = confirm("게시글을 등록하시겠습니까?");//최종 확인
				if(check==true){
					return true;
				}else{
					return false;
				}
			}
		}
	}	
}

function BoardDelete(bnum){//게시글 번호를 가져와 게시글 삭제
	var deletecheck=confirm("게시글을 삭제하시겠습니까?");
	if(deletecheck==true){
		location.href='UserAction/boardDelete.jsp?bnum='+bnum;//게시글 삭제를 처리하는 jsp로 게시글 번호를 가지고 이동
		return true;
	}else{
		return false;
	}
}
function searchform(){//검색 기능 제어
	var searchname = document.getElementById('search').value;
	if(searchname==""||searchname==null){
		alert("검색은 한글자 이상부터 가능합니다!");
		return false;
	}else{
		return true;
	}
}