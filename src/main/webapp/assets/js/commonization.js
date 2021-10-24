/**
 공통적을오 쓰일 javascript 함수작성
 */


// 특수문자 기입 방지: 영어 한글만 가능하도록 => onkey로 함수 부르기
	function special_str_prv(id){
		 $(id).keyup(function(event){
			 if(!(event.keyCode >= 37 && event.keyCode <= 40)){
				 var input_val = $(this).val();
				 var special_str = /[~!@#$%^&*()_+|<>?:{}]/gi;
				 if(special_str.test(input_val)){
					 $(this).val("");
					 $(this).focus;
					 $(this).attr("placeholder","이름 입력 시 특수문자 입력이 불가합니다.");
				 }
			 }
		 });
	 }
