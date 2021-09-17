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
	// 문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하라는 의미
	$(document).ready(function() {
		$("#signUpBtn").on("click",function() {
			let userid = $("#userid").val();
			let userpw = $("#userpw").val();
			let repw = $("#repw").val();
			let name = $("#name").val();
			let address = $("#address").val();
			let gender = $("#gender").val();
			let birth = $("#birth").val();
			let img = $("#myFile").val();
			let male = $("#M").val();
			let female = $("#F").val();

			//id유효성 체크,아이디 중복은 ajax 끝나는 부분에 있음
            var regex = /^[a-z][a-z\d]{4,11}$/;
        	var result = regex.exec(userid);
        	
        	//pw유효성 체크
			var regexpw = /^[A-Za-z\d]{8,12}$/;
			var resultpw = regexpw.exec(userpw);
            
			//이름 유효성 체크
			var regexN = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;
			var resultN = regexN.exec($("#name").val());
			
			if(userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
			}
			if(result != null){
			    $(".id.regex").html("");
			}else{
			    $(".id.regex").html("영어 소문자,숫자 4-12자리");
			    $(".id.regex").css("color","red");
			    return false;
			}
			
			if(userpw == "") {
				alert("비밀번호를 입력하세요.");
				$("#userpw").focus();
				
			}
			if(resultpw != null){
                $(".pw.regexpw").html("");
            }else{
                $(".pw.regexpw").html("영어대소문자,숫자 8-11자리");
                $(".pw.regexpw").css("color","red");
                return false;
            }
			
			if(userpw != repw) {
				alert("비밀번호가 다릅니다.");
				$("#repw").focus();
				return false;
			}
			
			if(name == "") {
				alert("이름를 입력하세요.");
				$("#name").focus();
			}
			if(resultN != null){
				$(".name.regexN").html("");  
			}else{
				$(".name.regexN").html("한글만 입력 가능합니다.");
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
			
 			// id="M"이 체크 되있지않고, id="F"도 체크되있지 않으면 , 성별 선택 알림창이 뜨고 성별체크란에 포커스(성별체크란으로 이동)를 둔다
 			if($("#M").is(":checked") == false && $("#F").is(":checked") == false) {
 				alert("성별을 선택해 주세요.");
 				$("#M").focus();
 				return false;
 			}
 			
 			// 위의 코드가 다 실행되고 비동기(ajax)로 idcheck에서 기입한 userid로 아이디 중복체크와 post방식으로 하여 json의 형태로 만든다 
			$.ajax({
				url: "${pageContext.request.contextPath}/idcheck",
				type: "post",
				data: {"userid" : userid},
				dataType: "json",
				
				// 데이터가 성공 하면
				success:function(data) {
					console.log(data);
					if(data) {
						// signUpForm.submit로 넘겨준다
						$("#signUpForm").submit();
						alert("회원가입 완료.");
					} else {
						// 그게 아니고 아이디가 중복된다면 idCheckMsg 아이디 체크 메세지를 나타내준다.
						$("#idCheckMsg").css("color","red");
						$("#idCheckMsg").text("아이디가 존재합니다.");
						
					}
				},
				// 에러
				error:function(request, status, error) {
					
				}
			});

		});
	});
	
</script>

<script>
// 카카오 우편번호 오픈 api , 따로 신청하지 않아도 사용가능하다.
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.bcode; // 법정동 코드를 addr에 넣어준다
                }
                document.getElementById('address').value = data.bcode; // 법정동 코드를 받아온다.
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
					<!-- 회원가입 폼 -->
					<form
						action="${pageContext.request.contextPath}/signup-regist"
						id="signUpForm" method="post" enctype="multipart/form-data">
						
						<!-- 파일 업로드 -->
						<div>
							<input type="file" name="uploadfile" id="myFile"> 
<%-- 							<img src="${pageContext.request.contextPath}/assets/img/post/user.png"> --%>
<!-- 								<input type="submit" value="이미지업로드" class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0"> -->
						</div>
						
						<!-- 아이디 -->
						<div>
							<input type="text" name="userid" id="userid" placeholder="아이디"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
            				<div class="id regex"></div>
						</div>
						
						<!-- 비밀번호 -->
						<div>
							<input type="password" name="userpw" id="userpw"
								placeholder="비밀번호"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
							<div class="pw regexpw"></div>
						</div>
						
						<!-- 비밀번호 중복 확인 -->
						<div>
							<input type="password" name="repw" id="repw"
								placeholder="비밀번호 중복확인"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>
						
						<!-- 이름 -->
						<div>
							<input type="text" name="name" id="name" placeholder="이름"
								class="mt-1 block w-full border- bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
								<div class="name regexN"></div>
						</div>

						<!-- 카카오 우편번호 api -->
						<div >
							<input type="text" name="address" id="address" placeholder="우편번호"
								readonly class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0"> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>
						
						<!-- 성별 radio -->
						<div class="text-center" id="gender">
							<label><input type="radio" name="gender" id="M" value="male" />남</label> 
							<label><input type="radio" name="gender" id="F" value="female" />여</label>
						</div>
						
						<!-- 생년월일 date -->
						<div>
							<input type="date" name="birth" id="birth" placeholder="생년월일"
								class="mt-1 block w-full border-none bg-gray-100 h-11 rounded-xl shadow-lg hover:bg-blue-100 focus:bg-blue-100 focus:ring-0">
						</div>
						
						<!-- 가입 실패시 나오는 메세지 -->
						<span id="idCheckMsg"></span>
					</form>
					
					<!-- 가입버튼 -->
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