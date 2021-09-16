<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
  <h1>상세 페이지</h1>
  <form action="/market/chatroom" method="POST">
    BOARDID : <input type="text" name="boardId"> <br>
    author : <input type="text" name="author"> <br>
    <input type="submit" value="채팅하기">
  </form>
    아이디 : ${sessionScope.id } <br>
</body>
</html>