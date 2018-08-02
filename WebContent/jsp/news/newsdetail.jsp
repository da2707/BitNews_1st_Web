<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 상세페이지</title>
<link rel="stylesheet" href="http://www.hellodd.com/views/_css/common.css">
<link rel="stylesheet" href="http://www.hellodd.com/views/_css/news.css">
<script type="text/javascript" src="http://www.hellodd.com/views/_js/jquery.rolling.js"></script>

	<script type="text/javascript">
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
</head>
<body>
	<div class="container">
		<div class="gnbLeft">
			<div id="hdNews">
				<strong class="icons ico_news">news</strong>
				<div class="rollingNews" style="position: relative; width: 280px; height: 16px; overflow: hidden;">
					<ul style="position: absolute; top: 0px; left: 0px; width: 280px;">
						<c:forEach var="rlist" items="${randList}">
							<li style="float: left; position: relative; width: 280px; height: 16px; text-align: left; display: block;"><a href="newsDetail?no=${rlist.articleNo}">${rlist.articleTitle}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10 content">
			<div id="contents" class="sub_contents">
				<div id="newsvw_header">
					<div class="newsvw_header">
						<div class="newsvw_title">
							<h2 class="newsTitle">${article.articleTitle}</h2>
							<span class="txt newsSubTitle">
								${article.articleSummary}
							</span>
						</div>
					</div>
					<div class="newsvw_info">
						<ul class="clear left_lnb">
							<li>
								
							</li>
						</ul>
						<span class="profile">
							${article.articleReporter}
						</span>
						<span class="newsvw_infodate">
							<span class="insert">작성일 : ${article.articleDate}</span>
						</span>
					</div>
				</div>
				<div id="newsvw">
					<div class="article_body">
						${article.articleContent}
						<c:if test="${article.articleContent.length() == 1100 }">
							<a href="${article.articleUrl}" target="_blank" style="text-decoration: none">더보기</a>
						</c:if>
					</div>
					<div class="article_info">
						<span class="articlecopy">저작권자(c) HELLODD, 무단 전재 및 재배포 금지</span>
						<div class="article_aside">
							<span>
<%-- 								<a href="newsScrap?no=${article.articleNo}" onclick="doScrap();" title="스크랩"><img src="<c:url value="/images/scrap.PNG" />" alt="스크랩" style="width: 30px; height: 30px;"></a> <!-- 스크랩 서블릿으로 이동 --> --%>
								<a href="#1" onclick="doScrap();" title="스크랩"><img src="<c:url value="/images/scrap.PNG" />" alt="스크랩" style="width: 30px; height: 30px;"></a> <!-- 스크랩 서블릿으로 이동 -->
							</span>
							<span class="txt_bar">|</span>
							<span>
								<a href="${article.articleUrl}" title="원본기사로 이동" target="_blank">원본기사</a>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<script>
		console.log(`${sessionScope.user.userName}`);
		var id = ${sessionScope.user.userId};
		function doScrap() {
			if(id == ""){
				alert("로그인 후 이용 가능합니다.");
// 				location.href = ""
				return;
			}
			$.ajax({
				url: "/mini_2nd/ajax/newsScrap",
				data: `no=${article.articleNo}`,
				success: function (data) {
					alert(data);
					// console.log(data);
				}
			});
// 			alert(${msg});
		}
	</script>
</body>
</html>