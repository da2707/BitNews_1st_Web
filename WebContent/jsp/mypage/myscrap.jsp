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
      <li class="active"><a href="#">스크랩</a></li>
      <li><a href="used">내 글</a></li>
      <li><a href="comment">내 댓글</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>

<h1>나의 스크랩</h1>
<br>

<div class="w3-container">

  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th>클립 번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>기사 번호</th>
        <th></th>
      </tr>
    </thead>
    <c:forEach var="scrap" items="${list}">
      <tr>
      <td>${scrap.scrapNo}</td>
      <td><a href="${pageContext.request.contextPath}/newsDetail?no=${scrap.articleNo}">${scrap.articleTitle}</a></td>
      <td>${scrap.articleSummary}</td>
      <td><fmt:formatDate value="${scrap.scrapDate}" pattern="yyyy-MM-dd" /></td>
      <td>
      <a href="#" onclick="doDelete(${scrap.scrapNo});">
      <img src="../images/delete.png" style="width: 20px; height: 20px;">
      </a>
      </td>
      </tr>
    </c:forEach>     
    <c:if test="${empty list}"> 
   <tr>
   <td colspan="4" align="center">데이터가 존재하지 않습니다.</td>
   </tr>
   </c:if>
    </table>
</div>

<script>
function doDelete(scrapNo){
	if(confirm("스크랩을 취소하시겠습니까?") == true){
		$.ajax({
			url:"/mini_2nd/ajax/dScrap",
			data:`id=${sessionScope.user.userId}&scrapNo=`+scrapNo,
			success:function(){
				location.href = "/mini_2nd/mypage/scrap";
			}
		})
	}else{
		return;
	}
}
</script>
</body>
</html>