/*댓글 관련 javascript TABLE에 댓글은 100byte*/
function Comment(){/*댓글 작성및 수정*/
	var comment = document.getElementById('comment').value;//댓글 내용을 가져옴
	var commenttrim = comment.trim();//댓글 내용 좌우 공백 제거
	var byte;//byte수 체크할 byte선언
	if(comment==""||comment==null||commenttrim ==""||commenttrim ==null){//내용이 없으면 return false
		alert("댓글을 입력해주세요!");
		return false;
	}else{//값이 있으면 byte에 0을 주고 byte체크
		byte=0;
		for(var i=0;i<commenttrim.length;i++){//내용의 길이만큼 byte 체크
			if(escape(commenttrim.charCodeAt(i)).length>4){//한글이면 +2 한글이아니면 +1
				byte+=2;
			}else{
				byte++;
			}
		}
		if(byte>100){//byte가 100보다크면 내용이 많다고 alert
			alert("댓글이 너무 많습니다!");
			return false;
		}else{
			var rs = confirm("댓글을 등록하시겠습니까?");//모든 조건이 맞으면 최종 등록 여부를 물어봄 확인이면 true 취소면 false
			if(rs==true){
				return true;
			}else{
				return false;
			}
		}
	}
}
function CommentDelete(){/*댓글 삭제*/
	var check = confirm("정말로 삭제하시겠습니까?");
	if(check==true){
		return true;
	}else{
		return false;
	}
}