<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/assets/css/blacklist.css">
<script type="text/javascript">


function deleteReport($this){
	var result= confirm("작업이 완료 되셨습니까?");
	if(result){
			var form = $this.parentElement;
// 			console.log(form);
			form.action = "delete-report";
			form.method="post";
			form.submit();	
	}	
}	

function insertCategory($this){
	let result = confirm("카테고리를 추가합니다.");
	if(result){
		var form = $this.parentElement;
		console.log(form);
		form.action = "insert-category";
		form.method = "post";
		form.submit();
		alert("완료!");
	}
	
}

</script>
</head>
<body>
<!-- navigation  -->
<header id="header">
		<!-- navigation  -->
		<div class="nav justify-content-center" style="background-color: #5f0080;">
          <nav class="navbar navbar-expand-lg navbar">
<!--       아이콘 -->
		          <div @click.away="open = false" class="relative" x-data="{ open: false }">
		              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
		                  <img alt="아이콘" style="height: 30px; width: 100px; color: white; border: 1px solid #5f0080;" src="#"> 
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
                            <a href="${path }/login/signin"><span>로그아웃</span></a>
                        </button>
                    </div>
                  </div>		                      
              </div>
          </nav>
     </div>

<!--  <div id="space"></div> -->
 

 <!-- --------------서브 tab-------------- -->
 <div class="pt-2 mt-2 rounded-lg" style="background-color: #F1F2F5;">
    <div class="flex">
         <div id="blackListA"class="flex-auto w-10 text-white bg-gray-300 rounded-lg px-0 py-2 hover:bg-gray-200">
            <a href="${path }/admin/report?page=1" style="color: white;">Report</a>
      	</div>   
         <div id="blackListA"class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-200">
            <a href="${path }/admin/blacklist-red?page=1" style="color: gray;">blacklist</a>
      	</div>   
         <div id="analysisA" class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-300">
            <a href="${path }/admin/analysis" style="color: gray;">analysis</a>
      	</div>   
    </div>
 </div>
 
  </header>
 
     <!-- ---------2페이지----카테고리 등록란------ -->		
		<div class="flex-auto" style="height: 600px;">   
			<div class="p-6 mt-6 mb -6 rounded-lg shadow-md" style="height: 600px; background-color: #F2F5FC;" >
				<!-- 네브 바 -->
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
		    	  <div class="fas" style="margin:0 40px;"><i class="fas fa-check" style="color:red;"></i>
		    	  	<a href="#categoryPage">카테고리</a>
		    	  </div>
		   
		      </div>
		      <!--------내용 기입란-------->
		      <div id="categoryPage" class="container">
		      	 <div class="row justify-content-around">
		      		<div class="col-4" style="margin-top: 50px;">
				      	 <div style="height:400px; width:600px;"> 
								  <div class="flex"
								  	style="background-image: url('${path}/assets/img/admin/register.jpg'); height: 450px;">
								  	
								  	<div class="flex-auto" style="background-color: white; border-radius: 4px; width: 60px; height: 50px; border: 1px solid gray;">
								  		<h1>카테고리 등록</h1>
								  	</div>
		              </div>
					      </div>
		      		</div>
		      		
		      		<div class="col-4">
		      	<!-- 표 기입 -->
				        <div  class="row justify-content-end" style="margin-top: 50px;">
								  <div class="p-10 mt-6 rounded-lg shadow-md ">
		                <div class="flex">
		                  <div class="flex-auto" >
		               			 <p style="text-align: center; color: black; font-weight: bold;">기존 카테고리를 확인해주세요!</p>
		                  </div>
		                </div>
		              </div>`
					      </div>
			      <!-- 등록내용 기입 -->
				        <div class="row justify-content-end" style="margin:0 auto;">
								  <div class="p-20 bg-white mt-6 rounded-lg shadow-md ">
		                <div class="flex">
		                   <div class="flex-auto">
		                   
				               <form action="" method="" class="flex">
		               			 <input type="text" name="categoryname" placeholder="CategoryName" class="flex-auto"><br>
		                    	<a href="#categoryPage" class="flex-auto text-white bg-red-500 rounded-lg px-2 py-2" onclick="insertCategory(this)">
		                    	 등록
		                    	</a>
				               </form>
		                   	</div>
		                   
		                   
		                </div>
		              </div>
					      </div>
		      		</div>
		      	</div>
		      </div>
		   </div>	  
		</div>	
  
 <!-- --------------content---신고내역------------------ -->
 <!-- --------------전체 리스트------------------ -->
   <div class=" p-3 bg-white mt-6 rounded-lg shadow-md" style="height: 700px;">
     <div class="flex mt-3" >
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
      <!--  -->
         <div class="flex mt-10" >
             <div class="flex-auto"> 
                <h1>Report List</h1>
                <table>
                   <thead>
                      <tr>
                         <th>no</th>
                         <th>title</th>
                         <th>userid</th>
                         <th> </th>
                      </tr>
                  </thead>
                  <tbody id="reportList">
                  	<c:forEach var="report" items="${list}">
                  		<tr class="reportBox" style="text-align: center;">
                  			<td  value="${report.reportid }">${report.reportid }
                  			</td>
                  			<td style="width:200px;" value="${report.report_title }">${report.report_title }
                  			</td>
                  			<td  value="${report.userid }">${report.userid } 
                  			</td>
                  			<input id="reportid" type="hidden"name="reportid" value="${report.reportid }"> 
                  			<input id="reportTitle" type="hidden" name="reportTitle" value="${report.report_title}"> 
                  			<input id="userId" type="hidden"name="userId" value="${report.userid }">
                  			<input id="reportContent" type="hidden" name="reportContent" value="${report.report_content}"> 
                  			<td >
												<form action="" method="">
	                  			<a href="#" id="reportBtn" class="rounded-lg py-1 px-2" onclick="deleteReport(this)">확인</a>
	                  			<input id="reportid" type="hidden"name="reportid" value="${report.reportid }"> 
	                  			<input id="reportTitle" type="hidden" name="reportTitle" value="${report.report_title}"> 
	                  			<input id="userId" type="hidden"name="userId" value="${report.userid }">
	                  			<input id="reportContent" type="hidden" name="reportContent" value="${report.report_content}"> 
                 	 			</form></td>
                  			<input id="boardTitle" type="hidden" name="boardTitle" value="${report.title}"> 
                  			<input id="boardId" type="hidden" name="boardId" value="${report.boardid}"> 
                  			
<!--                   			<button onclick="detailReport()">상세보기</button> -->
 										  </tr>     
 											
 										</c:forEach>	  
                  </tbody>
             </table>
	             <div>
									 <ul class="nav justify-content-center">
										  <c:if test="${pageMaker.prev}">
										   	<li class="nav-item">
										   		<a class="nav-link text-black" href="report?page=${pageMaker.startPage - 1}">이전</a>
										    </li>
										  </c:if> 
										  
										  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										 	  <li class="nav-item">
										 	  	<a class="nav-link text-black" href="report?page=${idx}">${idx}</a>
										 	  </li>
										  </c:forEach>
										    
										  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										  	 <li class="nav-item">
										  	   <a class="nav-link text-black" href="report?page=${pageMaker.endPage + 1}">다음</a>
										  	</li>
										  </c:if> 
									 </ul>
							</div>
          </div>
 <!-- --------------선택 리스트------------------ -->
						
          <div class="flex-auto mt-20 h-50 shadow-md text-black bg-gray-100">  
             <div class="flex-auto"> 
                <h1>Report Detail Page</h1>
                <div id="detail-box" class="h-full border rounded-xl bg-white m-6 p-4">
                		<div class="h-full border rounded-xl bg-white m-6 p-4">
                		 <div class="flex">
                				<div class="flex-auto">
							      			<h2 id="detail-title">Title</h2>
							      		</div>
							      		<div class="flex-auto">
							        		userid
							      		</div>
							      	</div>
							      </div>
							      <div class="h-full border rounded-xl bg-white m-6 p-4">Content</div> 
							       신고한 게시물
							  </div>
            	</div>
         </div>

				<script>
				$("#reportList").on("click",function(event){
					console.log(event.target.nodeName);
					if(event.target.className="reportBox" || event.target.nodeName=="TR"){
						console.log($(event.target).parent());
						
						let reportBox = $(event.target).parent();
						
						let reportTitle = reportBox.children("input:eq(1)");//input태그의 1번째부터 가져옴(0번 'no'이다)
						let userid = reportBox.children("input:eq(2)");//input태그의 1번째부터 가져옴(0번 'no'이다)
						let reportContent = reportBox.children("input:eq(3)");
						let boardTitle = reportBox.children("input:eq(4)");
						let boardId = reportBox.children("input:eq(5)");
						
						
						let html='';
								 html = '<div class="border rounded-xl bg-white m-3 p-4">'
						       		+ 	'<div class="flex">'
				       				+			'<div class="flex-auto">'
								 			+				'<h2 id="detail-title">Title:'+reportTitle.val()+'</h2>'
								 			+			'</div>'
								 			+			'<div class="flex-auto text-gray-400 h-20">userId:'+userid.val()+'</div>'
					      			+		'</div>'
					      			+	'</div>' 
					       			+'<div class="h-full border rounded-xl bg-white m-6 p-4">'+reportContent.val()+'</div>' 
					       			+'<div><a href="${path}/post/postDetail?boardid='+boardId.val()+'">신고한 게시물 :'+boardTitle.val()+'</a></div>';
					       			
					  $("#detail-box").empty();
						$("#detail-box").append(html); //달라를통해 하나의 객체로 바들어서 그위의 부모객체를 가져옴
						
					}
				});
				
			</script>
          
      </div>
   </div>	
   

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
</body>
</html>