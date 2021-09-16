<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script>
	$(document).ready(function() {
		let signInBtn = $("#signInBtn");
		signInBtn.on("click", function() {
			let userid = $("#userid").val();
			let userpw = $("#userpw").val();
			
			if(userid == "") {
				alert("아이디를 입력하세요.");
				return;
			}
			
			if(userpw == "") {
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			$.ajax({
				url: "${pageContext.request.contextPath}/login/signincheck",
				type: "post",
				data: {"userid": userid, "userpw": userpw},
				dataType:"text",
				
				success:function(data) {
					if(data != null) {
						window.location.replace("${pageContext.request.contextPath}/index");
						alert("환영합니다.");
						if(data == "admin"){
							window.location.replace("${pageContext.request.contextPath}/admin/analysis");
							alert("관리자페이지로 이동합니다.");
						}
					} else {
						$("#signInMsg").css("color","red");
						$("#signInMsg").css("font-size","15px");
						$("#signInMsg").text("아이디 또는 비밀번호가 맞지 않습니다.");
					}
				},
				
				error:function(request, status, error) {
					console.log(error);
				}
				
			});
			
		});
		
	});

</script>
</head>
<body>
<section class="flex flex-col md:flex-row h-screen items-center">

  <div class="lg:block w-full md:w-1/2 xl:w-2/3 h-screen">
    <img src="${pageContext.request.contextPath}/assets/img/user/잔망얼굴.jpg" alt="" class="w-screen h-screen">
  </div>

  <div class="bg-white w-full md:max-w-md lg:max-w-full md:mx-auto md:mx-0 md:w-1/2 xl:w-1/3 h-screen px-6 lg:px-16 xl:px-12
        flex items-center justify-center">

    <div class="w-full h-100">


      <h1 class="text-xl md:text-2xl text-center font-bold leading-tight mt-12">Log in to your account</h1>

      <form class="mt-6" action="#" method="POST">
        <div>
          <label class="block text-gray-700">ID</label>
          <input type="text" name="userid" id="userid" placeholder="아이디" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-blue-500 focus:bg-white focus:outline-none" autofocus autocomplete required>
        </div>

        <div class="mt-4">
          <label class="block text-gray-700">Password</label>
          <input type="password" name="userpw" id="userpw" placeholder="비밀번호" minlength="6" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-blue-500
                focus:bg-white focus:outline-none" required>
        </div>

        <div class="text-right mt-2">
          <a href="${pageContext.request.contextPath}/login/signup" class="text-sm font-semibold text-gray-700 hover:text-blue-700 focus:text-blue-700">회원가입</a>
        </div>

        <input type="button" id="signInBtn" class="w-full block bg-indigo-500 hover:bg-indigo-400 focus:bg-indigo-400 text-white font-semibold rounded-lg
              px-4 py-3 mt-6" value="로그인">
              
        <span id="signInMsg"></span>
      </form>

				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naver_id_login"></div>

				<!-- 네이버아디디로로그인 초기화 Script -->
				<script type="text/javascript">
					var naver_id_login = new naver_id_login(
							"BS1ec9u_kYL0nHmx8MGJ",
							"http://localhost:8080/market/login/naverlogin");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("green", 3, 60);
					naver_id_login
							.setDomain("http://localhost:8080/market/login/signin");
					naver_id_login.setState(state);
					//  				naver_id_login.setPopup();
					naver_id_login.init_naver_id_login();
				</script>


    </div>
  </div>

</section>


</body>
</html>