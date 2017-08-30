<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/page/layout/header.jspf" %>
</head>
<body>
    <form id="frm">
    <!--  사진, 동영상 등 글자가 아닌 파일은 모두 multipart 형식의 데이터여야 한다 -->
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>판매글 작성</caption>
             <tbody>             
            <tr>
                <th scope="row">상품 종류</th>
                <td><input type="text" name="PRO_TYPE"></input></td>
            </tr>
            <tr>
                <th scope="row">상품 이름</th>
                <td>
                <input type="text" name="PRO_NAME"></input></td>
            </tr>
            <tr>
                <th scope="row">상품 설명</th>
                <td colspan="3">              
                        <textarea rows="20" cols="100" title="내용" name="PRO_DETAIL" class="view_text"></textarea>
                    </td>
            </tr>
            <tr>
            	<th scope="row">상품 가격</th>
                <td colspan="4">
                <input type="text"name="PRICE" ></input></td>
            </tr>
            <tr>
            	<th scope="row">상품 재고</th>
            	<td colspan="4">
            	<input type="text" name="INVENTORY" ></input></td>
            </tr>               
            </tbody>
        </table>
     
        <div align="center">       
        <a href="#this" class="btn" id="write" >작성하기</a>
        <a href="#this" class="btn" id="list" >목록으로</a>
        </div>
    </form>
    <%@ include file="/page/layout/footer.jspf" %>
    <!-- 목록으로 버튼 -->
    <script type="text/javascript">
    var gfv_count = 1;
    //전역변수 선언, 태그가 추가될 때마다 값을 1씩 증가시켜서 name값이 계속 바뀌도록 함
    
    $(document).ready(function(){
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
        });
         
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertBoard();
        });      
         
        $("a[name='delete']").on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });

    });
     
    function fn_openSellList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/board/openSellList.do' />");
        comSubmit.submit();
    }
     
    function fn_insertBoard(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
        comSubmit.submit();
    }
     
       </script>   

</body>
</html>