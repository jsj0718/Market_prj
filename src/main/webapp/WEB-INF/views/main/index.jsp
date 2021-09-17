<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/assets/css/index.css">

<script>
  const gotoDetail = function(boardid) {
    console.log(1);
    if (boardid != null && boardid != "") {
      console.log(2);
      location.href = "${path}/post/postDetail?boardid=" + boardid;
    }
  }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/assets/js/index.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

<title>MAIN</title>
</head>
<body>

  <header>

    <!-- 상단 네브바 -->
    <nav class="navbar navbar-expand-lg navbar fixed-top" style="background-color: white; height: 40px; color: white;">
      <div id="nav" class="container-fluid justify-content-end">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
          <c:if test="${userid eq 'admin'}"> 
        <div>
          <ul class="nav justify-content-end" style="background-color: white">
            <li class="nav-item"><a class="nav-link text-black" href="${path}/admin/analysis">관리자</a></li>
          </ul>
        </div>
          </c:if>
      </div>
    </nav>

    <!--     중간 네브바 _ 아이콘 -->
    <div class="container-fluid h-10 mb-20 mt-10">
      <div class=" h-10 mb-20 mt-10 justify-content-center">
        <a class="navbar-brand mt-1 ml-1" href="#"> <img src="assets/img/main/1.png" alt="아이콘" style="height: auto; margin: 0 auto; width: 100px" src="#">
        </a>
      </div>
    </div>

    <!--     하단 네브바 -->
    <div class="nav justify-content-center" style="background-color: #5f0080;">
      <nav class="navbar navbar-expand-lg navbar">
        <div class="collapse navbar-collapse">
          <ul class="nav justify-content-center" style="background-color: #5f0080; width: 1200px; height: 40px; color: white;">

            <!--         홈 -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <span>홈</span>
              </button>
            </div>

            <!--         내 동네 -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" id="my_location" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <span>내 동네</span>
                <svg fill="currentColor" viewBox="0 0 20 20" :class="{'rotate-180': open, 'rotate-0': !open}" class="inline w-4 h-4 mt-1 ml-1 transition-transform duration-200 transform md:-mt-1">
                  <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
              </button>
              <div id="drop-down" x-show="open" x-transition:enter="transition ease-out duration-100" x-transition:enter-start="transform opacity-0 scale-95" x-transition:enter-end="transform opacity-100 scale-100" x-transition:leave="transition ease-in duration-75" x-transition:leave-start="transform opacity-100 scale-100" x-transition:leave-end="transform opacity-0 scale-95" class="absolute right-0 w-full mt-2 origin-top-right rounded-md shadow-lg">
                <div class="px-2 py-2 bg-white rounded-md shadow dark-mode:bg-gray-800">
                  <c:forEach items="${mList}" var="mvo">
                    <div id="addressList">
                      <button id="address-name" class="text-black block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline my-address" value="${mvo.addressName}">${mvo.addressName}</button>
                    </div>
                  </c:forEach>
                  <a id="location_add" class="text-black block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline" href="#">+</a>
                </div>
              </div>
            </div>

            <!--         카테고리                       -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <span>카테고리</span>
                <svg fill="currentColor" viewBox="0 0 20 20" :class="{'rotate-180': open, 'rotate-0': !open}" class="inline w-4 h-4 mt-1 ml-1 transition-transform duration-200 transform md:-mt-1">
                  <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
              </button>
              <div id="drop-down" x-show="open" x-transition:enter="transition ease-out duration-100" x-transition:enter-start="transform opacity-0 scale-95" x-transition:enter-end="transform opacity-100 scale-100" x-transition:leave="transition ease-in duration-75" x-transition:leave-start="transform opacity-100 scale-100" x-transition:leave-end="transform opacity-0 scale-95" class="absolute right-0 w-full mt-2 origin-top-right rounded-md shadow-lg">
                <div class="px-2 py-2 bg-white rounded-md shadow dark-mode:bg-gray-800">
                  <c:forEach items="${categoryList}" var="mvo">
                    <div id="categoryList">
                      <button id="category-name" class="text-black block px-4 py-2 mt-2 text-sm font-semibold bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:hover:bg-gray-600 dark-mode:focus:bg-gray-600 dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:text-gray-200 md:mt-0 hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline categories" value="${mvo.categoryName}">${mvo.categoryName}</button>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>

            <!--         채팅        -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button onclick="location.href='chatroom' " @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <span>채팅</span>
              </button>
            </div>
            <!--         마이페이지        -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button onclick="location.href='mypage' " @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <span>마이페이지</span>
              </button>
            </div>
          </ul>
        </div>
      </nav>
    </div>


    </div>
    </div>
    </div>
  </header>

  <!-- ----body -------->
<body>
  <!-- --------------썸네일------------------ -->
  <div class="p-3 bg-white mt-6 rounded-lg shadow-md transition-colors duration-500">
    <div id="slide" val="1" mx="3">
      <li id="img1"><img src="assets/img/main/img1.jpg" alt="이미지1" /></li>
      <li id="img2"><img src="assets/img/main/img3.jpg" alt="이미지2" /></li>
      <li id="img3"><img src="assets/img/main/img4.jpg" alt="이미지3" /></li>
    </div>
  </div>

  <h1>우리동네 매물</h1>

  </div>
  <div class="p-4" id="search-bar">
    <div class="bg-white flex items-center rounded-full shadow-xl">
      <input class="rounded-l-full w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none" id="search-input" type="text" placeholder="게시글검색">
      <div class="p-2">
        <button id="search-btn" class="bg-purple-500 text-white rounded-full p-2 hover:bg-blue-400 focus:outline-none w-12 h-12 flex items-center justify-center">GO</button>
      </div>
    </div>

  </div>

  <!--  -------------게시글 LIST-------------- -->

  <!-- <div class="min-h-screen bg-gray-100 flex justify-center items-center"> -->
  <div id="board-box" class="grid grid-cols-4 gap-1 place-items-center h-24">

    <c:forEach items="${boardList}" var="mvo">
      <div onclick="location.href='${path}/post/postDetail?boardid=${mvo.boardId}'" class="w- p-6 m-10 bg-white rounded-xl shadow-xl hover:shadow-2xl hover:scale-105 transition-all transform duration-500">
        <img class="w-64 object-cover rounded-t-md" src="${path}/${mvo.img}" alt="이미지" />
        <div class="mt-4">
          <h1 class="text-2xl font-bold text-gray-700">${mvo.title}</h1>
          <p class="text-base mt-2 text-gray-700">${mvo.addressName}</p>
          <p class="text-sm mt-2 text-gray-700">${mvo.regdate}</p>
          <div class="mt-4 mb-2 flex justify-between pl-4 pr-2">
            <button class="block text-xl font-semibold text-gray-700 cursor-auto">${mvo.price}원</button>
            <button class="text-lg block font-semibold py-2 px-6 text-white-100 hover:text-white bg-purple-400 rounded-lg shadow hover:shadow-md transition duration-300">Buy</button>
          </div>
        </div>
      </div>
    </c:forEach>

  </div>
  <div class="write-btn" onclick='location.href="${path}/post"'>
    <button class="p-0 w-12 h-12 bg-purple-600 rounded-full hover:bg-blue-700 active:shadow-lg mouse shadow transition ease-in duration-200 focus:outline-none">
      <svg viewBox="0 0 20 20" enable-background="new 0 0 20 20" class="w-6 h-6 inline-block">
            <path fill="#FFFFFF" d="M16,10c0,0.553-0.048,1-0.601,1H11v4.399C11,15.951,10.553,16,10,16c-0.553,0-1-0.049-1-0.601V11H4.601
                                    C4.049,11,4,10.553,4,10c0-0.553,0.049-1,0.601-1H9V4.601C9,4.048,9.447,4,10,4c0.553,0,1,0.048,1,0.601V9h4.399
                                    C15.952,9,16,9.447,16,10z" />
          </svg>
    </button>
  </div>

</body>
</html>