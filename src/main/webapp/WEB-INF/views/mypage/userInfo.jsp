<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>    
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${path}/assets/main.css">
    <script src="${path}/js/user.js"></script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<nav id="navigator" class="navbar navbar-expand-lg navbar fixed-top" style="background-color: #5f0080; height: 50px; color:white;">
								    <div id="nav" class="container-fluid">
								      <a class="navbar-brand mt-1 ml-1" href="#">
								        <img alt="아이콘" style="height: auto; width: 100px" src="#">
								      </a>
								      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
								        <span class="navbar-toggler-icon"></span>
								      </button>
								      <div class="collapse navbar-collapse align-items-end justify-content-between" id="navbarNav" style="background-color :#5f0080;">
								        <ul class="nav justify-content-center">
								          <li class="nav-item" style="color: white;">
								            <a class="nav-link active" aria-current="page" href="#" style="color: white;">홈</a>
								          </li>
								          <li class="nav-item">
								            <a class="nav-link" href="#" style="color: white;">메인</a>
								          </li>
								          <li class="nav-item">
								            <a class="nav-link" href="#" style="color: white;">동네</a>
								          </li>
								          <li class="nav-item">
								            <a class="nav-link" href="#" style="color: white;">카테고리</a>
								          </li>
								          <li class="nav-item">
								            <a class="nav-link" href="#" style="color: white;">채팅</a>
								          </li>
								          <li class="nav-item">
								            <a class="nav-link" href="#" style="color: white;">관리자</a>
								          </li>
								        </ul>
								        <ul class="navbar-nav">
								          <li><a class="btn" style="color: white;">아이콘</a></li>
								          <li class="nav-item dropdown">
								            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: white;">
								              회원 정보
								            </a>
								            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								              <li><a class="dropdown-item" href="#" style="color: white;">회원 정보</a></li>
								              <li><a class="dropdown-item" href="#">회원 수정</a></li>
								              <li class="dropdown-divider"></li>
								              <li><a class="dropdown-item" href="#">로그아웃</a></li>
								            </ul>
								          </li>
								        </ul>
								      </div>
								    </div>
								  </nav>
								</header>



							<!-- Section -->
								<section>
									<header class="major">
										<h2>My Page</h2>
									</header>
									<div id="box" class="features">
                  <div class="row ">
                    <h3>회원 정보 수정</h3>
                 </div>
                 <div class="row"><br>
                    <img alt="이미지" src="resource/img/mypage5.jpg" style="width:300px; height: 300px; margin: 0 auto;">
                     <c:forEach var="list" items="${list }">
                       <form action="" method="">
                          <input type="text" name="userId" placeholder="userId" value="${list.userId }" ><br>
                          <input type="text" name="userPw" placeholder="userPw" value="${list.userPw }"><br>
                          <input type="text" name="name" placeholder="name" value="${list.name }" ><br>
                          <input type="text" name="birth" placeholder="생일" value="${list.birth }" readonly><br>
                       <a href="#" style="margin: 0 auto" onclick="updateInfo(this)">수정</a>
                       <a href="#" style="margin: 0 auto" onclick="deleteInfo(this)">탈퇴</a>
                       </form>
                    </c:forEach>
                 </div>
<!-- 									   <img src="resources/img/mypage.jpg" alt="이미지" style="margin: 0 auto;" /> -->
               
									</div>
<!-- 									<div id="mypage-info" class="features"> -->
<!-- 										<article> -->
<!-- 											<span class="icon solid fa-rocket"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>거래 내역</h3> -->
<!-- 												<p>거래내역 확인을 통해 지난 시간의 거래들을 확인해주세요!</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!-- 										<article> -->
<!-- 											<span class="icon solid fa-rocket"></span> -->
<!-- 											<div class="content"> -->
<!-- 												<h3>신고</h3> -->
<!-- 												<p>부당한 거래 상황을 겪으신 적 있으신가요? 신고하기를 통해 억울함을 풀어보세요!</p> -->
<!-- 											</div> -->
<!-- 										</article> -->
<!--                     <article> -->
<!--                       <span class="icon solid fa-rocket"></span> -->
<!--                       <div class="content"> -->
<!--                         <h3>신고</h3> -->
<!--                         <p>부당한 거래 상황을 겪으신 적 있으신가요? 신고하기를 통해 억울함을 풀어보세요!</p> -->
<!--                       </div> -->
<!--                     </article> -->
<!--                     <article> -->
<!--                       <span class="icon solid fa-rocket"></span> -->
<!--                       <div class="content"> -->
<!--                         <h3>동네설정</h3> -->
<!--                         <p>동네를 추가 또는 삭제하여 보고싶은 동네의 물품을 찾아보세요!</p> -->
<!--                       </div> -->
<!--                     </article> -->
<!--                     <article> -->
<!--                       <span class="icon solid fa-rocket"></span> -->
<!--                       <div class="content"> -->
<!--                         <h3>회원수정/탈퇴</h3> -->
<!--                         <p>비밀번호나 이름변경을 원하신다면 정보를 수정해보세요!</p> -->
<!--                       </div> -->
<!--                     </article> -->
  
										
<!-- 									</div> -->
								</section>



						</div>
					</div>

				<!-- Sidebar -메뉴-------------- -->
					<div id="sidebar">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="${path }/mypage">거래내역</a></li>
                    <li class="user-update"><a href="#">회원 수정/탈퇴</a></li>
									</ul>
								</nav>
						</div>
					</div>
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>