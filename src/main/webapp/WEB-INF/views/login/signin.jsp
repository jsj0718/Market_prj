<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<%-- <script src="${path}/assets/js/commonizion.js"></script> --%>
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
				dataType:"json",
				
				success:function(data) {
					if(data) {
						window.location.replace("${pageContext.request.contextPath}/index");
						alert("환영합니다.");
					} else if(data == "admin") {
						window.location.replace("${pageContext.request.contextPath}/login/signup");
						alert("관리자페이지로 이동합니다.");
					} else {
						$("#signInMsg").css("color","red");
						$("#signInMsg").css("font-size","15px");
						$("#signInMsg").text("아이디 또는 비밀번호가 맞지 않습니다.");
					}
				},
				
				error:function(request, status, error) {
				
				}
				
			});
			
		});
		
	});
 // 특수문자 방지 함수 (한글과 영문만 입력가능) 
	function spectial_str_prv(id){
	 $(id).keyup(function(event){
		 if(!(event.keyCode >= 37 && event.keyCode <= 40)){
			 var input_val = $(this).val();
			 var special_str = /[~!@#$%^&*()_+|<>?:{}]/;
			 if(special_str.test(input_val)){
				 $(this).val("");
				 $(this).val.attr("placeholder","특수문자 입력이 불가합니다.");
			 }
		 }
	 });
 }
	
	
</script>
</head>
<body style="background-color: #E1E3F9">
  <div  style="margin: 0 auto;">
<!--     <img src="../assets/img/netchu.png" alt="로고" style="margin: 0 auto; width: 700px;"> -->
  </div>
<section class="flex flex-col md:flex-row h-screen items-center">


  <div class="bg-white w-full md:max-w-md lg:max-w-full md:mx-auto md:mx-0 md:w-1/2 xl:w-1/3 px-6 lg:px-16 xl:px-12
        flex items-center justify-center rounded-lg shadow-md" style="height: 700px;">

    <div class="w-full" >
			<img src="../assets/img/netchu.png" alt="로고" style="margin: 0 auto; width: 400px;">

     

      <form class="mt-6" action="#" method="POST">
        <div>
          <label class="block text-gray-700">ID</label>
          <input type="text" name="userid" id="userid" placeholder="아이디" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-blue-500 focus:bg-white focus:outline-none" autofocus autocomplete required>
        </div>

        <div class="mt-4">
          <label class="block text-gray-700">Password</label>
          <input type="password" name="userpw" id="userpw" placeholder="바밀번호" minlength="6" class="w-full px-4 py-3 rounded-lg bg-gray-200 mt-2 border focus:border-blue-500
                focus:bg-white focus:outline-none" required>
        </div>

        <div class="text-right mt-2">
          <a href="${pageContext.request.contextPath}/login/signup" class="text-sm font-semibold text-gray-700 hover:text-blue-700 focus:text-blue-700">회원가입</a>
        </div>

        <input type="button" id="signInBtn" class="w-full block bg-indigo-500 hover:bg-indigo-400 focus:bg-indigo-400 text-white font-semibold rounded-lg
              px-4 py-3 mt-6" value="로그인" style="background-color: #E0C1F1">
              
        <span id="signInMsg"></span>
      </form>

				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<input id="naver_id_login"/>  <!-- div태그에서 일단 input태그로 바꿔놓음 _ 노출안되게 -->

				<!-- 네이버아디디로로그인 초기화 Script -->
				<script type="text/javascript">
					var naver_id_login = new naver_id_login(
							"BS1ec9u_kYL0nHmx8MGJ",
							"http://localhost:8080/market/login/naverlogin");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("#E1E3F9", 3, 60);
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