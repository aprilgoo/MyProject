<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<html>
<head>
</head>
<body>
	<form id="frm" name="frm">
		<table class="join_list">
		<caption>회원 가입 폼</caption>
		<tbody>
			<tr>
				<th scope="row">회원 타입</th>
				<td><input type="text" name="user_type"></input></td>
			</tr>	
			<tr>
				<th scope="row">아이디</th>
				<td><input type="text" name="user_id" ></input></td>
			</tr>	
			<tr>
				<th scope="row">비밀번호</th>
				<td><input type="password" name="user_password"></input></td>
			</tr>	
			<tr>
				<th scope="row">이름</th>
				<td><input type="text" name="user_name" ></input></td>
			</tr>	
			<tr>
				<th scope="row">생일</th>
				<td><input type="text" name="birth" ></input></td>
			</tr>
			<tr>
				<th scope="row">성별</th>
				<td><input type="text" name="gender" ></input></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><input type="text" name="email" ></input></td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td><input type="text" name="phone"></input></td>
			</tr>
			<tr>
				<th scope="row">주소</th>
				<td><input type="text" name="address"></input></td>			
			</tr>					
		</tbody>		
		</table>		
	
	 <a href="#this" id="join">가입하기</a>
	</form>
<script type="text/javascript">
        $(document).ready(function(){                  
            $("#join").on("click", function(e){
                e.preventDefault();
                fn_insertJoinForm();
            });
        });
         
        function fn_insertJoinForm(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/join/insertJoinForm.do' />");
            comSubmit.submit();
        } 
    </script>
</body>
</html>