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
      <li><a href="used">내 글</a></li>
      <li class="active"><a href="#">내 댓글</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>

<div class="w3-container">

<h1>내 댓글</h1>
<br>
 
  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th>댓글 번호</th>
        <th>댓글 내용</th>
        <th>작성일</th>
        </tr>
    </thead>
    <c:forEach var="comment" items="${list}">
    <tr>
      <td>${comment.no}</td>
      <td>${comment.content}</td>
      <td><fmt:formatDate value="${comment.reg_date}" pattern="yyyy-MM-dd" /></td>
      
    </tr>
    </c:forEach>
   <c:if test="${empty list}"> 
   <tr>
   <td colspan="3" align="center">데이터가 존재하지 않습니다.</td>
   </tr>
   </c:if>
   </table>
</div>

<script>


</script>
</body>
</html>