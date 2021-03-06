<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>    
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
		
		if (index == 1) {
			alert("이미지업로드는 1개가 최대입니다.");
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
					.attr('src', '${pageContext.request.contextPath}/assets/img/post/cancel.png')
					.on('click', closeImg)
				)
				.append($('<img>')
					.attr('class', 'img-responsive')
					.attr('src', URL.createObjectURL(event.target.files[i]))
				)
			)
		}
		index = total_file + index;
		
		var count = "<div>("+ index +"/1)</div>";
		var imgcount = document.getElementById("count");
		imgcount.innerHTML = count;
		
		
		
	}
	
	const closeImg = function(e) {
		
		index --;
		//삭제
		$(e.target).parent().remove(); 
		
		
		var count = "<div>("+ index +"/1)</div>";
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
	  background-image: url("./assets/img/post/쇼핑6.png");
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
		background-color:#E1E3F9;
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
                document.getElementById('addresscode').value = data.bcode;
            }
        }).open();
    }
</script>
</head>
<body>
	<!-- navigation  -->
	<header>
	  	<!-- navigation  -->
		<div class="nav justify-content-center" style="background-color: #5f0080;">
          <nav class="navbar navbar-expand-lg navbar">
<!--       아이콘 -->
		          <div @click.away="open = false" class="relative" x-data="{ open: false }">
		              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
		                  <img src="./assets/img/netchu.png" alt="아이콘" style="height: 30px; width: 100px; color: white; border: 1px solid #5f0080;"> 
		              </button>
		          </div>
              <div class="collapse navbar-collapse">
                  <ul class="nav justify-content-center" style="background-color: #5f0080; width:1200px; height: 40px; color:white; ">
                  
<!--         홈 -->
                      <div @click.away="open = false" class="relative" x-data="{ open: false }">
                          <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                            <a href="${path }/index"><span>홈</span></a>
                          </button>
                      </div>
                      
<!--         채팅        -->
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                             <a href="${path }/chatroom"><span>채팅</span></a>
                        </button>
                    </div>
<!--         마이페이지        -->
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                             <a href="${path }/mypage"><span>마이페이지</span></a>
                        </button>
                    </div>     
<!--         관리자        -->                                   
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                            <a href="${path }/admin/report"><span>관리자</span></a>
                        </button>
                    </div>                    
                   </ul>
<!--         로그아웃        -->
									<div class="nav justify-content-end" style="margin-right: 0; color:white;">                                   
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                            <a href="${path }/signin"><span>로그아웃</span></a>
                        </button>
                    </div>
                  </div>		                      
              </div>
          </nav>
     </div>
	</header>

	<!-- post -->
<fieldset style="width: 1200px; margin: 0 auto; background-color:#E4EDDE;">
	<div class="container shadow-md bg-white" >
		<div class="mt-1 p-5">
			<!-- 업로드 -->
		  	<div class="row">
		  	
				<form action="${path}/post/write" method="post" enctype="multipart/form-data" class="row" >
					<div class="text-right mt-2" style="margin-bottom: 50px;" >
					    <input type="submit" class="btn btn-primary finishBtn" name='submit_image' value="완료" />
					    <button type="button" class="btn btn-secondary" name='cancel' value="취소"><a href="${path }/index">취소</a></button>
					</div>
				
					<!-- 이미지 업로드 -->
					<div class="mt-2 col-md-2 ">
						<div class="upload_box">
						<%-- <label class="input-file-button" for="images">
							<img class="fit-picture" src="${pageContext.request.contextPath}/assets/img/post/camera.png" alt="camera">
							<div class="picture_box">사진</div>
							<div id="count">(0/1)</div>
						</label> --%>
						<input type="file" name="uploadfile" > 
						<!-- <input type="file" class="form-control" id="images" name="images" onchange="preview_images(this);" style="display:none;" multiple  name="uploadfile"/> -->
						</div>
					</div>
					<!-- 이미지 업로드 미리보기 -->
					<div class="col-md-10 preview_box">
						<div class="row" id="image_preview">
							<!-- 미리보기 내용 -->
						</div>
					</div>
					<!-- 제목 -->
					<input type="text" class="input_box" name="title" id="post_title" placeholder="제목" style="border-radius: 6px 6px 0px 0px; margin-bottom: 10px;">
					<!-- 카테고리 -->
					<div class="col">
						<div class="row" style="width: 420px;">	
							<img alt="쇼핑" src="./assets/img/post/쇼핑4.jpg">
						</div>
					 	<div class="row">
							<select class="input_box" name="categoryid" id="categoryid" style="margin-bottom: 10px;">
								<option value="0" selected="selected" style="display:none">카테고리</option><%-- ${id} ${name} --%>
								<option value="1">노트북</option>
								<option value="2">도서</option>
								<option value="3">가방</option>
								<option value="4">주방도구</option>
								<option value="5">뷰티</option>
								<option value="6">홈인테리어</option>
								<option value="7">문구/오피스</option>
								<option value="8">반려동물용품</option>
								<option value="9">헬스/건강식품</option>
								<option value="10">생활용품</option>
								<option value="11">가전디지털</option>
								<option value="12">음반/DVD</option>
								<option value="13">식품</option>
								<option value="14">출산/유아동</option>
								<option value="15">자동차용품</option>
							</select>
						</div>
						<!-- 지역 -->
						<!-- 보여주는 값 -->
						<div class="row">
							<input type="text" name="address" id="address" placeholder="우편번호" readonly class="input_box" style=" margin-bottom: 10px;"> 
							<!-- 넘겨주는 값 -->
							<input type="hidden" name="addresscode" id="addresscode" placeholder="우편번호" readonly> 
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="input_box" style=" background-color: #E1E3F9; margin-bottom: 10px;">
						</div>
						
						<div class="row">	
							<!-- 금액 -->
							<input type="text" name="price" id="price" class="input_box" placeholder="\">
						</div>
					</div>	
					
					<div class="col">
						<!-- 내용 -->
						<textarea class="input_box"  name="content" id="content" placeholder="내용" rows="27px" cols="70px" style="border-radius: 0px 0px 6px 6px;"></textarea>
						
						<!-- 유저 아이디 -->
						<input type="hidden"  name="userid" id="userid" value="${sessionScope.userid}"><%-- ${userid} --%>
						
						<!-- 조회수 -->
						<%--<input type="hidden" value=""> ${view} --%>
						
						<!-- 판매현황 -->
						<input type="hidden" name="flag" id="flag" value="N">
					</div>
<!-- 					<div class="row" style="margin-top: 50px;" > -->
<!-- 						<div class="col"> -->
<!-- 					    <input type="submit" class="btn btn-primary finishBtn" name='submit_image' value="완료" /> -->
<!-- 					  </div> -->
<!-- 					  <div class="col">   -->
<%-- 					    <button type="button" class="btn btn-secondary" name='cancel' value="취소"><a href="${path }/index">취소</a></button> --%>
<!-- 					  </div>   -->
<!-- 				 </div> -->
				</form>
			</div>
		</div>
	</div>
</fieldset>		
</body>

</html>