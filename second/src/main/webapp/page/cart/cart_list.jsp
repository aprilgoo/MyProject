<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/page/layout/header.jspf" %>
</head>
<body>
	<form id="frm" name="frm" method="post">
		<tr>
			<th scope=row>${sessionScope.user.user_id} 님의 장바구니</th>		
		</tr>
		<table>
		<colgroup>
	        <col width="10%"/>
	        <col width="*"/>
	        <col width="15%"/>
	        <col width="20%"/>
 	   </colgroup>
 	   <rowgroup>
 	   		<row width="10%"/>
 	   		<row width="*"/>
 	   		<row width="10%"/>
 	   		<row width="10%"/>
 	   </rowgroup>
    <thead>
    	<tr>
	    	<th scope="col">카트 번호</th>
	    	<th scope="col">물품 이름</th>
	    	<th scope="col">물품 갯수</th>
	    	<th scope="col">상품 제거 </th>	    	
	    </tr>	    		
    </thead>    
    <tbody>   	  
    	<c:choose>
    		<c:when test="${fn:length(map.list) >0}">
    		<c:forEach var="row" items="${map.list}">    	
	    		<tr>
					<td scope="row">${row.CART_NO}							
					<input type="hidden"  id="CART_NO" name="CART_NO" value=" ${row.CART_NO}"></input></td>						
					<td scope="row">${row.PRO_NAME }</td>						
					<td scope="row">${row.NUMBERS }</td>
					<td scope="row"><a href="#this" id="delete">상품 제거</a></td>
				</tr>						 		
			</c:forEach>
			</c:when>
			<c:otherwise>
			 	<tr>
					<td>현재 장바구니에 선택된 상품이 없습니다.</td>
				</tr>  	
			</c:otherwise>
	</c:choose>
	</tbody>	
		</table>
		</form>
	<a href="#this" id="pay">결제하기</a> 
	<%@ include file="/page/layout/footer.jspf" %>
	

	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#pay").on("click", function(e){
				e.preventDefault();
				fn_openPayment();				
			});		
			
			$("#delete").on("click", function(e) {
				e.preventDefault();
				fn_deleteCart();				
			});						
		});
		
		function fn_openPayment() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/pay/openPayment.do' /> ");
			comSubmit.submit();					
		}
		
		function fn_deleteCart() {
            var comSubmit = new ComSubmit();                   
            comSubmit.setUrl("<c:url value='/cart/deleteCart.do' />");
            comSubmit.addParam("CART_NO", $("#CART_NO").val());
            comSubmit.submit();
		}
		
	</script>
	</body>
		
	</html>
