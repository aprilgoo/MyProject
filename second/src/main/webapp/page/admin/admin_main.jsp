<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/page/layout/header.jspf" %>
<h3>관리자 페이지</h3>
${sessionScope.user.user_type} : ${sessionScope.user.user_id }님 환영합니다!<br/>
<a href="/index.jsp">메인 페이지로 이동하기</a>
<a href="/page/user/user_page.jsp">내 정보 보기</a>
<a href="/page/board/sell_list.jsp">판매 게시판</a>
<%@ include file="/page/layout/footer.jspf" %>