<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>    
<!DOCTYPE html>
<html> 
<head>
	<meta charset='utf-8'>
	<title>bit news</title>
	<style>
		tdoby {border: 1px solid;}
		div ~ container {width: 90%}
	</style>
</head>
<body>
	<div style="
		 text-align: center;
		 font-size: 40px;
		 font-weight: bold;"
	> 자유 게시판
	</div>
	<div class="container">
	전체 <c:out value="${pageResult.count}"/>개
	<hr>
	
	<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="board" items="${list}">
		<tr>
		<td>${board.no}</td>
		<td><a href='detail?no=${board.no}'>${board.title} [${board.cmtCount}]</a></td>
		<td>${board.userId}</td>
		<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /></td>
		<td>${board.viewCnt}</td>
		</tr>
	</c:forEach>
		<c:if test="${empty list}">
			<tr>
				<td colspan='5'>입력된 게시물이 없습니다.</td>
			</tr>
		</c:if>
	</table>
		<a href='writeForm'>글쓰기</a>
	<navi:page data="${pageResult}" />
	</div>
<script>
	$("ul.nav.navbar-nav > li").removeClass("active");
	
	function goPage(pageNo) {
		location.href = "list?pageNo=" + pageNo;
	}
</script>
</body>
</html>