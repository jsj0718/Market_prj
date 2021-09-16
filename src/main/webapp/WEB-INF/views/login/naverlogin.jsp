<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<%@ page import="com.kitri.market.user.vo.NaverUserVO" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>네이버</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<body>

<script type="text/javascript">
		var naver_id_login = new naver_id_login("BS1ec9u_kYL0nHmx8MGJ", "http://localhost:8080/market/login/naverlogin");
		// 접근 토큰 값 출력
// 		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
	    alert(naver_id_login.getProfileData('email'));
	    alert(naver_id_login.getProfileData('name'));
// 	    alert(naver_id_login.getProfileData('birthyear'));//
	    alert(naver_id_login.getProfileData('birthday'));
	    alert(naver_id_login.getProfileData('gender'));
	    alert(naver_id_login.getProfileData('profile_image'));
// 	    alert(naver_id_login.getProfileData('mobile'));//
		
		let user = new Object();
		user.email = naver_id_login.getProfileData('email');
		user.name = naver_id_login.getProfileData('name');
// 		user.birthyear = naver_id_signin.getProfileData('birthyear');
		user.birthday = naver_id_login.getProfileData('birthday');
		user.gender = naver_id_login.getProfileData('gender');
		user.profile_image = naver_id_login.getProfileData('profile_image');
// 		user.mobile = naver_id_signin.getProfileData('mobile');
		
		// 제이쿼리를 사용할 때에는 라이브러리가 필요하다
		// 라이브러리는 직접 다운 받을 수도 있고 cdn방식을 사용
		// cdn은 코드를 빠른 속도로 제공
		// javascript의 dom객체(html요소, div, h1, span)를 편리하게 사용하기 위한 라이브러리
		// javascript ex) document.getElementById("id");
		//				  document.getElementsByName("name");
		// jQuery ex) ID의 경우 ${"#id"} / class의 경우 ${".class"} / tag의 경우 ${"tag"}
		
		// 제이쿼리 ajax 기본 모양
		$.ajax({
	         url: "${pageContext.request.contextPath}/login/naverlogincheck",   // 이동할 url 값
	         type: "post",   // method POST, GET
	         data: JSON.stringify(user),   // url로 이동시킬 데이터 값
	         dataType: "json",   // 데이터 타입 설정 (json, xml)
	         contentType: "application/json",
	         success:function(data) {
	        	 console.log(data);
	        	 
	        	 window.location.replace("${pageContext.request.contextPath}/index");
	       
	         }, 
	         error: function(request, status, error) {
	        	 console.log("code:" + request.status)
	        	 console.log("message:" + request.responseText)
	        	 console.log("error:" + error)
	        	 window.location.replace("${pageContext.request.contextPath}/login/signin");

	         }
	      });
		


	  	}
	</script>
	

</body>


</html>