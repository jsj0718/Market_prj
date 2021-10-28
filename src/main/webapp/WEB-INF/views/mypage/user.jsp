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
    <script src="${path }/assets/js/user.js"></script>
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
									   <img src="assets/img/mypage/mypage.jpg" alt="이미지" style="margin: 0 auto;" />
               
									</div>
									<div id="mypage-info" class="features">
										<article>
											<span class="icon solid fa-rocket"></span>
											<div class="content">
												<h3>거래 내역</h3>
												<p>거래내역 확인을 통해 지난 시간의 거래들을 확인해주세요!</p>
											</div>
										</article>
										<article>
											<span class="icon solid fa-rocket"></span>
											<div class="content">
												<h3>신고</h3>
												<p>부당한 거래 상황을 겪으신 적 있으신가요? 신고하기를 통해 억울함을 풀어보세요!</p>
											</div>
										</article>
                    <article>
                      <span class="icon solid fa-rocket"></span>
                      <div class="content">
                        <h3>신고</h3>
                        <p>부당한 거래 상황을 겪으신 적 있으신가요? 신고하기를 통해 억울함을 풀어보세요!</p>
                      </div>
                    </article>
                    <article>
                      <span class="icon solid fa-rocket"></span>
                      <div class="content">
                        <h3>동네설정</h3>
                        <p>동네를 추가 또는 삭제하여 보고싶은 동네의 물품을 찾아보세요!</p>
                      </div>
                    </article>
                    <article>
                      <span class="icon solid fa-rocket"></span>
                      <div class="content">
                        <h3>회원수정/탈퇴</h3>
                        <p>비밀번호나 이름변경을 원하신다면 정보를 수정해보세요!</p>
                      </div>
                    </article>
  
										
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
										<li class="sell"><a href="#">판매 중 내역</a></li>
                    <li class="soldout"><a href="#">판매 완료 내역</a></li>
                    <li class="buy"><a href="#">구매내역</a></li>
                    <li ><a href="#">관심 목록</a></li>
                    <li class="address"><a href="#">동네설정</a></li>
                    <li class="user-update"><a href="${path }/mypage/user-info">회원 수정/탈퇴</a></li>
									</ul>
								</nav>
						</div>
					</div>
			</div>

	</body>
</html>