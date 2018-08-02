<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 상세페이지</title>
<c:choose>
	<c:when test="${type eq 'hellodd'}">
		<link rel="stylesheet" href="http://www.hellodd.com/views/_css/common.css">
		<link rel="stylesheet" href="http://www.hellodd.com/views/_css/news.css">
<!-- 		<link rel="stylesheet" href="http://www.hellodd.com/views/_css/template.css"> -->
		<script type="text/javascript" src="http://www.hellodd.com/views/_js/jquery.rolling.js"></script>
	</c:when>	
<%-- 	<c:otherwise> --%>
	
<%-- 	</c:otherwise> --%>
</c:choose>
</head>
<body>
	<div class="container">
	<hr>
	<c:choose>
		<c:when test="${type eq 'hellodd'}">
			<div class="gnbLeft">
				<div id="hdNews">
					<strong class="icons ico_news">news</strong>
					<div class="rollingNews" style="position: relative; width: 280px; height: 16px; overflow: hidden;">
						<ul style="position: absolute; top: 0px; left: 0px; width: 280px;">
							<c:forEach var="rlist" items="${rList}">
								<li style="float: left; position: relative; width: 280px; height: 16px; text-align: left; display: block;"><a href="newsDetail?no=${rlist.articleNo}">${rlist.articleTitle}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 content">
					<div id="newslt">
						<div id="list_area">
							<ul>
							<c:forEach var="list" items="${list}">
								<li>
									<div class="thumb"><a href="newsDetail?no=${list.articleNo}"><img src="${list.articleThumb }" alt="" /></a></div>
									<div class="article">
										<h3><a href="newsDetail?no=${list.articleNo}">${list.articleTitle}</a></h3>
										<span class="txt"><a href="newsDetail?no=${list.articleNo}">${list.articleSummary}</a></span>
										<p class="date_author">${list.articleReporter}<span>|</span>${list.articleDate}</p>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div> 
					</div> 
				</div>
				<div class="col-md-1"></div>
			</div>
		</c:when>
	</c:choose>
	<navi:page data="${pageResult}"/>
	</div>
	
	
	
	
<script type="text/javascript">
// paging
	function goPage(pageNo) {
		location.href = "newsList?pageNo=" + pageNo + "&type=hellodd";
	}


// <!-- rolling news  -->
	var logged_pid = '0';
	var logged_id = '';
	var logged_gubun = '';
	$(document).ready(function(){
		$(".rollingNews").rolling({
			direction : 'up',
			width : 280, // 배너의 너비
			height : 16, // 배너의 높이
			max_view : 1, // 초기에 보일 배너의 갯수
			speed : 5000 // 속도
		});

		$('.navWrap ul li').bind('mouseenter keyup', function() {
			$(this).addClass('on').siblings().removeClass()
		});
	});
</script>
</body>
</html>