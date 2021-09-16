<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시글 올리기</title>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	var index = 0;
	/* 사진 추가를 누르면 */
	
	function preview_images() {
		
		if (index == 5) {
			alert("이미지업로드는 5개가 최대입니다.");
			return;
			
		}

		var total_file = document.getElementById("images").files.length;
		
		console.log(document.getElementById("images").files);
		for (var i = 0; i < total_file; i++) {
			$('#image_preview')
			.append($('<div>')
				.attr('class','col-md-2')
				.attr('id', 'img_box')
				.append($('<img>')
					.attr('id', 'close')
					.attr('class','close float-right')
					.attr('src', '${pageContext.request.contextPath}/resources/img/cancel.png')
					.on('click', closeImg)
				)
				.append($('<img>')
					.attr('class', 'img-responsive')
					.attr('src', URL.createObjectURL(event.target.files[i]))
				)
			)
		}
		index = total_file + index;
		
		var count = "<div>("+ index +"/5)</div>";
		var imgcount = document.getElementById("count");
		imgcount.innerHTML = count;
		
		
		
	}
	
	const closeImg = function(e) {
		
		index --;
		//삭제
		$(e.target).parent().remove(); 
		
		
		var count = "<div>("+ index +"/5)</div>";
		var imgcount = document.getElementById("count");
		imgcount.innerHTML = count;
		$(e.target).parent().value = '';
		
		
	};
</script>
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


	/*-------img upload css-------*/
	.input-file-button{
		padding: 60px;
		background-color:white;
		border-radius: 4px;
		border: 1px solid grey;
		color: grey;
		cursor: pointer;
	}
	
	.input-file-button img {
		display: block;
		width: 15px;
		height: 15px;
		display: block; margin: 0px auto;
	}
	
	.img-responsive{
		positon: relative;
	}
	
	.picture_box {
		padding-left: 3px;
		padding-top: 2px;
	}
	
	.close {
	/* display: none; */
		cursor: pointer;
    	z-index: 100;
		margin-top: 15px;
		font-size: 18px;
		width:25px;
		height:25px;
	}
	
	.img_box{
		width: 100px;
		height: 100px;
		display: inline;
	}
	
	.upload_box{
		padding-top: 30px;
		padding-bottom: 30px;
		
	}
	
	.preview_box {
		padding-top: 15px;
	}
	
	.input_box{
		padding:20px;
		border: 1px solid grey;
	}
	
	
</style>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var addrcode = '';
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    
                	addr = data.query;
                	addrcode = data.bcode;
                	/* addr = data.bcode+sigungu +bname; */
                	
                }
                document.getElementById('address').value = data.query;
                document.getElementById('addressCode').value = data.bcode;
            }
        }).open();
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
	<!-- post -->
	<div class="container">
		<div class="mt-5 p-5">
			<!-- 업로드 -->
		  	<div class="row ">
		  	<%--   #{title}, #{content}, #{regdate}, #{price}, #{views}, #{flag}--%>
				<form action="#" method="post" enctype="multipart/form-data" class="row">
					<!-- 이미지 업로드 -->
					<div class="mt-2 col-md-2">
						<div class="upload_box">
						<label class="input-file-button" for="images">
							<img class="fit-picture" src="${path}/assets/img/post/camera.png" alt="camera">
							<div class="picture_box">사진</div>
							<div id="count">(0/5)</div>
						</label>
						<input type="file" class="form-control" id="images" name="images" onchange="preview_images(this);" style="display:none;" multiple />
						</div>
					</div>
					<!-- 이미지 업로드 미리보기 -->
					<div class="col-md-10 preview_box">
						<div class="row" id="image_preview">
							<!-- 미리보기 내용 -->
						</div>
					</div>
					<!-- 제목 -->
					<input type="text" class="input_box" placeholder="제목">
					<!-- 카테고리 -->
					<select class="input_box">
						<option value="1" selected="selected" style="display:none">카테고리</option><%-- ${id} ${name} --%>
						<option value="2">가구</option>
					    
					</select>
					
					<!-- 지역 -->
					<!-- 보여주는 값 -->
					<input type="text" name="address" id="address" placeholder="우편번호" readonly class="input_box" style="width:50%;"> 
					<!-- 넘겨주는 값 -->
					<input type="hidden" name="addressCode" id="addressCode" placeholder="우편번호" readonly> 
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="input_box" style="width:50%;">
					
					<!-- 금액 -->
					<input type="text" class="input_box" placeholder="\">
					
					<!-- 내용 -->
					<textarea class="input_box" placeholder="내용" rows="15px"></textarea>
					
					<!-- 유저 아이디 -->
					<input type="hidden" value=""><%-- ${userid} --%>
					
					<!-- 날짜 -->
					<input type="hidden" value=""><%-- ${regdate} --%>
					
					<!-- 조회수 -->
					<input type="hidden" value=""><%-- ${view} --%>
					
					<!-- 판매현황 -->
					<input type="hidden" value="N">
					
					<div class="mt-3 float-right" >
					    <input type="submit" class="btn btn-primary finishBtn" name='submit_image' value="완료"/>
					    <input type="button" class="btn btn-secondary" name='cancel' value="취소"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>

</html>