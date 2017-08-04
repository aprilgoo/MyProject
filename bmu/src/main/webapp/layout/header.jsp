<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
//절대 경로에 사용할 context root path를 자바로 계산
String root = request.getContextPath();
%>

<html>
<head>
<title>Beam me up plz :-)</title>
<style>
	.header, .container, .footer{
		width:1100px;
		
		/* 글꼴 설정 */
		font-family:Consolas;
		font-size:25px;
		
		/* 안쪽 여백 설정 */
		padding : 20px;
	}
	.container{
		/* 최소 높이 지정 */
		min-height:450px;
		text-align: center;
	}
	.footer{
		text-align: center;
	}
	
	.logo{
		display:block;
		margin-bottom: 25px; 
	}
	
	/* a태그 상태 설정 */
	a:link, a:visited{
		color:black;
		text-decoration: none;
		margin-right:15px;
	}
	a:hover{
		text-decoration: underline;
	}
	
	.row-50{
		width:50%;
		margin: 0 auto;
	}
	.input-100{
		width:100%;
		
		font-family: 굴림;
		font-size:25px;
		
		padding:10px;
		margin:15px 0px;/* 상하 좌우 */
		
		outline: none;
		border:none;
		border-bottom:1px solid black;
	}
	.input-40{
		width:40%;
		text-align:left;
	}
	.input-area{
		width:100%;
		height:250px;
		
		font-family:굴림;
		font-size:20px;
		
		border:1px solid black;
		outline:none;
		
		resize:none;	/* 크기 조절 불가*/
		
		padding:10px;
		margin:15px auto;
	}
	.small{
		height:150px !important;
	}
	.inline{
		display:inline-block;
	}
	.line{
		border:1px solid black;
		padding:15px;
	}
	.row-btn{
		width:100%;
		text-align:right;
		padding:5px;
	}
	.input-btn{
		width:120px; 
		
		font-family:굴림;
		font-size:25px;
		
		padding:10px;
		margin-left:15px;
		
		background-color:white;
		border:1px solid black;
	}
	
	.row-50 > table{/* class="row-50" 바로 안에 있는 table 태그의 디자인 속성 정의 구역 */
		width:100%;
		border-collapse: collapse;
	}
	
	.row-50 > table th, .row-50 > table td{
		font-family: 굴림;
		font-size:20px;
		padding:10px;
	}
	
	.row-80{
		width:80%;
		margin:0px auto;
	}
	.row-80 > table{
		width:100%;
		border-collapse: collapse;
	}
	.row-80 > table th, .row-80 > table td{
		padding:10px;
		font-family:굴림;
		font-size:20px;
	}
	
	.search-input, .search-btn{
		font-family:굴림;
		font-size:20px;
		
		border:1px solid black;
		padding:10px;
	}
	
	.board-list-number{
		display: inline-block;
		min-width:30px;
		height:30px;
		border:1px solid black;
		padding:5px;
		text-align: center;
	}
	.board-list-btn{ 
		display: inline-block;
		width:auto;
		height:30px;
		border:1px solid black;
		padding:5px;
	}
	.active{
		background-color:yellow;
	}
	.hidden{
		/* display:none; */
		visibility: hidden;
	}
</style>

<script>
	function dropout(){
		//알림창 띄우고 확인 누르면 탈퇴페이지로 이동
		var res = window.confirm("정말로 탈퇴하시겠습니까?");
		//window.alert(res);
		if(res == true){
			location.href="<%=root%>/page/member/dropout.jsp";
		}
	}
</script>

</head>
<body>	
	<div align="center">
		<div class="header" align="left">	
			
			
			<!-- 메뉴들 -->
	
			<a href="<%=root%>/index.jsp">Home</a>
			<a href="<%=root%>/member/join.jsp">Join</a>
			<a href="<%=root%>/member/login.jsp">Login</a>
			<a href="<%=root%>/board/list.jsp">Board</a>
			<a href="<%=root%>/event/spring.jsp">Event</a>
			
		</div>
		<div class="container">

    