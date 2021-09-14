<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/signup.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$("#signUpBtn").on("click",function() {
			let userid = $("#userid").val();
			let userpw = $("#userpw").val();
			let name = $("#name").val();
			let address = $("#address").val();
			let gender = $("#gender").val();
			let birth = $("#birth").val();
			let myFile = $("#img")[0].files[0].name;
			alert(userid);
			alert(myFile);
			if(userid == "") {
				alert("아이디를 입력하세요.");
				userid.focus();
				return;
			}
			
			if(userpw == "") {
				alert("비밀번호를 입력하세요.");
				userpw.focus();
				return;
			}
			
			if(name == "") {
				alert("이름를 입력하세요.");
				name.focus();
				return;
			}
			
			if(address == "") {
				alert("주소를 입력하세요.");
				address.focus();
				return;
			}
						
			if(birth == "") {
				alert("생년월일을 입력하세요.");
				birth.focus();
				return;
			}
			
 			if(myFile == "") {
 				alert("프로필 사진을 선택해 주세요.");
 				myFile.focus();
 				return;
 			}
			
			$.ajax({
				url: "${pageContext.request.contextPath}/login/idcheck",
				type: "post",
				data: {"userid" : userid},
				dataType: "json",
				
				success:function(data) {
					console.log(data);
					if(data) {
						$("#signUpForm").submit();
						alert("회원가입 완료");
					} else {
						$("#idCheckMsg").css("color","red");
						$("#idCheckMsg").text("아이디가 존재합니다.");
						
					}
				},
				
				error:function(request, status, error) {
					
				}
			});
		});
		
		$("#img").on("change",function(){
			alert("1");
			var file = $("#img")[0].files[0];
			var fileName = file.name;
			var filePaht = file.path;
			alert(fileName);
		});
	});



</script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.bcode;
                }
                document.getElementById('address').value = data.bcode;
            }
        }).open();
    }
</script>
</head>
<body>

	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/login/img-regist"
		id="imgForm" method="post" enctype="multipart/form-data">
		<div>
		<input type="file" name="uploadfile">
		<input type="submit" value="이미지업로드">
		</div>
	</form>
	
	<form action="${pageContext.request.contextPath}/login/signup-regist"
		id="signUpForm" method="post" enctype="multipart/form-data">
		<div id="signUpId">
			<input type="text" name="userid" id="userid" placeholder="아이디">
		</div>
		<div id="signUpPw">
			<input type="password" name="userpw" id="userpw" placeholder="비밀번호">
		</div>
		<div id="signUpName">
			<input type="text" name="name" id="name" placeholder="이름">
		</div>

		<div id="signUpAddress">
			<input type="text" name="address" id="address" placeholder="우편번호"
				readonly> <input type="button"
				onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</div>
		<label><input type="radio" name="gender" value="남" checked />남</label>
		<label><input type="radio" name="gender" value="여" />여</label>
		<div id="signUpBirth">
			<input type="date" name="birth" id="birth" placeholder="생년월일">
		</div>
		
		<input type="submit" id="signUpBtn" value="가입"> <span
			id="idCheckMsg"></span>
	</form>
	
</body>
</html>