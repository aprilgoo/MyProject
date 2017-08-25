<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="ko">

<html>
<%@ include file="/page/layout/header.jspf" %>
<form action="/user/openLoginSession.do" method="post" id="frm" name="frm">
    사용자 아이디 : <input type="text" name="user_id" />
    사용자 비밀번호 : <input type="password" name="user_password" /> 
<a href="#this" id="login">로그인</a>
<a href="/page/join/joinPage.jsp" id="join">회원가입</a>
</form>
<script type="text/javascript">
        $(document).ready(function(){                  
            $("#login").on("click", function(e){
                e.preventDefault();
                fn_UserLogin();
            });
        });
         
        function fn_UserLogin(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/user/openLoginSession.do' />");
            comSubmit.submit();
        } 
    </script>
</html>