<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/page/layout/header.jspf" %>
</head>
<body>
    <table class="board_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세</caption>
        <br />
        <br />
        <tbody>
            <tr>
                <th scope="row">상품 번호</th>
                <td>${map.PRO_NO}</td>
           <input type="hidden" name="PRO_NO" value="${map.PRO_NO}"></input>                     
            </tr>
            <tr>
                <th scope="row">상품 종류</th>
                <td>${map.PRO_TYPE}</td>
            </tr>
            <tr>
                <th scope="row">상품 이름</th>
                <td>${map.PRO_NAME}</td>
            </tr>
            <tr>
                <th scope="row">상품 설명</th>
                <td colspan="3">${map.PRO_DETAIL}</td>
            </tr>
            <tr>
            	<th scope="row">상품 가격</th>
                <td colspan="4">${map.PRICE}</td>
            </tr>
            <tr>
            	<th scope="row">상품 재고</th>
            	<td colspan="4">${map.INVENTORY }</td>
            </tr>	
            <br />
            
        </tbody>
    </table>
     <br />
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
    <a href="#this" class="btn" id="delete">삭제하기</a>
     
    <%@ include file="/page/layout/footer.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openSellList();
            });
             
            $("#update").on("click", function(e){ //수정하기 버튼
                e.preventDefault();
                fn_openSellModify();
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
         
        function fn_openSellModify(){
            var pro_no = "${map.PRO_NO}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openSellModify.do' />");
            comSubmit.addParam("PRO_NO", pro_no);
            comSubmit.submit();
        }      
        
        function fn_deleteBoard(){
            var comSubmit = new ComSubmit();
            var PRO_NO = ${map.PRO_NO};
            comSubmit.setUrl("<c:url value='/board/deleteBoard.do' />");
            comSubmit.addParam("PRO_NO", PRO_NO);
            comfirm("정말 삭제하시겠습니까?");
            comSubmit.submit();
            
        }
        
    </script>
</body>
</html>