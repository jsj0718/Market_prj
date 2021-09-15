/**
 * 
 */

$(document).ready(function() {
	imgslide(); //이미지 썸네일
	addLocation();	//내 동네 추가
	getLocation();	//내 동네 게시물 가져오기
	search();	//검색
	category();	//카테고리검색
});

//썸네일 이미지 슬라이드
function imgslide() {
	$val = $("#slide").attr("val"); //현재 이미지 번호
	$mx = $("#slide").attr("mx"); //총 이미지 개수
	$("#img" + $val).hide(); //현재 이미지를 사라지게
	if ($val == $mx) {
		$val = 1;
	} //현재이미지가 마지막 번호라면 1번으로 되돌리기
	else {
		$val++;
	} //마지막 번호가 아니라면 카운트를 증가
	$("#img" + $val).fadeIn(500); //변경된 번호의 이미지영역을 나타나게 함. 괄호 안에 숫자는 페이드인 되는 시간
	$("#slide").attr('val', $val); //변경된 이미지영역의 번호를 부여
	setTimeout('imgslide()', 4000); //4초 뒤에 다시 함수를 호출(숫자값 1000당 1초)
}

//동네추가버튼(+) 누를 시
function addLocation() {
	$("#location_add").on("click", function() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				let addresscode = data.bcode; // 최종 주소 변수
				let name = data.sido + " " + data.sigungi + " " + data.bname + " ";
				//				console.log("code: " + code);
				//				console.log("name: " + name);

				//주소를 추가하면 내동네 탭에 추가시키기
				$.ajax({
					url: "index/address-regist",
					data: { "addresscode": addresscode },
					type: "post",
					dataType: "json"
				});

				let addressBox = "";
				addressBox += "<a id='location_name' class='text-black block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline' href='#'>" + name + "</a>"
				$("#addressList").append(addressBox);
			}
		}).open();
	});
}

//내동네 탭에서 동네 클릭 시, 해당되는 동네의 게시물 보여주기
function getLocation() {
	$(".my-address").on("click", function() {
		let addressName = $(this).attr('value');
		console.log("주소:" + addressName)
		$.ajax({
			url: "index/address-select",
			data: { "addressName": addressName },
			type: "post",
			dataType: "json",

			success: function(data) {
//				console.log(data);
				//기존의 게시물을 다 지우고 비동기로 다시 불러오기
				$("#board-box").empty();
		
				let html = "";
				for(let i=0; i<data.length; i++){
				html  += "<div class='w- p-6 m-10 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500'>"
						  + "<img class='w-64 object-cover rounded-t-md' src='resources/img/1.png' alt='이미지' />"
							+ " <div class='mt-4'>"
							+ "  <h1 class='text-2xl font-bold text-gray-700'> "+data[i].title+ " </h1>"
							+ "  <p class='text-base mt-2 text-gray-700'> "+data[i].addressName+ " </p>"
							+ " <p class='text-sm mt-2 text-gray-700'> "+data[i].regdate+ "</p>"
							+ " <div class='mt-4 mb-2 flex justify-between pl-4 pr-2'>"
							+ "   <button class='block text-xl font-semibold text-gray-700 cursor-auto'> "+data[i].price+ "원</button>"
							+ "   <button class='text-lg block font-semibold py-2 px-6 text-green-100 hover:text-white bg-green-400 rounded-lg shadow hover:shadow-md transition duration-300'>Buy</button>"
							+ " </div>"
							+ "  </div>"
							+ " </div>";
					}			
				$("#board-box").append(html);
			},
			
			error: function(request, status, error) {
				alert("오류");
			}
		});
	});
}


//검색 버튼 눌렀을 시
function search(){
	$("#search-btn").on("click", function() {
		let inputSearch = $("#search-input").val();
		
			$.ajax({
			url: "index/search",
			data: { "inputSearch": inputSearch },
			type: "post",
			dataType: "json",
			
			success: function(data) {
//				console.log(data);
				//기존의 게시물을 다 지우고 비동기로 다시 불러오기
				$("#board-box").empty();
		
				let html = "";
				for(let i=0; i<data.length; i++){
				html  += "<div class='w- p-6 m-10 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500'>"
						  + "<img class='w-64 object-cover rounded-t-md' src='resources/img/1.png' alt='이미지' />"
							+ " <div class='mt-4'>"
							+ "  <h1 class='text-2xl font-bold text-gray-700'> "+data[i].title+ " </h1>"
							+ "  <p class='text-base mt-2 text-gray-700'> "+data[i].addressName+ " </p>"
							+ " <p class='text-sm mt-2 text-gray-700'> "+data[i].regdate+ "</p>"
							+ " <div class='mt-4 mb-2 flex justify-between pl-4 pr-2'>"
							+ "   <button class='block text-xl font-semibold text-gray-700 cursor-auto'> "+data[i].price+ "원</button>"
							+ "   <button class='text-lg block font-semibold py-2 px-6 text-green-100 hover:text-white bg-green-400 rounded-lg shadow hover:shadow-md transition duration-300'>Buy</button>"
							+ " </div>"
							+ "  </div>"
							+ " </div>";
					}			
				$("#board-box").append(html);
			},
			
			error: function(request, status, error) {
				alert("오류");
			}
		
		});
	});
}



//카테고리 선택 시
function category(){
	$(".categories").on("click", function() {
		let categoryName = $(this).attr('value');
		console.log("카테고리이름:" + categoryName)
		$.ajax({
			url: "index/category-select",
			data: { "categoryName": categoryName },
			type: "post",
			dataType: "json",
			
			success: function(data) {
//				console.log(data);
				//기존의 게시물을 다 지우고 비동기로 다시 불러오기
				$("#board-box").empty();
		
				let html = "";
				for(let i=0; i<data.length; i++){
				html  += "<div class='w- p-6 m-10 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500'>"
						  + "<img class='w-64 object-cover rounded-t-md' src='resources/img/1.png' alt='이미지' />"
							+ " <div class='mt-4'>"
							+ "  <h1 class='text-2xl font-bold text-gray-700'> "+data[i].title+ " </h1>"
							+ "  <p class='text-base mt-2 text-gray-700'> "+data[i].addressName+ " </p>"
							+ " <p class='text-sm mt-2 text-gray-700'> "+data[i].regdate+ "</p>"
							+ " <div class='mt-4 mb-2 flex justify-between pl-4 pr-2'>"
							+ "   <button class='block text-xl font-semibold text-gray-700 cursor-auto'> "+data[i].price+ "원</button>"
							+ "   <button class='text-lg block font-semibold py-2 px-6 text-green-100 hover:text-white bg-green-400 rounded-lg shadow hover:shadow-md transition duration-300'>Buy</button>"
							+ " </div>"
							+ "  </div>"
							+ " </div>";
					}			
				$("#board-box").append(html);
			},
			
			error: function(request, status, error) {
				alert("오류");
			}
		
		});
	});
}