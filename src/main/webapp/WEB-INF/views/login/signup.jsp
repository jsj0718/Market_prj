<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
			//let myFile = $("#img")[0].files[0].name;
			let myFile = $("#img").val();
// 			alert(userid);
// 			alert(myFile);

			if(userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return false;
			}
			
			if(userpw == "") {
				alert("비밀번호를 입력하세요.");
				$("#userpw").focus();
				return false;
			}
			
			if(name == "") {
				alert("이름를 입력하세요.");
				$("#name").focus();
				return false;
			}
			
			if(address == "") {
				alert("주소를 입력하세요.");
				$("#address").focus();
				return false;
			}
			
			if(gender == "") {
				$("#gender").focus();
				return false;
			}
						
			if(birth == "") {
				alert("생년월일을 입력하세요.");
				$("#birth").focus();
				return false;
			}
			
 			if(myFile == 0) {
 				alert("프로필 사진을 선택해 주세요.");
 				$("#myFile").focus();
 				return false;
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
						alert(gender);
						alert("회원가입 완료.");
					} else {
						$("#idCheckMsg").css("color","red");
						$("#idCheckMsg").text("아이디가 존재합니다.");
						
					}
				},
				
				error:function(request, status, error) {
					
				}
			});
// 			$("#img").on("change",function(){
// 	// 			alert("1");
// 				var file = $("#img")[0].files[0];
// 				var fileName = file.name;
// 				var filePaht = file.path;
// 	// 			alert(fileName);
// 			});
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
	<div class="font-sans">
		<div
			class="relative min-h-screen flex flex-col sm:justify-center items-center">
			<div class="relative sm:max-w-sm w-full">
				<div
					class="card bg-blue-400 shadow-lg  w-full h-full rounded-3xl absolute  transform -rotate-6"></div>
				<div
					class="card bg-black shadow-lg  w-full h-full rounded-3xl absolute  transform rotate-6"></div>
				<div
					class="relative w-full rounded-3xl  px-6 py-4 bg-white shadow-md">
					<label for=""
						class="block mb-3 mt-2 text-3XL text-gray-700 text-center font-semibold">
						회원가입 </label>
						
<%-- 					<form action="${pageContext.request.contextPath}/login/img-regist" --%>
<!-- 						id="imgForm" method="post" enctype="multipart/form-data"> -->
<!-- 						<div> -->
<!-- 							<input type="file" name="uploadfile" > <input -->
<!-- 								type="submit" value="이미지업로드" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0"> -->
<!-- 						</div> -->
<!-- 					</form> -->

					<form
						action="${pageContext.request.contextPath}/login/signup-regist"
						id="signUpForm" method="post" enctype="multipart/form-data">
						
						<div>
							<input type="file" name="uploadfile" > 
<!-- 								<input type="submit" value="이미지업로드" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0"> -->
						</div>

						<div>
							<input type="text" name="userid" id="userid" placeholder="아이디"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>

						<div>
							<input type="password" name="userpw" id="userpw"
								placeholder="비밀번호"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>

						<div>
							<input type="text" name="name" id="name" placeholder="이름"
								class="mt-1 block w-full border- bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>

						<div >
							<input type="text" name="address" id="address" placeholder="우편번호"
								readonly class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0"> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>
						<div class="text-center">
						<label><input type="radio" name="gender" value="male" />남</label> 
						<label><input type="radio" name="gender" value="female" />여</label>
							</div>

						<div>
							<input type="date" name="birth" id="birth" placeholder="생년월일"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>
						<span id="idCheckMsg"></span>
					</form>

					<div class="mt-7">
						<input type="button" id="signUpBtn" value="가입"
							class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-xl hover:shadow-inner focus:outline-none transition duration-500 ease-in-out  transform hover:-translate-x hover:scale-105">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>