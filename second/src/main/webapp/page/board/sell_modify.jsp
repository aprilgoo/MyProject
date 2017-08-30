<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ include file="/page/layout/header.jspf" %>
</head>
<body>
    <form id="frm">
        <table>
            <colgroup>
                <col width="15%"/>
                <col width="35%"/>
                <col width="15%"/>
                <col width="35%"/>
            </colgroup>
            <caption>상품 수정</caption>
            <tbody>            	
                     <tr>
                <th scope="row">상품 번호</th>
                <td>${map.PRO_NO}
           		<input type="hidden" name="PRO_NO" value="${map.PRO_NO}"></input> </td>                  
            		
            
                <th scope="row">상품 종류</th>
                <td>
                <input type="text" name="PRO_TYPE" value="${map.PRO_TYPE}" /></td>
            </tr>
            <tr>
                <th scope="row">상품 이름</th>
                <td>
                <input type="text" name="PRO_NAME" value="${row.PRO_NAME}" /></td>
            </tr>
            <tr>
                <th scope="row">상품 설명</th>
                <td colspan="3">               
                        <textarea rows="20" cols="100" title="내용" name="PRO_DETAIL" class="view_text">${row.PRO_DETAIL }</textarea>
                    </td>
            </tr>
            <tr>
            	<th scope="row">상품 가격</th>
                <td colspan="4">
                <input type="text" name="PRICE"value="${map.PRICE}" /></td>
            </tr>
            <tr>
            	<th scope="row">상품 재고</th>
            	<td colspan="4">
            	<input type="text" name="INVENTORY"value="${map.INVENTORY}" />
            </tr>        
            </tbody>
        </table>
    </form>
     
  	<div align=center>  
    <a href="#this" id="list">목록으로</a>
    <a href="#this" id="update">저장하기</a>
    <a href="#this" id="delete">삭제하기</a>
    </div>
     
    <%@ include file="/page/layout/footer.jspf" %>
    <script type="text/javascript">
   // 	var gfv_count = '${fn:length(list)+1}';
    
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openSellList();
            });
             
            $("#update").on("click", function(e){ //저장하기 버튼
                e.preventDefault();
                fn_updateBoard();
            });
             
            $("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();       	       
                fn_deleteBoard();
            });          

        });
         
        function fn_openSellList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openSellList.do' />");
            comSubmit.submit();
        }
         
        function fn_updateBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/board/updateBoard.do' />");
            comSubmit.submit();
        }
         
        function fn_deleteBoard(){        	
        	var comSubmit = new ComSubmit();
            var PRO_NO = ${map.PRO_NO};
            comSubmit.setUrl("<c:url value='/board/deleteBoard.do' />");
            comSubmit.addParam("PRO_NO", PRO_NO);   
            alert("성공적으로 삭제되었습니다");             
            comSubmit.submit();         
       
        }

    </script>
</body>
</html>