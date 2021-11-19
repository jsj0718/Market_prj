<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/assets/css/admin/analysis.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js" integrity="sha512-FoyrIocrD2VGbh1HeDL8s/e+kNw0bl1WQHYlomgPuGe0N8y70F92YFUXW4Bompp9TrScjOiIPDSCM+ID0YXeqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script>
$(document).ready(function(){
	ChartAjax('${path}/admin/age-graph', '#ageBox', 'agerange', 'bar', '유저의 연령대','x',['rgba(200,0,0,.5)','yellow','pink','orange','green'], ['gray','gray','gray','gray','gray']);
	ChartAjax('${path}/admin/daily-graph', '#dailyBox', 'reg', 'bar', '주간 이용률','y',['red','yellow','pink','orange','green'], ['gray','gray','gray','gray','gray']);
	ChartAjax('${path}/admin/gender-graph', '#userBox', 'gender', 'pie', '유저 성별 비율','x', ['pink','blue'], ['gray','gray','gray','gray','gray']);
	ChartAjax('${path}/admin/complete-graph', '#completeBox', 'name', 'bar', '거래완료된 게시물','x', ['rgba(200,0,0,.5)','yellow','pink'], ['gray','gray','gray','gray','gray']);
	ChartAjax('${path}/admin/category-graph', '#categoryBox', 'categoryname', 'bar','카테고리 인기순','x', ['orange','purple','lime','blue'], ['gray','gray','gray','gray','gray']);
	});
	
function ChartAjax(url, box, key, type, label,x, bglist, hoverlist=[]){		
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
			
			chart(ctx, type, newLabels, newMyData, label,x, bglist, hoverlist=[]);
		},
		error : function(status, request, error) {
			alert("에러");
		}
	});
}
function chart(ctx,type,labels,data, label,x, bglist, hoverlist=[]){
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
			}]
		},
	 options:{
			scales:{
				y:{
					min: 1,
					ticks:{
						stepSize: 1
						
					}
					
				}
					
			},
			indexAxis: x,
			}
	});
}
</script>
</head>
<body>

	<header>
		<!-- navigation  -->
		<div class="nav justify-content-center" style="background-color: #5f0080;">
          <nav class="navbar navbar-expand-lg navbar">
<!--       아이콘 -->
		          <div @click.away="open = false" class="relative" x-data="{ open: false }">
		              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
		                  <img src="../assets/img/netchu.png" alt="아이콘" style="height: 30px; width: 100px; color: white; border: 1px solid #5f0080;"> 
		              </button>
		          </div>
              <div class="collapse navbar-collapse">
                  <ul class="nav justify-content-center" style="background-color: #5f0080; width:1200px; height: 40px; color:white; ">
                  
<!--         홈 -->
                      <div @click.away="open = false" class="relative" x-data="{ open: false }">
                          <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                            <a href="${path }/index"><span>홈</span></a>
                          </button>
                      </div>
                      
<!--         채팅        -->
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                             <a href="${path }/chatroom"><span>채팅</span></a>
                        </button>
                    </div>
<!--         마이페이지        -->
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                             <a href="${path }/mypage"><span>마이페이지</span></a>
                        </button>
                    </div>     
<!--         관리자        -->                                   
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                            <a href="${path }/admin/report"><span>관리자</span></a>
                        </button>
                    </div>                    
                   </ul>
<!--         로그아웃        -->
									<div class="nav justify-content-end" style="margin-right: 0; color:white;">                                   
                    <div @click.away="open = false" class="relative" x-data="{ open: false }">
                        <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                            <a href="${path }/signin"><span>로그아웃</span></a>
                        </button>
                    </div>
                  </div>		                      
              </div>
          </nav>
     </div>
	</header>
	<div id="space"></div>
 
	 <!-- --------------서브 tab-------------- -->
	 <div class="mt-2 rounded-lg" style="background-color: #F1F2F5; text-align: center;">
	    <div class="flex">
	        <div id="blackListA" class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-300">
	            <a href="${path }/admin/report?page=1" style="color: gray;">report</a>
	      	</div>
	      	<div id="blackListA"class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-200">
            <a href="${path }/admin/blacklist-red?page=1" style="color: gray;">blacklist</a>
      	  </div>      
	         <div id="analysisA"class="flex-auto w-10 text-white bg-gray-300 rounded-lg px-0 py-2 hover:bg-gray-200">  
	            <a href="${path }/admin/analysis" style="color: white;">analysis</a>
	     	 </div>   
	    </div>
	 </div>


	 <!-- --------------contents_그래프 1페이지-------------- -->
<div id="dailyPage" class="flex-auto">   
	<div class="p-6 bg-white mt-6 mb -6 rounded-lg shadow-md" style="height: 550px;">
      <div class="nav justify-content-center">
      	<nav class="navbar navbar-expand-lg navbar">
          	<div id="navigator" class="collapse navbar-collapse">
          		<ul class="nav justify-content-center">
          			<li class="nav-item" style="margin: 0 30px;">
          				<a class="analysisMove" href="#genderPage"><p>유입성별</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            	<a class="analysisMove" href="#agePage"><p>유입연령층</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            		<a class="analysisMove" href="#dailyPage"><p>날짜별 게시물</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		      				<a class="analysisMove" href="#completePage"><p>거래완료게시물</p></a>
		      			</li> 
		            	<li class="nav-item" style="margin: 0 30px;">
		      					<a class="analysisMove" href="#categoryPage"><p>인기카테고리</p></a>
	      				</li>
    					</ul>
    		 	</div>
    		</nav>		
     </div>
      <!--  -->
    <div class="flex">   
      <div class="flex-auto mt-10" >
           <div class="rounded-lg shadow-md" style="height:400px; width:600px;"> 
						 <canvas id="dailyBox"> </canvas>               
          </div>
      </div>
      <!--  -->
      <div class="flex mt-10" >
		     <div style="height:400px; width:350px; background-color: #F2F5FC; margin-right: 150px;"> 
		     	 <h1 class="mt-10" style="text-align: center; font-size:30px;">주간 이용률</h1>
					 <div class="mt-20" style="text-align: center;">
					 	<p>주간이용률 확인 그래프입니다.<br>
					 		이용률 감소 발생 시 대비해주십시오.
					 	</p>
					 </div>             
	     	 </div>
	     	 <!--  -->
      	 <div class="d-flex justify-content-end mt-10 rounded-lg shadow-md" >
					 <div class="container">
				 			<div class="row">
	        			<div class="fas" style="margin:20px 0;"> <i class="fas fa-user mr-1" style="color:orange;"></i>
			        		<a href="report?page=1">관리자</a>
			        	</div>
				     	</div>
				     	<div class="row">	
				     		<div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:red;"></i>
				     			<a href="blacklist-red?page=1">BlackList</a>
				     		</div>
				    	</div>
				    	<div class="row">	 
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:blue;"></i>
		    	  			<a href="blacklist-yellow?page=1">BlackList</a>
		    	  		</div>
				    	</div>
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 10px;"><i class="fab fa-docker" style="color:green;"></i>
		    	  			<a href="report?page=1#categoryPage"> Category</a>
		    	  		</div>
							</div>     
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-chart-bar" style="color:purple;"></i>
		    	  			<a id="threeBtn" href="analysis"> Analysis</a>
		    	  		</div>
				    	</div>  
         	 	</div>         
      		</div>
     	 </div>
      <!--  -->
   	</div> 
   </div>	  
	</div>
	
	 <!-- --------------contents_그래프 2페이지-------------- -->
<div id="agePage" class="flex-auto">   
	<div class="p-6 bg-white mt-6 mb -6 rounded-lg shadow-md" style="height: 550px;">
      <div class="nav justify-content-center">
      	<nav class="navbar navbar-expand-lg navbar">
          	<div id="navigator" class="collapse navbar-collapse">
          		<ul class="nav justify-content-center">
          			<li class="nav-item" style="margin: 0 30px;">
          				<a class="analysisMove" href="#genderPage"><p>유입성별</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            	<a class="analysisMove" href="#agePage"><p>유입연령층</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            		<a class="analysisMove" href="#dailyPage"><p>날짜별 게시물</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		      				<a class="analysisMove" href="#completePage"><p>거래완료게시물</p></a>
		      			</li> 
		            	<li class="nav-item" style="margin: 0 30px;">
		      					<a class="analysisMove" href="#categoryPage"><p>인기카테고리</p></a>
	      				</li>
    				</ul>
    		 	</div>
    		</nav>		
     </div>
      <!--  -->
    <div class="flex">   
      <div class="flex-auto mt-10" >
           <div class="rounded-lg shadow-md" style="height:400px; width:600px;"> 
						  <canvas id="ageBox"> </canvas>              
          </div>
      </div>
      <!--  -->
      <div class="flex mt-10" >
		      <div style="height:400px; width:350px; background-color: #F2F5FC; margin-right: 150px;"> 
		     	 <h1 class="mt-10" style="text-align: center; font-size:30px;">연령층 분석</h1>
					 <div class="mt-20" style="text-align: center;">
					 	<p>연령대에 따른 이용 분석입니다.<br>
					 		주요 연령대를 target으로 하여<br>
					 		 운영방안을 기획해주십시오.
					 	</p>
					 </div>             
	     	 </div>
	     	 <!--  -->
				 <div class="d-flex justify-content-end mt-10 rounded-lg shadow-md" >
					 <div class="container">
				 			<div class="row">
	        			<div class="fas" style="margin:20px 0;"> <i class="fas fa-user mr-1" style="color:orange;"></i>
			        		<a href="report?page=1">관리자</a>
			        	</div>
				     	</div>
				     	<div class="row">	
				     		<div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:red;"></i>
				     			<a href="blacklist-red?page=1">BlackList</a>
				     		</div>
				    	</div>
				    	<div class="row">	 
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:blue;"></i>
		    	  			<a href="blacklist-yellow?page=1">BlackList</a>
		    	  		</div>
				    	</div>
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 10px;"><i class="fab fa-docker" style="color:green;"></i>
		    	  			<a href="report?page=1#categoryPage"> Category</a>
		    	  		</div>
							</div>     
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-chart-bar" style="color:purple;"></i>
		    	  			<a id="threeBtn" href="analysis"> Analysis</a>
		    	  		</div>
				    	</div>  
         	 	</div>         
      		</div>
     	 </div>
      <!--  -->
   	</div> 
   </div>	  
	</div>
	 <!-- --------------contents_그래프 3페이지-------------- -->
<div id="genderPage" class="flex-auto">   
	<div class="p-6 bg-white mt-6 mb -6 rounded-lg shadow-md" style="height: 550px;">
      <div class="nav justify-content-center">
      	<nav class="navbar navbar-expand-lg navbar">
          	<div id="navigator" class="collapse navbar-collapse">
          		<ul class="nav justify-content-center">
          			<li class="nav-item" style="margin: 0 30px;">
          				<a class="analysisMove" href="#genderPage"><p>유입성별</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            	<a class="analysisMove" href="#agePage"><p>유입연령층</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            		<a class="analysisMove" href="#dailyPage"><p>날짜별 게시물</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		      				<a class="analysisMove" href="#completePage"><p>거래완료게시물</p></a>
		      			</li> 
		            	<li class="nav-item" style="margin: 0 30px;">
		      					<a class="analysisMove" href="#categoryPage"><p>인기카테고리</p></a>
	      				</li>
    				</ul>
    		 	</div>
    		</nav>		
     </div>
      <!--  -->
    <div class="flex">   
      <div class="flex-auto mt-10" >
           <div class="rounded-lg shadow-md" style="height:450px; width:450px;"> 
						  <canvas id="userBox"> </canvas>                  
          </div>
      </div>
      <!--  -->
      <div class="flex mt-10" >
		      <div style="height:400px; width:350px; background-color: #F2F5FC; margin-right: 150px;"> 
		     	 <h1 class="mt-10" style="text-align: center; font-size:30px;">유저의 성별 분석</h1>
					 <div class="mt-20" style="text-align: center;">
					 	<p>이용 고객의 성별 비율입니다.<br>
					 		이를 이용해 홍보방안을 마련해 주십시오
					 	</p>
					 </div>             
	     	 </div>
	     	 <!--  -->
				 <div class="d-flex justify-content-end mt-10 rounded-lg shadow-md" >
					 <div class="container">
				 			<div class="row">
	        			<div class="fas" style="margin:20px 0;"> <i class="fas fa-user mr-1" style="color:orange;"></i>
			        		<a href="report?page=1">관리자</a>
			        	</div>
				     	</div>
				     	<div class="row">	
				     		<div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:red;"></i>
				     			<a href="blacklist-red?page=1">BlackList</a>
				     		</div>
				    	</div>
				    	<div class="row">	 
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:blue;"></i>
		    	  			<a href="blacklist-yellow?page=1">BlackList</a>
		    	  		</div>
				    	</div>
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 10px;"><i class="fab fa-docker" style="color:green;"></i>
		    	  			<a href="report?page=1#categoryPage"> Category</a>
		    	  		</div>
							</div>     
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-chart-bar" style="color:purple;"></i>
		    	  			<a id="threeBtn" href="analysis"> Analysis</a>
		    	  		</div>
				    	</div>  
         	 	</div>         
      		</div>
     	 </div>
      <!--  -->
   	</div> 
   </div>	  
	</div>
	 <!-- --------------contents_그래프 4페이지-------------- -->
<div id="categoryPage" class="flex-auto">   
	<div class="p-6 bg-white mt-6 mb -6 rounded-lg shadow-md" style="height: 550px;">
      <div class="nav justify-content-center">
      	<nav class="navbar navbar-expand-lg navbar">
          	<div id="navigator" class="collapse navbar-collapse">
          		<ul class="nav justify-content-center">
          			<li class="nav-item" style="margin: 0 30px;">
          				<a class="analysisMove" href="#genderPage"><p>유입성별</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            	<a class="analysisMove" href="#agePage"><p>유입연령층</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            		<a class="analysisMove" href="#dailyPage"><p>날짜별 게시물</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		      				<a class="analysisMove" href="#completePage"><p>거래완료게시물</p></a>
		      			</li> 
		            	<li class="nav-item" style="margin: 0 30px;">
		      					<a class="analysisMove" href="#categoryPage"><p>인기카테고리</p></a>
	      				</li>
    				</ul>
    		 	</div>
    		</nav>		
     </div>
      <!--  -->
    <div class="flex">   
      <div class="flex-auto mt-10" >
           <div class="rounded-lg shadow-md" style="height:400px; width:600px;"> 
						  <canvas id="categoryBox" > </canvas>                     
          </div>
      </div>
      <!--  -->
      <div class="flex mt-10" >
		     <div style="height:400px; width:350px; background-color: #F2F5FC; margin-right: 150px;"> 
		     	 <h1 class="mt-10" style="text-align: center; font-size:30px;">카테고리 분석</h1>
					 <div class="mt-20" style="text-align: center;">
					 	<p>카테고리 이용 분석입니다.<br>
					 		이용률이 높은 카테고리의 페이지를<br>
					 		관리해 주십시오.
					 	</p>
					 </div>             
	     	 </div>
	     	 <!--  -->
				 <div class="d-flex justify-content-end mt-10 rounded-lg shadow-md" >
					 <div class="container">
				 			<div class="row">
	        			<div class="fas" style="margin:20px 0;"> <i class="fas fa-user mr-1" style="color:orange;"></i>
			        		<a href="report?page=1">관리자</a>
			        	</div>
				     	</div>
				     	<div class="row">	
				     		<div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:red;"></i>
				     			<a href="blacklist-red?page=1">BlackList</a>
				     		</div>
				    	</div>
				    	<div class="row">	 
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:blue;"></i>
		    	  			<a href="blacklist-yellow?page=1">BlackList</a>
		    	  		</div>
				    	</div>
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 10px;"><i class="fab fa-docker" style="color:green;"></i>
		    	  			<a href="report?page=1#categoryPage"> Category</a>
		    	  		</div>
							</div>     
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-chart-bar" style="color:purple;"></i>
		    	  			<a id="threeBtn" href="analysis"> Analysis</a>
		    	  		</div>
				    	</div>  
         	 	</div>         
      		</div>
     	 </div>
      <!--  -->
   	</div> 
   </div>	  
	</div>
	 <!-- --------------contents_그래프 5페이지-------------- -->
<div id="completePage" class="flex-auto">   
	<div class="p-6 bg-white mt-6 mb -6 rounded-lg shadow-md" style="height: 550px;">
      <div class="nav justify-content-center">
      	<nav class="navbar navbar-expand-lg navbar">
          	<div id="navigator" class="collapse navbar-collapse">
          		<ul class="nav justify-content-center">
          			<li class="nav-item" style="margin: 0 30px;">
          				<a class="analysisMove" href="#genderPage"><p>유입성별</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            	<a class="analysisMove" href="#agePage"><p>유입연령층</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		            		<a class="analysisMove" href="#dailyPage"><p>날짜별 게시물</p></a>
		      			</li>
		            	<li class="nav-item" style="margin: 0 30px;">
		      				<a class="analysisMove" href="#completePage"><p>거래완료게시물</p></a>
		      			</li> 
		            	<li class="nav-item" style="margin: 0 30px;">
		      					<a class="analysisMove" href="#categoryPage"><p>인기카테고리</p></a>
	      				</li>
    				</ul>
    		 	</div>
    		</nav>		
     </div>
      <!--  -->
    <div class="flex">   
      <div class="flex-auto mt-10" >
           <div class="rounded-lg shadow-md" style="height:400px; width:600px;"> 
						   <canvas id="completeBox" > </canvas>                    
          </div>
      </div>
      <!--  -->
      <div class="flex mt-10" >
		     <div style="height:400px; width:350px; background-color: #F2F5FC; margin-right: 150px;"> 
		     	 <h1 class="mt-10" style="text-align: center; font-size:30px;">거래완료 게시물</h1>
					 <div class="mt-20" style="text-align: center;">
					 	<p>거래가 완료된 게시물 분석입니다.<br>
					 		거래완료된 게시물의 특징과 위험도를 <br>
					 		대비해 관리해주십시오.
					 	</p>
					 </div>             
	     	 </div>
	     	 <!--  -->
				 <div class="d-flex justify-content-end mt-10 rounded-lg shadow-md" >
					 <div class="container">
				 			<div class="row">
	        			<div class="fas" style="margin:20px 0;"> <i class="fas fa-user mr-1" style="color:orange;"></i>
			        		<a href="report?page=1">관리자</a>
			        	</div>
				     	</div>
				     	<div class="row">	
				     		<div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:red;"></i>
				     			<a href="blacklist-red?page=1">BlackList</a>
				     		</div>
				    	</div>
				    	<div class="row">	 
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-address-card" style="color:blue;"></i>
		    	  			<a href="blacklist-yellow?page=1">BlackList</a>
		    	  		</div>
				    	</div>
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 10px;"><i class="fab fa-docker" style="color:green;"></i>
		    	  			<a href="report?page=1#categoryPage"> Category</a>
		    	  		</div>
							</div>     
				    	<div class="row">	  
				    	  <div class="fas" style="margin:20px 0;"><i class="fas fa-chart-bar" style="color:purple;"></i>
		    	  			<a id="threeBtn" href="analysis"> Analysis</a>
		    	  		</div>
				    	</div>  
         	 	</div>         
      		</div>
     	 </div>
      <!--  -->
   	</div> 
   </div>	  
	</div>



	
<!--  -->	
</div>	
</div>	
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
</body>
</html>