/**
 * 
 */

$(document).ready(function() {
	getAddress();
	update();
	sell();
	soldout();
	buy();

});

//판매중인 상품
function sell() {
	$(".sell").on("click", function() {
//		let addressName = $(this).attr('value');
//		console.log("주소:" + addressName)
		$.ajax({
			url: "mypage/sell",
			data: {},
			type: "post",
			dataType: "json",

			success: function(data) {
//				console.log(data);
				//기존의 게시물을 다 지우고 비동기로 다시 불러오기
				$("#box").empty();
				$("#mypage-info").empty();
		
				let html1 = "";
				let html2 = "";
				
				      html1= '<h3>판매중인 상품</h1>'
							 +	'<img src="assets/img/mypage/mypage3.jpg" alt="이미지" style="margin: 0 auto;" />'
							 +		'<table>'
               +      '<thead>'
               +          '<tr>'
               +             '<th style="text-align:center;">NO</th>'
               +             '<th style="text-align:center;">TITLE</th>'
               +             '<th style="text-align:center;">DATE</th>'
               +          '</tr>'
                +        '</thead>'
                     +            '<tbody id="tbody">'
                     +            '</tbody>'
                     + '</table>';


            $("#box").append(html1);
              
            for(let i=0; i<data.length; i++){

            html2   +=      '<tr class="reportBox" style="text-align: center;">'
                        +            '<td>'+data[i].boardId+'</td>'
                        +            '<td>'+data[i].title+'</td>'
                        +            '<td>'+data[i].regdate+'</td>'
                        +         '</tr>' ;    
						}
            $("#tbody").append(html2);
		
			},
			
			error: function(request, status, error) {
				alert("오류");
			}
		});
	});
}



//판매완료
function soldout() {
	$(".soldout").on("click", function() {
//		let addressName = $(this).attr('value');
//		console.log("주소:" + addressName)
		$.ajax({
			url: "mypage/soldout",
			data: {},
			type: "post",
			dataType: "json",

			success: function(data) {
//				console.log(data);
				//기존의 게시물을 다 지우고 비동기로 다시 불러오기
				$("#box").empty();
				$("#mypage-info").empty();
		
let html1 = "";
				let html2 = "";
				
				      html1= '<h3>판매 완료 상품</h1>'
							 +	'<img src="assets/img/mypage/mypage2.jpg" alt="이미지" style="margin: 0 auto;" />'
							 +		'<table>'
               +      '<thead>'
               +          '<tr>'
               +             '<th style="text-align:center;">NO</th>'
               +             '<th style="text-align:center;">TITLE</th>'
               +             '<th style="text-align:center;">BUYER</th>'
               +             '<th style="text-align:center;">DATE</th>'
               +          '</tr>'
                +        '</thead>'
                     +            '<tbody id="tbody">'
                     +            '</tbody>'
                     + '</table>';


            $("#box").append(html1);
              
            for(let i=0; i<data.length; i++){

            html2   +=      '<tr class="reportBox" style="text-align: center;">'
                        +            '<td>'+data[i].boardId+'</td>'
                        +            '<td>'+data[i].title+'</td>'
                        +            '<td>'+data[i].buyer+'</td>'
                        +            '<td>'+data[i].regdate+'</td>'
                        +         '</tr>' ;    
						}
            $("#tbody").append(html2);
		
			},
			
			error: function(request, status, error) {
				alert("오류");
			}
		});
	});
}



//구매내역
function buy() {
	$(".buy").on("click", function() {
//		let addressName = $(this).attr('value');
//		console.log("주소:" + addressName)
		$.ajax({
			url: "mypage/buy",
			data: {},
			type: "post",
			dataType: "json",

			success: function(data) {
//				console.log(data);
				//기존의 게시물을 다 지우고 비동기로 다시 불러오기
				$("#box").empty();
				$("#mypage-info").empty();
		
				let html1 = "";
				let html2 = "";
				
				      html1= '<h3>구매 내역</h1>'
							 +	'<img src="assets/img/mypage/mypage4.jpg" alt="이미지" style="margin: 0 auto;" />'
							 +		'<table>'
               +      '<thead>'
               +          '<tr>'
               +             '<th style="text-align:center;">NO</th>'
               +             '<th style="text-align:center;">TITLE</th>'
               +             '<th style="text-align:center;">DATE</th>'
               +          '</tr>'
                +        '</thead>'
                     +            '<tbody id="tbody">'
                     +            '</tbody>'
                     + '</table>';


            $("#box").append(html1);
              
            for(let i=0; i<data.length; i++){

            html2   +=      '<tr class="reportBox" style="text-align: center;">'
                        +            '<td>'+data[i].boardId+'</td>'
                        +            '<td>'+data[i].title+'</td>'
                        +            '<td>'+data[i].regdate+'</td>'
                        +         '</tr>' ;    
						}
            $("#tbody").append(html2);
						
			},
			
			error: function(request, status, error) {
				alert("오류");
			}
		});
	});
}


//동네 불러오기
function getAddress() {
   $(".address").on("click", function() {
      let userId = 'jisoo';
      $.ajax({
         url: "mypage/address-list",
         data: { "userId": userId },
         type: "post",
         dataType: "json",

         success: function(data) {
            console.log(data);
            //기존의 게시물을 다 지우고 비동기로 다시 불러오기
            $("#box").empty();
      
            let html1 = "";
            
            html1= '<table>'
               +      '<thead>'
               +          '<tr>'
               +             '<th id="check">나의 동네</th>'
               +             '<th></th>'
               +          '</tr>'
                +        '</thead>'
                     +            '<tbody id="tbody">'
                     +            '</tbody>'
                     + '</table>';

            $("#box").append(html1);
            let html2 = "";
            
            for(let i=0; i<data.length; i++){
               
            html2   +=      '<tr class="reportBox" style="text-align: center;">'
                        +            '<td>'+data[i].addressName+'</td>'
                +            '<td>'
                        +               '<form action="" method="">'
                        +                  '<input type="hidden" name=addressName value="'+data[i].addressName+'">'
                        +                  '<input type="hidden" name=userId value="'+data[i].userId+'">'
                        +                  '<a id="deleteBtn" href="#" onclick="deleteAddress(this)">삭제</a></td>'
                        +               '</form>'
                        +         '</tr>' ;    
                     
               }         
            $("#tbody").append(html2);
         },
         
         error: function(request, status, error) {
            alert("오류");
         }
      });
   });
}


//회원수정
function updateInfo($this){
   var result= confirm("회원정보를 수정하시겠습니까?");
   if(result){
         var form = $this.parentElement;
//          console.log(form);
         form.action = "update-info";
         form.method="post";
         form.submit();   
         alert("완료!")
   }else{
      alert("취소!");
   }   
}

function update(){
	 $(".user-update").on("click", function() {
		 $.ajax({
         url: "mypage/user-info",
         data: {},
         type: "post",
         dataType: "json"
		});

		
		});
}

//회원탈퇴
function deleteInfo($this){
   let result = confirm("회원 탈퇴 하시겠습니까?");
   if(result){
      let form =$this.parentElement;
      form.action = "delete-info";
      form.method="post";
      form.submit();   
      alert("완료!");
      
   }else{
      alert("취소!");
      
   }
}


//동네 삭제
function deleteAddress($this){
   let result = confirm("동네를 삭제하시겠습니까?");
   if(result){
      let form =$this.parentElement;
      form.action = "mypage/delete-address";
      form.method="post";
      form.submit();   
      alert("완료!");
      
   }else{
      alert("취소!");
      
   }
}



  