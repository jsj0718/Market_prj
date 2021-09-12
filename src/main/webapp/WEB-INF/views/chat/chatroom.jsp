<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/chat.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script>
  let roomNum = 0;  // 채팅방 번호
  let cnt = 0;  // 방 호출 횟수 (처음만 스크롤 맨 아래로 두기)
  
  // 대화 내용 추가 (조회, 입력)
  const addDialog = function(data, userId) {
    for (let i=0; i<data.length; i++) {
      console.log(data[i].chatTime);
      
      if (userId == data[i].toId) {
        $('#msg_history')
          .append($('<div>')
            .attr('class', 'incoming_msg')
            .append($('<div>')
              .attr('class', 'incoming_msg_img')
              .append($('<img>')
                .attr('src', 'https://ptetutorials.com/images/user-profile.png')
                .attr('alt', 'sunil')
              )
            )
            .append($('<div>')
              .attr('class', 'recieved_msg')
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
      
      $('#inbox_chat')
      .append($('<div>')
        .attr('class', className)
        .on('click', function() {showDialog(data[i].roomId)})
        .append($('<div>')
          .attr('class', 'chat_people')
          .append($('<div>')
            .attr('class', 'chat_img')
            .append($('<img>')
              .attr('src', 'https://ptetutorials.com/images/user-profile.png')
              .attr('alt', 'sunil')
            )
          )
          .append($('<div>')
            .attr('class', 'chat_ib')
            .append($('<h5>')
              .text(person)
              .append($('<span>')
                .attr('class', 'chat_date')
                .text(data[i].chatTime)
              )
            )
            .append($('<p>')
              .text(data[i].chatContent)    
            )
          )
        ) 
      )
    }
  }
  
  // 채팅 내용 조회
  const showDialog = function(roomid) {
    console.log();
    roomNum = roomid;
    cnt = 0;
    $.ajax({
      url: "${path}/chatroom/chatdialog",
      type: "post",
      data: {"roomId" : roomid},
      dataType: "json",
      success: function(data) {
        console.log(data);
        
        $('#msg_history').empty();

        let userId = "${sessionScope.id}";
        addDialog(data, userId);         
        
        if (cnt == 0) {
          scrollDialog();
        }
      
      },
      error: function(request, status, error) {
        
      }
    });
  }    
  
  // 채팅 전송하기
  const sendMsg = function() {
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
        console.log(data);
        
        $('#msg_history').empty();
        msgContent.value = "";
        
        let userId = "${sessionScope.id}";
        
        addDialog(data, userId)        
        showChatList();
        scrollDialog();
      
      },
      error: function(request, status, error) {
        
      }
    });
  };
  
  // 채팅 리스트 보기
  const showChatList = function() {
    $.ajax({
      url: "${path}/chatroom",
      type: "post",
//       data: {"roomId" : roomid},
//       dataType: "json",
      success: function(data) {
        console.log(data);
        
        $('#inbox_chat').empty();
        let userId = "${sessionScope.id}";
        
        addChatList(data, userId);
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
  }
  
  
  showDialog(roomNum);
  showChatList();
  
  // 5초마다 채팅 내용 조회
  setInterval(function() {
    showDialog(roomNum);
    showChatList();
    cnt++;
  }, 5000);

</script>
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
  <div id="space" style="height:100px;"></div>
  <div class="container">
    <div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar" placeholder="Search">
                <span class="input-group-addon">
                  <button type="button">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button>
                </span>
              </div>
            </div>
          </div>
          <div class="inbox_chat" id="inbox_chat" onclick="showChatList();">
          </div>
        </div>
        <div class="mesgs" id="chatbox">
          <div class="msg_history" id="msg_history">
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" id="msgContent" onkeyup="enterkey();"/>
              <button class="msg_send_btn" id="sendBtn" type="button" onclick="sendMsg()">
                <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
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
</body>
</html>