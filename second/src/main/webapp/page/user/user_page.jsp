<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<h3>내 정보</h3>
등급 : ${sessionScope.user.user_type}

아이디 : ${sessionScope.user.user_id }<br/>
닉네임 : ${sessionScope.user.user_name }<br/>
이메일 : ${sessionScope.user.email }<br/>
전화번호 : ${sessionScope.user.phone }<br/>
주소 : ${sessionScope.user.address }<br/>

<a href="#this" id="modify">내 정보 수정하기</a>
<a href="#this" id="drop">탈퇴하기</a>

<script type="text/javascript">
	$(document).ready(function(){
		$("#modify").on("click", function(e){
			e.preventDefault();
			fn_openUserModify();			
		});		
	});
	
	$(document).ready(function(){
		$("#drop").on("click", function(e){
			e.preventDefault();
			fn_openUserDrop();			
		});		
	});
	
	function fn_openUserModify(){
		var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/user/openUserModify.do' />");
        comSubmit.submit();		
	}
	
	function fn_openUserDrop(){
		var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/user/openUserDrop.do' />");
        comSubmit.submit();		
	}

</script>

