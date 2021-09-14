<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/signin.css">
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
				dataType:"json",
				
				success:function(data) {
					if(data) {
						window.location.replace("${pageContext.request.contextPath}/user/user");
						alert("환영합니다.");
					} else {
						$("#signInMsg").css("color","red");
						$("#signInMsg").css("font-size","10px");
						$("#signInMsg").text("아이디 또는 비밀번호가 맞지 않습니다.");
						
					}
				},
				
				error:function(request, status, error) {
					
				}
				
			});
			
		});
		
		
	});

</script>
</head>
<body>

<!-- <form action="fileFormOK.jsp" method="post" enctype="multipart/form-data"> -->
<!--     파일 : <input type="file" name="file"><br/> -->
<!--     <input type="submit" value="File Upload"> -->
<!--     </form> -->

	<h1>Login</h1>
	
	<div id="signId">
		<input type="text" name="userid" id="userid" placeholder="아이디">
	</div>
	<div id="signPw">
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호">
	</div>
	<div id="signBtn">
		<input type="button" id="signInBtn" value="로그인"> <span
			id="signInMsg"></span>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/login/signup">회원가입</a>
	</div>
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naver_id_login" class="col-md-1" style="margin:0 auto;"></div>

	<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
 		var naver_id_login = new naver_id_login("BS1ec9u_kYL0nHmx8MGJ", "http://localhost:8080/market/login/naverlogin");
 		var state = naver_id_login.getUniqState();
 		naver_id_login.setButton("green", 3,40);
 		naver_id_login.setDomain("http://localhost:8080/market/login/signin");
 		naver_id_login.setState(state);
//  				naver_id_login.setPopup();
 		naver_id_login.init_naver_id_login();
 	</script>


</body>
</html>