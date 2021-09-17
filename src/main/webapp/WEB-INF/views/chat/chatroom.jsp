<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- contextPath -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/assets/css/chat.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  let roomNum = 0;  // 채팅방 번호
  let cnt = 0;  // 방 호출 횟수 (처음만 스크롤 맨 아래로 두기)
  let maxHeight = 0; // 대화창의 최대 높이
  let currHeight = 0; // 현재 대화창에서의 높이(위치)
  let otherPerson = ""; // 대화 상대 아이디
  
  // 대화하기 버튼으로 들어온 경우 현재 채팅방 번호 설정
  if ("${currRoomId}" != null && "${currRoomId}" != "") {
    roomNum = "${currRoomId}";
  }
  
  // 읽음 표시
  const changeReadMsg = function(roomid) {
    $.ajax({
      url: "${path}/chatroom/refresh",
      type: "post",
      data: {"roomId" : roomid},
      dataType: "json",
      success: function(data) {
      },
      error: function(request, status, error) {
      }
    });
  }
  
  // 대화 내용 추가 (조회, 입력)
  const addDialog = function(data, userId) {
    for (let i=0; i<data.length; i++) {
//       console.log(data[i].chatTime);
      
      if (userId == data[i].toId) {
        $('#msg_history')
          .append($('<div>')
            .attr('class', 'incoming_msg')
//             .append($('<div>')
//               .attr('class', 'incoming_msg_img')
//               .append($('<img>')
//                 .attr('src', 'https://ptetutorials.com/images/user-profile.png')
//                 .attr('alt', 'sunil')
//               )
//             )
            .append($('<div>')
              .attr('class', 'recieved_msg mb-4')
              .append($('<div>')
                .attr('class', 'received_withd_msg')
                .append($('<p>')
                  .text(data[i].chatContent)    
                )
                .append($('<span>')
                  .attr('class', 'time_date')
                  .text(data[i].fromId + ' | ' + data[i].chatTime)
                )
              )
            )
          )
      } else {
        $('#msg_history')
          .append($('<div>')
            .attr('class', 'outgoing_msg')
            .append($('<div>')
              .attr('class', 'sent_msg')
              .append($('<p>')
                .text(data[i].chatContent)
              )
              .append($('<span>')
                .attr('class', 'time_date')
                .text(data[i].chatTime)
              )
            )
          )
      }
    }  
  }
  
  // 채팅 목록 추가 (대화 상대)
  const addChatList = function(data, userId) {
    for (let i=0; i<data.length; i++) {
      
      let person = "";
      if (userId == data[i].fromId) {
        person = data[i].toId;
      } else {
        person = data[i].fromId;
      }
      
      let className = "";
      if (roomNum == data[i].roomId) {
        className = 'chat_list active_chat';
      } else {
        className = 'chat_list';
      }
      
      let chatCtn = "";
      let chatTime = "";
      if (data[i].dataState == "BOTH" || data[i].dataState == userId) {
        chatCtn = data[i].chatContent;
        chatTime = data[i].chatTime;
      } else {
        continue;
      }
      
      let notReadMsgCount = "";
      let countClassName = "";
      
      if (data[i].roomId == roomNum) {
        changeReadMsg(data[i].roomId);
      } else if (data[i].notReadMsgCount != 0) {
        notReadMsgCount = data[i].notReadMsgCount;
        countClassName = "float-end text-center text-white bg-danger rounded-circle";
      } 
      
      let otherPersonImg = "https://ptetutorials.com/images/user-profile.png";
      if (data[i].otherPersonImg != null && data[i].otherPersonImg != "") {
        otherPersonImg = data[i].otherPersonImg;
      }
      
      let boardTitle = "";
      if (data[i].boardTitle != null && data[i].boardTitle != "") {
        boardTitle = "["+data[i].boardTitle+"]";
      }
      
      $('#inbox_chat')
      .append($('<div>')
        .attr('class', className)
        .on('click', function() {showDialog(data[i].roomId)})
        .append($('<div>')
          .attr('class', 'chat_people')
          .append($('<div>')
            .attr('class', 'chat_img')
            .append($('<img>')
              .attr('src', otherPersonImg)
              .attr('alt', 'sunil')
            )
          )
          .append($('<div>')
            .attr('class', 'chat_ib')
            .append($('<h5>')
              .text(person + " " + boardTitle)
              .append($('<span>')
                .attr('class', 'chat_date')
                .text(chatTime)
              )
            )
            .append($('<p>')
              .text(chatCtn)
              .append($('<span>')
                .attr('class', countClassName)
                .attr('style', 'width : 10%;')
                .text(notReadMsgCount)
              )
            )
          )
        ) 
      )
    }
  }
  
  // 채팅 내용 조회
  const showDialog = function(roomid) {
    roomNum = roomid;
    cnt = 0;
    $.ajax({
      url: "${path}/chatroom/chatdialog",
      type: "post",
      data: {"roomId" : roomid},
      dataType: "json",
      success: function(data) {
//         console.log(data);
        
        // 메시지 기록 비우기
        $('#msg_history').empty();
       
        // 본인 아이디 선언
        let userId = "${sessionScope.id}";

        // 상대방 아이디 선언
        if(roomNum != 0 && data.length != 0) {
          if (data[0].fromId == userId) {
            otherPerson = data[0].toId;
          } else if (data[0].toId == userId){
            otherPerson = data[0].fromId;
          }
        }

        addDialog(data, userId); // 채팅 불러오기  
        
        // 대화 시 스크롤 조정을 위한 스크롤 함수
        $('#msg_history').scroll(function() {
          // maxHeigth 설정
          let chatBox = document.getElementById("msg_history");
          if (maxHeight < chatBox.scrollTop) {
            maxHeight = chatBox.scrollTop;
          }
          
          // currHeight 설정
          let scrollT = $(this).scrollTop();
          currHeight = scrollT;
        });
        
        // max와 curr이 같은 경우 맨 아래로 이동
        if (currHeight == maxHeight) {
          scrollDialog();
          currHeight = maxHeight;
        }

        // 처음 조회 시 맨 아래로 이동
        if (cnt == 0) {
          scrollDialog();
          showChatList();
        }
        
      },
      error: function(request, status, error) {
        
      }
    });
  }    
  
  // 채팅 전송하기
  const sendMsg = function() {
    if (roomNum == 0) {
      alert("채팅방을 선택하세요.");
      return;
    }

    let msgContent = document.getElementById("msgContent");
    if (msgContent.value == "") {
      alert("메세지를 입력하세요.");
      return;
    }

    $.ajax({
      url: "${path}/chatroom/chatdialog/" + roomNum,
      type: "post",
      data: JSON.stringify({"roomId" : roomNum, "chatContent" : msgContent.value}),
      dataType: "json",
      contentType: 'application/json',
      success: function(data) {
//         console.log(data);
        
        $('#msg_history').empty();
        msgContent.value = "";
        
        let userId = "${sessionScope.id}";
        
        addDialog(data, userId); // 채팅 추가     
        showChatList(); // 채팅 목록 새로고침
        scrollDialog(); // 스크롤 맨 아래로 이동
      
      },
      error: function(request, status, error) {
        
      }
    });
  };
  
  // 채팅 목록 보기
  const showChatList = function() {
    $.ajax({
      url: "${path}/chatroom-info",
      type: "post",
      success: function(data) {
//         console.log(data);
        
        let userId = "${sessionScope.id}";
        
        // 채팅 목록 초기화        
        $('#inbox_chat').empty();
        if (data.length != 0) {
          addChatList(data, userId); 
        }
      },
      error: function(request, status, error) {
        
      }
    });
  }
  
  // 채팅방 나가기
  const exitDialog = function() {
    if (roomNum == 0 || otherPerson == "") {
      alert("대화창을 선택하세요.");
      return;
    }

    if (!confirm("채팅방을 나가시겠습니까?")) {
      return;
    }
    
//     console.log(roomNum);
//     console.log(otherPerson);
    
    $.ajax({
      url: "${path}/chatroom/exit/" + roomNum,
      type: "post",
      data: {"person" : otherPerson},
      dataType: "json",
      success: function(data) {
        
        $('#inbox_chat').empty();
        
      },
      error: function(request, status, error) {
        
      }
    });
  }

  // 모달 값 초기화
  const callModal = function() {
    $('#reportTitle').val('');
    $('#reportContent').val('');
  }
  
  // 신고하기
  const reportUser = function() {
    let reportTitle = $('#reportTitle').val();
    let reportContent = $('#reportContent').val();
    
    if (reportTitle == "" || reportContent == "") {
      alert("제목 또는 내용을 입력하세요.");
      return;
    }
    
    if (roomNum == 0) {
      alert("채팅방을 선택하세요.");
      return;
    }
    
    if (!confirm("신고하시겠습니까?")) {
      return;
    }
    
    $.ajax({
      url: "${path}/report",
      type: "post",
      data: {"roomId" : roomNum, "reportTitle" : reportTitle, "reportContent" : reportContent},
      dataType: "json",
      success: function(data) {
        if (data == -1) {
          alert("이미 신고한 게시물과 유저입니다.");
        } else if (data == 0 || data == 1) {
          alert("신고 등록에 실패했습니다.");
        } else if (data == 2) {
          alert("신고 등록에 성공했습니다.");
        }
        
        $('#closeReportBtn').click();
        
      },
      error: function(request, status, error) {
      }
    });
  }

  // 엔터키 누를 시 전송
  const enterkey = function() {
    if (window.event.keyCode == 13) {
      sendMsg();
    }
  }

  // 스크롤 함수
  const scrollDialog = function() {
    let chatBox = document.getElementById("msg_history");
    chatBox.scrollTop = chatBox.scrollHeight; // 대화 시 스크롤 조정
    maxHeight = chatBox.scrollTop;
  }

  // 반복해야 하는 함수
  const refreshMethod = function() {
    showDialog(roomNum);
    showChatList();
    cnt++;
  };

  // 최초 실행 후 반복 실행
  function startInterval(seconds, callback) {
    showDialog(roomNum);
    showChatList();
    return setInterval(callback, seconds * 1000);
  }

  startInterval(5, refreshMethod);
</script>
</head>
<body>
  <!-- navigation  -->
  <header>
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
          <ul class="nav justify-content-center" style="background-color: #5f0080; width: 1200px; height: 40px; color: white;">
            <!-- 홈 -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <a href="${path }/index">
                  <span>홈</span>
                </a>
              </button>
            </div>
            <!-- 채팅 -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <a href="${path }/chatroom">
                  <span>채팅</span>
                </a>
              </button>
            </div>
            <!-- 마이페이지 -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <a href="${path }/mypage">
                  <span>마이페이지</span>
                </a>
              </button>
            </div>
            <!-- 관리자 -->
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <a href="${path }/admin/report">
                  <span>관리자</span>
                </a>
              </button>
            </div>
          </ul>
          <!-- 로그아웃 -->
          <div class="nav justify-content-end" style="margin-right: 0; color: white;">
            <div @click.away="open = false" class="relative" x-data="{ open: false }">
              <button @click="open = !open" class="nav-item flex flex-row items-center w-full px-4 py-2 mt-2 text-sm font-semibold text-left bg-transparent rounded-lg dark-mode:bg-transparent dark-mode:focus:text-white dark-mode:hover:text-white dark-mode:focus:bg-gray-600 dark-mode:hover:bg-gray-600 md:block hover:text-gray-900 focus:text-gray-900 hover:bg-gray-200 focus:bg-gray-200 focus:outline-none focus:shadow-outline">
                <a href="${path }/login/signin">
                  <span>로그아웃</span>
                </a>
              </button>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </header>
  
  <!-- 채팅 -->
  <div id="space" style="height:100px;"></div>
  <div class="container">
    <div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Chatting</h4>
            </div>
          </div>
          <div class="inbox_chat" id="inbox_chat" onclick="showChatList();">
          </div>
        </div>
        <div class="mesgs" id="chatbox">

          <div class="dropdown d-flex justify-content-end">
            <button class="btn btn-light" type="button" id="chatMenu" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-align-justify"></i></button>
            <ul class="dropdown-menu bg-light" aria-labelledby="chatMenu">
              <li>
                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#reportModal" onclick="callModal();">신고하기</a>
              </li>
              <li>
                <a class="dropdown-item" onclick="exitDialog();">채팅방 나가기</a>
              </li>
            </ul>
          </div>

          <div class="msg_history" id="msg_history">
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="메시지를 입력하세요." id="msgContent" onkeyup="enterkey();"/>
              <button class="msg_send_btn" id="sendBtn" type="button" onclick="sendMsg();">
                <i class="fas fa-paper-plane"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <p class="text-center top_spac">
        Developed By Sejin
      </p>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="reportModalLabel">Report</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="reportTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="reportTitle" placeholder="제목" required>
          </div>
          <div class="mb-3">
            <label for="reportContent" class="form-label">내용</label>
            <textarea class="form-control" id="reportContent" rows="3" placeholder="내용" required></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" onclick="reportUser();">신고</button>
          <button type="button" class="btn btn-secondary" id="closeReportBtn" data-bs-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>