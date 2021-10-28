/**
 공통적을오 쓰일 javascript 함수작성
 */


// 특수문자 기입 방지 [영어 한글만 가능하도록 => onkey로 함수 부르기]
	function special_str_prv(id,msg){
		 $(id).keyup(function(event){
			 if(!(event.keyCode >= 37 && event.keyCode <= 40)){
				 var input_val = $(this).val();
				 var special_str = /[~!@#$%^&*()_+|<>?:{}]/gi;
				 if(special_str.test(input_val)){
					 $(this).val("");
					 $(this).focus;
					 $(msg).html("이름 입력 시 특수문자 입력이 불가합니다.").css("color","red");
				 }
			 }
		 });
	 }

  //비밀번호 유효성 검사[ 숫자, 영문, 특수문자 조합이 있는지 검사]
    function chk_pw(id,box){
	   	let pw = $(id).val();
	   	let num = pw.search(/[0~9]/g);
	   	let eng = pw.search(/[a-zA-Z]/gi);
	   	let spec = pw.search(/[~!@#$%^&*()_+<>?:{}]/);
	   	//비밀번호 자릿수
	   	if( pw.length < 8 || pw.length > 20){
	   		$(box).html("8~20자리 이내로 입력해주십시오.").css("color","red");
	   		return false;
	   	}
			//자릿수, 영문, 특수문자 확인
	   	if( num < 0 || eng < 0 || spec < 0 ){
	   		$(box).html("영문, 숫자, 특수문자를 혼합하여 입력해주십시오.").css("color","red");
	   		return false;
	   	}else{
	   		$(box).html("");
	   		return true;
	   	}
   } 

 //한글과 특수문자 입력방지 [영어(소문자), 숫자 허용 ]
	function chk_hang_spec_str(id,msg){
		var han = /[ㄱ-ㅎ가-힣]/gi;
		var spec = /[~!@#$%^&*()_+<>?:{}]/;
	  $(id).keyup(function(event){
			if(!(event.keyCode >=37 && event.keyCode <= 40)){
				var input_val = $(this).val();
				if(han.test(input_val)){
					$(msg).html("영문과 숫자만 입력가능합니다.").css("color","red");
					$(this).val("");
				}
				if(spec.test(input_val)){
					$(msg).html("영문과 숫자만 입력가능합니다.").css("color","red");
					$(this).val("");
				}
			}
	});
	}








