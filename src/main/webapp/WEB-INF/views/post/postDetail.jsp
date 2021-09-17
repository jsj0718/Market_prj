<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시물 상세보기</title>
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
	<style>
		/*-------header css-------*/
		@import
		  url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap')
		  ;
		
		body {
		  font-family: 'Nanum Gothic', sans-serif;
		  background-color: #F1F2F5;
		}
		
		#space {
		  height: 50px;
		}
		
		#title {
		  font-size: 30px;
		  text-align: center;
		}
		
		#nav, .btn, .nav-link {
		  color: white;
		}
		
		.btn, .nav-link:hover {
		  color: white;
		  text-shadow: 1px 1px 1px white;
		}
		
		#blackListA, #analysisA {
		  margin: 0 10px;
		  width: 10px;
		  text-align: center;
		  font-size: 20px;
		}
		
		.listBtn {
		  background-color: #FFF7F1;
		  border-radius: 5px;
		  margin: 20px auto;
		  padding: 6px;
		  color: gray;
		  box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.2);
		}
		
		.listBtn:hover {
		  background-color: #F6EBE7;
		  color: black;
		}
		
		.fas {
		  margin: 0 10px;
		  color: gray;
		}
		
		table {
		  margin: 0 auto;
		  border-width: 1px;
		  color: rgba(0, 0, 0, 0.6);
		}
		
		h1 {
		  font-size: 20px;
		  text-align: center;
		  margin-top: 20px;
		  margin-bottom: 20px;
		}
		
		th {
		  width: 120px;
		  text-align: center;
		}
		
		tr:hover {
		  color: black;
		  font-weight: 4px;
		}
		
		/*------postdatailImg------*/
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}
		
		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}
		
		/*---------detail_content---------*/
		.post-preview > a {
		  color: #212529;
		}
		.post-preview > a:focus, .post-preview > a:hover {
		  text-decoration: none;
		  color: #0085A1;
		}
		.post-preview > a > .post-title {
		  font-size: 1.875rem;
		  margin-top: 1.875rem;
		  margin-bottom: 0.625rem;
		}
		.post-preview > a > .post-subtitle {
		  font-weight: 300;
		  margin-bottom: 0.625rem;
		}
		.post-preview > .post-meta {
		  font-size: 1.125rem;
		  font-style: italic;
		  margin-top: 0;
		  color: #6c757d;
		}
		.post-preview > .post-meta > a {
		  text-decoration: none;
		}
		@media (min-width: 992px) {
		  .post-preview > a > .post-title {
		    font-size: 2.25rem;
		  }
	</style>
	
	
	<script>
		var userid = '${post.USERID}';
		var boardid = '${post.boardid}';
		var img = '${post.img}';
		var postUserId = '${post.USERID}';
		var reportUserId = '${report.USERID}';
		var title = '${post.title}';
		var category = '${post.CATEGORYID}';
		var addrcode = '${post.ADDRESSCODE}';
		var content = '${post.content}';
		var price = '${post.price}';
		var views = '${post.views}';		
		var flag = '${post.flag}';
		var regdate = '${post.regdate}';
		var userimg = '${report.img}';
		
		console.log("userid : ", userid);
		console.log("boardid : ", boardid);
		console.log("Puserid : ", postUserId);
		console.log("postImg : ", img);
		console.log("title : ", title);
		console.log("category : ", category);
		console.log("addrcode : ", addrcode);
		console.log("content : ", content);
		console.log("flag : ", flag);
		console.log("views : ", views);
		console.log("regdate : ", regdate);
		console.log("userImg : ", userimg);
		
		
		function report() { 
			
			
			location.href='userReport';
			/*신고 한번만 
			//세션유효하면
			if(){
				//본인 세션 id와 신고한사람 id
				if(){
					
				}
				
			}else{
				//회원가입
			} 
			*/
		}
					
	</script>
	
</head>
<body>
	<!-- navigation  -->
	<header>
	  <nav id="navigator" class="navbar navbar-expand-lg navbar fixed-top" style="background-color: #5f0080; height: 70px; color: white;">
	    <div id="nav" class="container-fluid">
	      <a class="navbar-brand mt-1 ml-1" href="#">
	        <img alt="아이콘" style="height: auto; width: 100px" src="#">
	      </a>
	      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <div class="collapse navbar-collapse align-items-end justify-content-between" id="navbarNav" style="background-color: #5f0080;">
	        <ul class="nav justify-content-center">
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
	          <li class="nav-item">
	            <a class="nav-link" href="#">관리자</a>
	          </li>
	        </ul>
	        <ul class="navbar-nav">
	          <li>
	            <a class="btn">아이콘</a>
	          </li>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 회원 정보 </a>
	            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	              <li>
	                <a class="dropdown-item" href="#">회원 정보</a>
	              </li>
	              <li>
	                <a class="dropdown-item" href="#">회원 수정</a>
	              </li>
	              <li class="dropdown-divider"></li>
	              <li>
	                <a class="dropdown-item" href="#">로그아웃</a>
	              </li>
	            </ul>
	          </li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	</header>
	<div id="space"></div>
	
	<!-- 상세보기 -->
	<main>
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		  	<c:forEach items="${pdList}" var="pdvo" varStatus="status">
			    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="${status.count -1}" class="active" aria-current="true" aria-label="${pdvo.img}"></button>
		    </c:forEach> 
		    <%-- 
		    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="${pdvo.img}"></button>
		    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button> 
		     --%>
		  </div>
		  <div class="carousel-inner">
		  	<c:forEach items="${pdList}" var="pdvo" varStatus="status">
			  	<c:if test="${status.count == 1}">
				    <div class="carousel-item active">			    		
						<img class="d-block w-100 h-75" src="${pageContext.request.contextPath}/resources/img/${pdvo.img}" alt="${status.count}">
				    </div>
				</c:if>
				<c:if test="${status.count > 1}">
					<div class="carousel-item">	    		
						<img class="d-block w-100 h-75" src="${pageContext.request.contextPath}/resources/img/${pdvo.img}" alt="${status.count}">
					</div>
				</c:if>
		    </c:forEach>
		     
		    <%-- <div class="carousel-item active">
				<img class="d-block w-100 h-75" src="${pageContext.request.contextPath}/resources/img/Desert_Water_source_2021.jpg" alt="first slide">
		    </div>
		    <div class="carousel-item">
				<img class="d-block w-100 h-75" src="${pageContext.request.contextPath}/resources/img/Desert_Water_source_2021.jpg" alt="Second slide">
		    </div>
		    <div class="carousel-item">
				<img class="d-block w-100 h-75" src="${pageContext.request.contextPath}/resources/img/Inner_Mongolia_Alxa_Swan_Lake_Desert.jpg" alt="Third slide">
		      
		    </div>  --%>
		    
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		
		<!-- 사용자 정보 -->
		<div class="container pt-4">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                    
                    <div class="post-preview">
                    	
                    	<div class="pt-4 pb-4">
                        	<!-- 사용자 ID -->                 	
	                        <div class="h5 post-subtitle pl-3 row">
	                        	<div class="col-md-1">
	                        		
	                        		<div style="width: 50px;">	
	                        			<c:if test="${empty report.img}">
			                    			<img src="${pageContext.request.contextPath}/resources/img/up-arrow-blue.png" alt="${report.img}">
										</c:if>
										<c:if test="${not empty report.img}">
											<img src="${pageContext.request.contextPath}/resources/img/user.png" alt="${report.img}">
										</c:if>
	                        		</div>
	                        	</div>
	                        	
	                        	<div class="row col-md-11 mt-2">
		                        	<div class="col-md-10">	                        	
			                        	${post.USERID}
		                        	</div>
		                        	<!-- 신고당한 횟수 -->
		                        	<div class=" col-md-2" >
		                        	
			                        	<div class="text-right" style="font-size: 10px;">
			                        		불량이용자 신고 횟수
			                        	</div>
			                        	<div class="text-right">
			                        		${report.report}
			                        	</div>
		                        	
		                        	</div>
	                        	</div>
	                        	
	                        </div>
                        	<%-- 
                        	<div class="col-md-8 row">       
                        		<!-- 사용자 ID -->                 	
		                        <div class="col-md-10 h5"><div class="post-subtitle p-4">${post.USERID}</div></div>
		                        <div class="col-md-2">
				                        <input type="button" class="btn btn-danger mt-3 ml-5 mb-3" value="신고" id="report" onclick="report()">
		                        </div>
                        	</div> 
                        	--%>
                        	
                        	</div>
                        </div>
					</div>
				</div>
        	</div>        	
		</div>
		
		<!-- 구분선 -->
		<div class="pr-5 pl-5"> <hr ></div>
		
		
		<!-- 상세내용 제목 및 가격 -->
		<div class="container pt-4">
			<div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                    
                    <div class="post-preview">
                    	<!-- 제목, 거래 현황 -->
                    	<div class="pl-3">
	                    	<div class="">
		                    	<div class="row">	                    	
			                    	<div class="h4 pt-3 col-md-2 mt-1">
			                    		<c:if test="${fn:contains(post.flag, 'Y')}">
			                    			<div class="text-primary">
											    <c:out value="판매중" />
			                    			</div>
										</c:if>
										<c:if test="${fn:contains(post.flag, 'N')}">
										    <div class="text-secondary">
											    <c:out value="거래완료" />
			                    			</div>
										</c:if>
			                    	</div>
			                        
			                        <div class="post-title h2 p-3 col-md-7 ">${post.title}</div>
			                        
			                        <div class="col-md-3">
	                        		
		                        		<c:if test="${fn:contains(post.flag, 'Y')}">
											<form action="/market/chatroom" method="post">
						                    	<input type="hidden" value="${post.boardid}" name="boardId" readonly >
                                  <input type="hidden" value="${post.USERID}" name="author" readonly >
						                    	<input type="submit" value="채팅으로 거래하기" class="btn btn-primary mt-3 mb-3">
						                    </form>   
										</c:if>
										<c:if test="${fn:contains(post.flag, 'N')}">
										    <form action="" method="post">
						                    	<input type="hidden" value="${post.boardid}" readonly >
						                    	<input type="submit" value="채팅으로 거래하기" class="btn btn-primary mt-3 mb-3" disabled>
						                    </form> 
										</c:if>
	                        		</div>     
		                    	</div>
		                    	
	                        	
                        		<!-- 가격 -->
                    			<div class="post-subtitle h4">
                    				<div class="mt-4 mb-3">
	                    				\ ${post.price}
                    				</div>
                    			</div>  
	                        	
	                        	
	                        </div>
	                        <div class="pt-5">
			                    <!-- 내용 -->
			                    <div class="post-subtitle content h4 pt-5"> ${post.content}</div>
		                    </div>
                    	</div>
                    </div>
                    
                    
                    
                </div>
            </div>
        </div>
		</div>
		<!-- FOOTER -->
		<footer class="container">
			<p class="float-end w-10 mb-5"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/up-arrow.png"></a></p>
			
		</footer>
	</main>
	
</body>



</html>