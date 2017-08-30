<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(session.getAttribute("user")!=null) {
		session.removeAttribute("user");
	}
	else if(session.getAttribute("admin")!=null)  {
		session.removeAttribute("admin");
	}

%>
<script>
		alert("성공적으로 로그아웃 되었습니다");
</script>

<%
	response.sendRedirect("/index.jsp");
%>


