<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>    
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${path}/assets/css/main.css">
    <script src="${path}/assets/js/user.js"></script>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<header id="header">
						<ul class="nav justify-content-center" style="width:1200px; height: 35px;">
						  <li class="nav-item" > 
						    <a class="nav-link" style="color:black ; font-weight: bold; font-size: 20px;" aria-current="page"  href="${path }/index"><span>홈</span></a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" style="color:black; font-weight: bold; font-size: 20px;" href="${path }/chatroom"><span>채팅</span></a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" style="color:black; font-weight: bold; font-size: 20px;" href="${path }/mypage"><span>마이페이지</span></a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link"" style="color:black; font-weight: bold; font-size: 20px;" href="${path }/signin"><span>로그아웃</span></a>
						  </li>
						  
						</ul>
					
					</header>
					
						<div class="inner">



							<!-- Section -->
								<section>
									<header class="major">
										<h2>My Page</h2>
									</header>
									<div id="box" class="features">
                  <div class="row ">
                    <h3>회원 정보 수정</h3>
                 </div>
	                 <div class="row" style="margin-left: 120px;"><br>
	                    <img alt="이미지" src="${path }/assets/img/mypage/mypage5.jpg" style="width:300px; height: 300px; margin: 0 auto;">
	                     <c:forEach var="list" items="${list }">
	                       <form action="" method="">
	                          <input type="text" name="userId" placeholder="userId" value="${list.userId }" ><br>
	                          <input type="text" name="userPw" placeholder="userPw" value="${list.userPw }"><br>
	                          <input type="text" name="name" placeholder="name" value="${list.name }" ><br>
	                          <input type="text" name="birth" placeholder="생일" value="${list.birth }" readonly><br>
	                       <a href="#" style="margin: 0 10px; background-color: purple; color: white; padding: 15px; border-radius: 5px; " onclick="updateInfo(this)">수정</a>
	                       <a href="#" style="margin: 0 10px; background-color: purple; color: white; padding: 15px; border-radius: 5px; " onclick="deleteInfo(this)">탈퇴</a>
	                       </form>
	                    </c:forEach>
	                 </div>	
									</div>

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

	</body>
</html>