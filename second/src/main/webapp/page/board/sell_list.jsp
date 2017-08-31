  <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/page/layout/header.jspf" %>
</head>
<body>
<h2>Product List</h2>
<form id="frm">
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">상품 번호</th>            
            <th scope="col">상품 종류</th>
            <th scope="col">상품 이름</th>
            <th scope="col">상품 설명</th>
            <th scope="col">상품 가격</th>      
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(map.list) >0}">
                <c:forEach var="row" items="${map.list}">
                    <tr>
                        <td>${row.PRO_NO}</td>                   	  
                        <td>${row.PRO_TYPE}</td>
                        <td>
                        	<a href="#this" name="PRO_NAME">${row.PRO_NAME}</a>        
                        	 <input type="hidden" id="PRO_NO" value=" ${row.PRO_NO}" />                         	
                        </td>                            	                   
                        <td>${row.PRO_DETAIL}</td>
                        <td>${row.PRICE}</td>                
                      </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>                    
    </tbody>
</table>	      
<br />
<a href="#this" id="write">글쓰기</a>
<select name="opt">
	<option value="all" <c:out value="${map.opt == 'all'?'selected':''}" />>전체</option>
	<option value="pro_type" <c:out value="${map.opt == 'pro_type'?'selected':''}" />>상품 종류</option>
	<option value="pro_name" <c:out value="${map.opt == 'pro_name'?'selected':''}" />>상품 이름</option>
	<option value="pro_detail" <c:out value="${map.opt == 'pro_detail'?'selected':''}" />>상품 설명</option>
</select>
<input size=24 name="keyword" value=" ${map.keyword}"> 
<input type="submit" value="검색">
</form>
<%@include file="/page/layout/footer.jspf" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#write").on("click", function(e){ //글쓰기 버튼
		e.preventDefault();
			fn_openSellWrite();				
	});	
	
		$("a[name='PRO_NAME']").on("click", function(e){ //제목
			e.preventDefault();
			fn_openSellDetail($(this));
		});				
		
});

			function fn_openSellWrite() {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/board/openSellWrite.do' />");
				comSubmit.submit();
			}
			
			function fn_openSellDetail(obj){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/board/openSellDetail.do' />");
				comSubmit.addParam("PRO_NO", obj.parent().find("#PRO_NO").val());
				comSubmit.submit();	
			}			
			//제목을 클릭하면 fn_openBoardDetail이라는 함수가 실행됨
			//인자값으로 $(this)를 넘김 <- 게시글 제목의 <a>태그
			//addParam -> 서버로 전송될 키와 값을 인자값으로 받음
			
	


</script>
</body>
</html>

