<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap');
   body{
      font-family: 'Nanum Gothic', sans-serif;
      background-color: #F1F2F5;
      
   }
   header{
   	background-color: white;
   }
/*     fixed 된 네브바와 sub 네브바 공간 확보용  */
   #space{
      height: 50px;
   }
   
/*     navbar  */
   #nav, .btn, .nav-link{
      color: white;
   }
   .btn,.nav-link:hover{
      color: white;
      text-shadow: 1px 1px 1px white;
   }
	.nav-item{ 
	 		margin:0 auto; 
	 } 

</style>
<body>
	<header>
		<!-- 상단 네브바 -->
		<nav class="navbar navbar-expand-lg navbar fixed-top" style="background-color: white; height: 40px; color:white;">
		    <div id="nav" class="container-fluid justify-content-end">
		      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="navbar-toggler-icon"></span>
		      </button>
		      <div>
		        <ul class="nav justify-content-end" style="background-color :white">
		          <li class="nav-item">
		            <a class="nav-link text-black" href="#">관리자</a>
		          </li>
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle text-black" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		              회원 정보
		            </a>
		            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
		              <li><a class="dropdown-item" href="#">회원 정보</a></li>
		              <li><a class="dropdown-item" href="#">회원 수정</a></li>
		              <li class="dropdown-divider"></li>
		              <li><a class="dropdown-item" href="#">로그아웃</a></li>
		            </ul>
		          </li>
		        </ul>
		      </div>
		    </div>
		 </nav>

		<!-- 중간 네브바 _ 아이콘-->
		<div class="container-fluid h-10 mb-20 mt-10">
				<div class=" h-10 mb-20 mt-10 justify-content-center">
					<a class="navbar-brand mt-1 ml-1" href="#">
		        <img alt="아이콘" style="height: auto; margin:0 auto; width: 100px" src="#">
		      </a>
				</div>
		</div>

		<!-- 하단 네브바 -->
	     <div class="nav justify-content-center" style="background-color: #5f0080;">
        	<nav class="navbar navbar-expand-lg navbar">
            	<div class="collapse navbar-collapse">
									<ul class="nav justify-content-center" style="background-color: #5f0080; width:1200px; height: 40px; color:white;">
											<li class="nav-item">
								        <a class="nav-link active" aria-current="page" href="#">홈</a>
								      </li>
								      <li class="nav-item">
								        <a class="nav-link" href="#">메인</a>
								      </li>
								      <li class="nav-item">
								        <a class="nav-link" href="#">동네</a>
								      </li>
								      <li class="nav-item">
								        <a class="nav-link" href="#">카테고리</a>
								      </li>
								      <li class="nav-item">
								        <a class="nav-link" href="#">채팅</a>
								      </li>
									 </ul>
							</div>
					</nav>
		 </div>
 </header>
 
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
</body>
</html>