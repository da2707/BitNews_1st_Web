<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>
<link href="<c:url value="/jsp/news/4/js-image-slider.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/jsp/news/4/js-image-slider.js" />" type="text/javascript"></script>
<link href="<c:url value="/jsp/news/4/generic.css" />" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<sitemesh:write property="head" />
<style type="text/css">
	.tab {
		height: 100px;
		text-align: center;
		font-size: 48px;
		line-height: 100px;
		font-weight: bold;
	}
	.content{
		height: 100%;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	.space {
		height: 20px;
	}
	.col-md-8 > a:HOVER {
		text-decoration: none;
	}
	li {
		list-style: none;
	}
	.row > ul > li {
		float: left;
	}
	.ck {
		float: left;
		line-height: 20px;
	}
	.opt .btn_stt{
		overflow:hidden;display:inline-block;width:46px;height:21px;background:url(http://static.naver.net/newsstand/img/20140716/sp_nwstd.png) -332px -150px no-repeat;line-height:999px;vertical-align:top;
	}
	.opt a.btn_stt:hover,.opt a.btn_stt:focus{background-position:-332px -61px}
</style>
</head>
<body>
		<div class="header">
			<c:import url="/jsp/decorator/topMenu.jsp" />
		</div>
	
		<div class="content">
			<sitemesh:write property="body" />
		</div>
		 

</body>
</html>