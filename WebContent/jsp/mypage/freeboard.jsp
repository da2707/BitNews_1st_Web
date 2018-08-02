<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .board{margin-bottom:20px;}
  .board:hover{text-decoration: none;}
  </style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">마이페이지</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="mypagemove">회원정보 수정</a></li>
      <li><a href="scrap">스크랩</a></li>
      <li class="active"><a href="#">내 글</a></li>
      <li><a href="comment">내 댓글</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>

<div class="board">
<a href="#"><strong>자유 게시판 </strong></a> 
<a href="#"><strong>ㅣㅣ</strong></a> 
<a href="used"><strong>중고 게시판 </strong></a> 
<a href="#"><strong>ㅣㅣ</strong></a> 
<a href="article"><strong>기사 게시판 </strong></a> 
</div>

<h1>자유 게시판</h1>
<br>

<div class="w3-container">

  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th>글 번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성일</th>
      </tr>
    </thead>
  <c:forEach var="board" items="${list}">
    <tr>
      <td>${board.no}</td>
      <td><a href="${pageContext.request.contextPath}/freeBoard/detail?no=${board.no}">${board.title}</a></td>
      <td>${board.viewCnt}</td>
      <td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></td>
    </tr>
   </c:forEach>
   <c:if test="${empty list}"> 
   <tr>
   <td colspan="4" align="center">데이터가 존재하지 않습니다.</td>
   </tr>
   </c:if>
  </table>
</div>


</body>
</html>