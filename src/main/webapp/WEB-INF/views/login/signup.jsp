<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/assets/js/commonization.js"></script>
</head>
<body style="background-color: #E1E3F9">
<script>
	$(document).ready(function() {
		$("#name").attr("placeholder", "이름");
		register();
	});
	function register(){
		$("#signUpBtn").on("click",function() {
			let userid = $("#userid").val();
			let userpw = $("#userpw").val();
			let name = $("#name").val();
			let address = $("#address").val();
			let gender = $("#gender").val();
			let birth = $("#birth").val();
			let myFile = $("#uploadfile").val();
			//예외처리란 =================================
			
			//회원가입 기입란에 값이 입력되어지지 않았을 때
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
			if(!chk_pw("#userpw", "#pwMsgBox")){
				return false;
			}
		
			
			if(name == "") {
				alert("이름를 입력하세요.");
				$("#name").focus;
				return false;
			}
			
			if(address == "") {
				alert("주소를 입력하세요.");
				$("#address").focus();
				return false;
			}
						
			if(birth == "") {
				alert("생년월일을 입력하세요.");
				$("#birth").focus();
				return false;
			}
			// **2021-10-25 윤남경 if문 수정=======
 			if(myFile=="") {
 				alert("프로필 사진을 선택해 주세요.");
 				$("#uploadfile").focus();
 				return false;
 			}
 			// ================================
			$.ajax({
				url: "${path}/login/idcheck",
				type: "post",
				data: {"userid" : userid},
				dataType: "json",
				
				success:function(data) {
					console.log(data);
					if(data) {
						$("#signUpForm").submit();
						alert("회원가입 완료.");
					} else {
						$("#idCheckMsg").css("color","red");
						$("#idCheckMsg").text("아이디가 존재합니다.");
						
					}
				},
				
				error:function(request, status, error) {
					
				}
			});

		});
	}
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.bcode;
                }
                document.getElementById('address').value = data.bcode
                document.getElementById('address_full').value = data.roadAddress
            }
        }).open();
    }

  //비밀번호 유효성 검사
    function chk_pw(id,box){
	  debugger;
   	let pw = $(id).val();
   	let num = pw.search(/[0~9]/g);
   	let eng = pw.search(/[a-zA-Z]/gi);
   	let spec = pw.search(/[~!@#$%^&*()_+<>?:{}]/);
   	//비밀번호 자릿수
   	if( pw.length < 8 || pw.length > 20){
   		$(box).html("8~20자리 이내로 입력해주십시오.").css("color","red");
   		return false;
   	}
   	if( num < 0 || eng < 0 || spec < 0 ){
   		$(box).html("영문, 숫자, 특수문자를 혼합하여 입력해주십시오.").css("color","red");
   		return false;
   	}else{
   		$(box).html("");
   		return true;
   		
   	}
   } 
</script>
	<div class="font-sans">
		<div
			class="relative min-h-screen flex flex-col sm:justify-center items-center">
			<div class="relative sm:max-w-sm w-full" style="background-color: white;">
				<div
					class="relative w-full rounded-3xl  px-6 py-4 bg-white shadow-md">
					<label 
						class="block mb-3 mt-2 text-3XL text-gray-700 text-center font-semibold" style="margin: 30px auto; color: #7A457C;">
						Sign Up </label>

					<form
						action="${pageContext.request.contextPath}/login/signup-regist"
						id="signUpForm" method="post" enctype="multipart/form-data">
						
						<div style="margin-top: 50px">
							<input type="file" name="uploadfile" id="uploadfile"> 
						</div>

						<div style="margin-top: 20px">
							<input type="text" name="userid" id="userid" placeholder="아이디"
								class="mt-1 block w-full border-none h-11 rounded shadow-md  focus:ring-0" style="background-color: white;">
						</div>

						<div>
							<input type="password" name="userpw" id="userpw" placeholder="비밀번호"
								class="mt-1 block w-full border-none h-11 rounded shadow-md  focus:ring-0">
							<div id="pwMsgBox"></div>	
						</div>

						<div>
							<input type="text" name="name" id="name" 
								class="mt-1 block w-full border-none h-11 rounded shadow-md  focus:ring-0" onkeyup="special_str_prv(this)">
						</div>

						<div >
							<input type="hidden" name="address" id="address"> 
							<input type="text" name="address_full" id="address_full" placeholder="우편번호"
								readonly class="mt-1 block w-full border-none h-11 rounded shadow-md  focus:ring-0"> 
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
								class="mt-1 block w-full border-none h-11 rounded shadow-md  focus:ring-0">
						</div>
						<div class="text-center" style="margin-top: 10px;">
						<label><input type="radio" name="gender" value="남" />남</label> <label><input
							type="radio" name="gender" value="여" />여</label>
							</div>

						<div>
							<input type="date" name="birth" id="birth" placeholder="생년월일"
								class= "mt-1 block w-full border-none h-11 rounded shadow-md  focus:ring-0">
						</div>
						<span id="idCheckMsg"></span>
					</form>

					<div class="mt-7">
						<input type="button" id="signUpBtn" value="가입" style="background-color: #E0C1F1"
							class="bg-blue-500 w-full py-3 rounded-xl text-white shadow-md hover:shadow-inner focus:outline-none transition duration-500 ease-in-out  transform hover:-translate-x hover:scale-105">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>