<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
@import
  url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap')
  ;

body {
  font-family: 'Nanum Gothic', sans-serif;
  background-color: #F1F2F5;
}

#space {
  height: 50px;
}

#title {
  font-size: 30px;
  text-align: center;
}

#nav, .btn, .nav-link {
  color: white;
}

.btn, .nav-link:hover {
  color: white;
  text-shadow: 1px 1px 1px white;
}

#blackListA, #analysisA {
  margin: 0 10px;
  width: 10px;
  text-align: center;
  font-size: 20px;
}

.listBtn {
  background-color: #FFF7F1;
  border-radius: 5px;
  margin: 20px auto;
  padding: 6px;
  color: gray;
  box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.2);
}

.listBtn:hover {
  background-color: #F6EBE7;
  color: black;
}

.fas {
  margin: 0 10px;
  color: gray;
}

table {
  margin: 0 auto;
  border-width: 1px;
  color: rgba(0, 0, 0, 0.6);
}

h1 {
  font-size: 20px;
  text-align: center;
  margin-top: 20px;
  margin-bottom: 20px;
}

th {
  width: 120px;
  text-align: center;
}

tr:hover {
  color: black;
  font-weight: 4px;
}
</style>
</head>
<body>
  <!-- navigation  -->
  <header>
    <nav id="navigator" class="navbar navbar-expand-lg navbar fixed-top" style="background-color: #5f0080; height: 70px; color: white;">
      <div id="nav" class="container-fluid">
        <a class="navbar-brand mt-1 ml-1" href="#">
          <img alt="아이콘" style="height: auto; width: 100px" src="#">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse align-items-end justify-content-between" id="navbarNav" style="background-color: #5f0080;">
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
            <li>
              <a class="btn">아이콘</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 회원 정보 </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li>
                  <a class="dropdown-item" href="#">회원 정보</a>
                </li>
                <li>
                  <a class="dropdown-item" href="#">회원 수정</a>
                </li>
                <li class="dropdown-divider"></li>
                <li>
                  <a class="dropdown-item" href="#">로그아웃</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <div id="space"></div>

  <!-- --------------서브 tab-------------- -->
  <div class="pt-2 mt-2 rounded-lg" style="background-color: #F1F2F5;">
    <div class="flex">
      <div id="blackListA" class="flex-auto w-10 text-white bg-gray-300 rounded-lg px-0 py-2 hover:bg-gray-200">
        <a href="#" style="color: white;">blacklist</a>
      </div>
      <div id="analysisA" class="flex-auto w-10 bg-white-300 rounded-lg px-0 py-2 hover:bg-gray-300">
        <a href="#" style="color: gray;">analysis</a>
      </div>
    </div>
  </div>

  <!-- --------------content---red------------------ -->
  <!-- --------------전체 리스트------------------ -->
  <div class="p-3 bg-white mt-6 rounded-lg shadow-md transition-colors duration-500">
    <div class="flex mt-3">
      <div class="grid grid-cols-3 h-10 text-sm text-gray-500">
        <div class="fas">
          <i class="fas fa-user mr-1"></i>관리자
        </div>
        <div class="fas">
          <i class="far fa-clock mr-1"></i>시간
        </div>
      </div>
    </div>
    <div class="flex">
      <div class="flex-auto">
        <h1>blacklist_red 리스트</h1>
        <table>
          <thead>
            <tr>
              <th>
                <input type="checkbox" name="selectUser">
              </th>
              <th>userId</th>
              <th>usercount</th>
              <th>?</th>
              <th>??</th>
            </tr>
          </thead>
        </table>
      </div>
      <!-- --------------선택 리스트------------------ -->
      <div class="flex-auto h-40 shadow-md text-black bg-gray-100">
        <div class="flex-auto">
          <h1>blacklist_select</h1>
          <table class="p-3 bg-white mt-6 rounded-lg transition-colors duration-500">
            <thead>
              <tr>
                <th>
                  <input type="checkbox" name="selectUser">
                </th>
                <th>userId</th>
                <th>usercount</th>
                <th>?</th>
                <th>??</th>
              </tr>
            </thead>
          </table>
        </div>
        <div class="flex text-black bg-white-50">
          <button class="listBtn">경고</button>
          <button class="listBtn">비활성화</button>
        </div>
      </div>
    </div>
  </div>
  <!-- --------------content---yellow------------------ -->

  <!-- --------------전체 리스트------------------ -->
  <div class="p-6 bg-white mt-6 rounded-lg shadow-md transition-colors duration-500 hover:bg-green-100">
    <div class="flex mt-3">
      <div class="grid grid-cols-3 h-10 text-sm text-gray-500">
        <div class="fas">
          <i class="fas fa-user mr-1"></i>관리자
        </div>
        <div class="fas">
          <i class="far fa-clock mr-1"></i>시간
        </div>
      </div>
    </div>
    <div class="flex">
      <div class="flex-auto">
        <h1>blacklist_yellow 리스트</h1>
        <table>
          <thead>
            <tr>
              <th>
                <input type="checkbox" name="selectUser">
              </th>
              <th>userId</th>
              <th>usercount</th>
              <th>?</th>
              <th>??</th>
            </tr>
          </thead>
        </table>

      </div>
      <!-- --------------선택리스트------------------ -->
      <div class="flex-auto h-40 shadow-md text-black bg-gray-100">
        <div class="flex-auto">
          <h1>yellow_select</h1>
          <table class="p-3 bg-white mt-6 rounded-lg transition-colors duration-500">
            <thead>
              <tr>
                <th>
                  <input type="checkbox" name="selectUser">
                </th>
                <th>userId</th>
                <th>usercount</th>
                <th>?</th>
                <th>??</th>
              </tr>
            </thead>
          </table>
        </div>
        <div class="flex text-black bg-white-50">
          <button class="listBtn">경고</button>
          <button class="listBtn">비활성화</button>
        </div>
      </div>
    </div>
  </div>

</body>
</html>