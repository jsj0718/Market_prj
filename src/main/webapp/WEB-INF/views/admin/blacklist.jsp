<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/assets/css/blacklist.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js" integrity="sha512-FoyrIocrD2VGbh1HeDL8s/e+kNw0bl1WQHYlomgPuGe0N8y70F92YFUXW4Bompp9TrScjOiIPDSCM+ID0YXeqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	//체크박스 전체 선택 & 해제
	$(document).ready(function(){
		
		ChartAjax('${path}/admin/user-chart', '#userChart', 'userf', 'bar', '유저현황', ['rgba(200,0,0,.5)','yellow','pink'], ['gray','gray','gray','gray','gray']);
		
		$("#ck_all").click(function(){
				if($("#ck_all").prop("checked")){
					$("input[type=checkbox]").prop("checked",true);
				}else{
					$("input[type=checkbox]").prop("checked",false);
				}
			});
		
// 		$("#fiveBtn").on("click",function(){
// 			$("#threePageBox").hide();
			
// 		});
		
	});
	
	function eachFiveDelete($this){
		let result= confirm("해당 유저를 비활성화시키시겠습니까?");
		if(result){
				var form = $this.parentElement;
	 			console.log(form);
				form.action = "delete-five";
				form.method="post";
				form.submit();	
				alert("완료!");
		}	
		
	}
	function eachThreeUpdate($this){
		let result = confirm("해당 유저를 경고 처리하시겠습니까?");
		if(result){
			let form = $this.parentElement;
			console.log(form);
			form.action = "update-three"
			form.method="post";
			form.submit();
			alert("완료!");
		}
	}
	
	function ChartAjax(url, box, key, type, label, bglist, hoverlist=[]){		
		$.ajax({
			type : 'get',
			url : url,
			dataType : 'json',
			success : function(data, xhr) {
				console.log(data);

				var labels = [];
				var myData = [];
				//맵안에서 list였으니 for문으로 돌린다.
				$.each(data.list, function(k, v) {
					labels.push(v[key]);
					myData.push(v.count);
					
				});
				var newLabels = labels;
				var newMyData = myData;
				var ctx = $(box);

				
				chart(ctx, type, newLabels, newMyData, label, bglist, hoverlist=[]);

			},
			error : function(status, request, error) {

				alert("에러");
			}

		});
	}
	function chart(ctx,type,labels,data, label, bglist, hoverlist=[]){
		 var dateChart = new Chart(ctx, {
			type: type,
			data: {
				labels: labels,
				datasets:[{
					label: label,
					data: data,
					borderColor:'white',
					borderWidth: 1,
					backgroundColor:bglist,
					hoverBackgroundColor:hoverlist
				}],
			}
		});
	}
</script>
</head>
<body>
<!-- navigation  -->
<header id="header">
<nav id="navigator" class="navbar navbar-expand-lg navbar fixed-top" style="background-color: #5f0080; height: 50px; color:white;">
    <div id="nav" class="container-fluid">
      <a class="navbar-brand mt-1 ml-1" href="#">
        <img alt="아이콘" style="height: auto; width: 100px" src="#">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse align-items-end justify-content-between" id="navbarNav" style="background-color :#5f0080;">
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">홈</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">메인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">동네</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">카테고리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">채팅</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">관리자</a>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li><a class="btn">아이콘</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              회원 정보
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="#">회원 정보</a></li>
              <li><a class="dropdown-item" href="#">회원 수정</a></li>
              <li class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">로그아웃</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

 <div id="space"></div>
 

 <!-- --------------서브 tab-------------- -->
 <div class="pt-2 mt-2 rounded-lg" style="background-color: #F1F2F5;">
    <div class="flex">
         <div id="blackListA"class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-200">
            <a href="${path }/admin/report?page=1" style="color: gray;">Report</a>
      	</div>   
         <div id="blackListA"class="flex-auto w-10 text-white bg-gray-300 rounded-lg px-0 py-2 hover:bg-gray-200">
            <a href="${path }/admin/blacklist-red?page=1" style="color: white;">blacklist</a>
      	</div>   
         <div id="analysisA" class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-300">
            <a href="${path }/admin/analysis" style="color: gray;">analysis</a>
      	</div>   
    </div>
 </div>
 
  </header>
 
  <!-- --------------content 내  앵커----------------- -->
   <div class="p-3 bg-white mt-6 rounded-lg shadow-md transition-colors duration-500" style="height: 600px;">
      <div class="flex mt-3">
		        <div class="fas" style="margin:0 50px;"> <i class="fas fa-user mr-1" style="color:orange;"></i>
		        	<a href="report?page=1">관리자</a>
		        </div>
		     		<div class="fas" style="margin:0 40px;"><i class="fas fa-address-card" style="color:red;"></i>
		     			<a href="blacklist-red?page=1">5회이상 유저</a>
		     		</div>
		    	  <div class="fas" style="margin:0 40px;"><i class="fas fa-address-card" style="color:blue;"></i>
		    	  	<a href="blacklist-yellow?page=1">3회이상 유저</a>
		    	  </div>
		    	  <div class="fas" style="margin:0 40px;"><i class="fab fa-docker" style="color:green;"></i>
		    	  	<a href="report?page=1#categoryPage">category</a>
		    	  </div>
		    	  <div class="fas" style="margin:0 40px;"><i class="fas fa-chart-bar" style="color:purple;"></i>
		    	  	<a id="threeBtn" href="analysis">Analysis</a>
		    	  </div>
		      </div>
   
      <!-- -----------------------전체 리스트------------------------------ -->  
         <div class="flex">
             <div class="col-6"> 
                <h1 style="font-weight: bold; margin-top: 100px;">BLACK LIST</h1>
                <table style="width:500px;">
                   <thead>
                      <tr>
                         <th><input id="ck_all" type="checkbox" ></th>
                         <th>userID</th>
                         <th>count</th>
                         <th></th>
                      </tr>
                  </thead>
                  <!-- ----------------RED------------------ -->  
                  <tbody>
                  	<c:forEach var="five" items="${flist }">
		                  	<tr>
													<td><input type="checkbox" name="checkRow" value="${five.userid }"></td>       
													<td id="fiveId" value="${five.userid }">${five.userid }</td>           	
													<td>${five.report }</td>
													<td>
														<form action="" method="">
															<input type="hidden" name="userid" value="${five.userid }" >														
															<input type="hidden" id="fiveCount" name="fiveCount" value="${five.report }" >														
															<a href="#" id="eachFiveDelete" onclick="eachFiveDelete(this)" >비활성화</a>
														</form>
													</td>           	
		                  	</tr>
		                </c:forEach> 
		                <!-- --------------yellow------------------ -->  
		                <c:forEach var="three" items="${tlist }">
		                  	<tr>
													<td><input type="checkbox"></td>       
													<td>${three.userid }</td>           	
													<td>${three.report }</td>
													<td id="target" value="${three.userid }">
														<form action="" method="">
															<input type="hidden" id="threeId" name="userid" value="${three.userid }" >														
															<input type="hidden" id="threeCount" name="flag" value="${three.flag }" >					
															<a href="#" id="eachThreeUpdate" onclick="eachThreeUpdate(this)">경고</a>									
														</form>
													</td>           	
		                  	</tr>
		                </c:forEach>  	 	
		                
                  </tbody>
             	</table>
             	<!-- --------------RED BUTTON------------------ -->  
             	<div id="fivePageBox">
									 <ul class="nav justify-content-center">
										  <c:if test="${pageMaker.prev}">
										   	<li class="nav-item">
										   		<a class="nav-link text-black" href="blacklist-red?page=${pageMaker.startPage - 1}">이전</a>
										    </li>
										  </c:if> 
										  
										  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										 	  <li class="nav-item">
										 	  	<a class="nav-link text-black" href="blacklist-red?page=${idx}">${idx}</a>
										 	  </li>
										  </c:forEach>
										    
										  <c:if test="${pageMaker.next && pageMakerF.endPage > 0}">
										  	 <li class="nav-item">
										  	   <a class="nav-link text-black" href="blacklist-red?page=${pageMaker.endPage + 1}">다음</a>
										  	</li>
										  </c:if> 
									 </ul>
							</div>
							<!-- --------------YELLOW BUTTON------------------ -->  
             	<div id="threePageBox">
									 <ul class="nav justify-content-center">
										  <c:if test="${pageMakerT.prev}">
										   	<li class="nav-item">
										   		<a class="nav-link text-black" href="blacklist-yellow?page=${pageMakerT.startPage - 1}">이전</a>
										    </li>
										  </c:if> 
										  
										  <c:forEach begin="${pageMakerT.startPage}" end="${pageMakerT.endPage}" var="idx">
										 	  <li class="nav-item">
										 	  	<a class="nav-link text-black" href="blacklist-yellow?page=${idx}">${idx}</a>
										 	  </li>
										  </c:forEach>
										    
										  <c:if test="${pageMakeTr.next && pageMakerT.endPage > 0}">
										  	 <li class="nav-item">
										  	   <a class="nav-link text-black" href="blacklist-yellow?page=${pageMaker.endPage + 1}">다음</a>
										  	</li>
										  </c:if> 
									 </ul>
							</div>
            </div>
            <!-- ------ 그래프 -------- -->
            <div class="col mt-20" style="width:500px; height: 400px;">
           	<canvas id="userChart"></canvas>
           </div> 
           </div>
  	 </div>

		

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>


</body>
</html>