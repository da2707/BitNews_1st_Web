<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  #buttons{text-align: right;}
  
  .form-horizontal{
  width: 580px;
  padding-right:15px;
  padding-left: 15px;
  margin-right:auto;
  margin-left:auto;
  margin-top:100px;
  margin-bottom:auto;
  }
  .sign-form{
  size:30;
  }
  h2{
  text-align: center;
  margin-bottom:60px;
  margin-right:90px;
  }
  </style>
</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">관리자페이지</a>
    </div>
    <ul class="nav navbar-nav">
<!--       <li class="active"><a href="#">게시글 관리</a></li> -->
<!--       <li><a href="/mypage/scrap">댓글 관리</a></li> -->
<!--       <li><a href="used">회원 관리</a></li> -->
      <li><a href="<c:url value="/articlecrawling" />">Crawling</a></li>
      <li><a href="<c:url value="/capture" />">Capture</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>

<!-- <form class="form-horizontal" action="/mini_2nd/jsp/mypage/userupdate"> -->
<!--   <h2>회원정보수정</h2> -->
<!--   <div class="form-group"> -->
<!--     <label for="inputPW" class="col-sm-2 control-label">PW</label> -->
<!--     <div class="col-sm-10"> -->
<!--       <input type="password" class="sign-form" id="inputPW" placeholder="비밀번호를 입력하세요"  size="30"> -->
	       
<!--     </div> -->
<!--   </div> -->
<!--   <div class="form-group"> -->
<!--     <label for="inputPW" class="col-sm-2 control-label">PW 확인</label> -->
<!--     <div class="col-sm-10"> -->
<!--       <input type="password" class="sign-form" id="checkPW" placeholder="비밀번호를 한번 더 입력하세요" size="30"> -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="form-group"> -->
<!--     <label for="inputPW" class="col-sm-2 control-label">NAME</label> -->
<!--     <div class="col-sm-10"> -->
<!--       <input type="text" class="sign-form" id="inputName" placeholder="이름을 입력하세요"  size="30"> -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="form-group"> -->
<!--     <label for="inputPW" class="col-sm-2 control-label" >E-MAIL</label> -->
<!--     <div class="col-sm-10"> -->
<!--       <input type="text" class="sign-form" id="inputEmail" placeholder="E-MAIL주소를 입력하세요"  size="30"> -->
<!--     </div> -->
<!--   </div> -->
<!-- <button type="submit" class="btn btn-default">정보수정</button> -->
<!-- </form> -->

<footer id="buttons">
<!-- <button type="button" class="btn btn-default" onclick="location.href='passchange'">비밀번호 변경</button> -->
<!-- <button type="button" class="btn btn-default" onclick="location.href='leave'">탈퇴</button> -->
</footer>
</body>
</html>