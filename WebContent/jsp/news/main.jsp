<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bit news</title>
<!-- <link rel="stylesheet" type="text/css" href="http://newsstand.naver.com/css/nsd_v20141016.css"> -->
<style type="text/css">
	.lst_news {
	    position: absolute;
	    left: 0;
	    bottom: 0;
	    width: 100%;
	    height: 97px;
	    z-index: 30;
	}
	.lst_news_inn {
	    position: relative;
	    height: 88px;
	    padding: 7px 27px 0;
	    zoom: 1;
	    vertical-align: top;
	    z-index: 100;
	}
	.lst_news_wp {
	    position: relative;
	    float: left;
	    margin-right: 3px;
	    vertical-align: middle;
	    zoom: 1;
	    overflow: hidden;
	}
	
	.lst_news ul {
    zoom: 1;
    width: 32000px;
    padding: 5px 0 13px 3px;
}
ul, ol {
    list-style: none;
}
.lst_news ul li {
    position: relative;
    float: left;
    width: 89px;
    height: 79px;
    margin: 0 2px 0 0;
}
a {
    text-decoration: none;
}

user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}


.lst_news ul li a {
    position: relative;
    display: block;
    width: 89px;
    height: 76px;
    padding: 3px 0 0 0;
    text-align: center;
    cursor: pointer;
}
</style>
</head>
<body>
	
	<div id="sliderFrame">
	    <div id="slider">
			<c:forEach var="list" items="${imgList}">
				<img src="<c:url value="captureimages/${list.imgPath}" />" />
			</c:forEach>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${empty sessionScope.user}"> --%>
<%-- 					<c:forEach var="list" items="${imgList}"> --%>
<%-- 						<img src="<c:url value="captureimages/${list.imgPath}" />" /> --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<%-- 					<c:forEach var="list" items="${imgList}"> --%>
<%-- 						<img src="<c:url value="captureimages/${list.imgPath}" />" /> --%>
<%-- 					</c:forEach> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
        </div>
        <!--Custom navigation buttons on both sides-->
        <div class="group1-Wrapper">
            <a onclick="imageSlider.previous()" class="group1-Prev"></a>
            <a onclick="imageSlider.next()" class="group1-Next"></a>
        </div>
        <!--nav bar-->
        <div style="text-align:center;padding:20px;z-index:20;">
            <a onclick="imageSlider.previous()" class="group2-Prev"></a>
            <a id='auto' onclick="switchAutoAdvance()"></a>
            <a onclick="imageSlider.next()" class="group2-Next"></a>
        </div>
    </div>
	<div class="lst_news">
		<div class="lst_news_inn">
			<div id="rolling" class="lst_news_wp" style="width: 1092px;">
				<ul id="rollingUl">
					<c:forEach var="dList" items="${dateList}">
						<li><a href="#1" class="${dList}" >${dList}</a>></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	
    <script type="text/javascript">
//     	console.log(${imgList});
        //The following script is for the group 2 navigation buttons.
        function switchAutoAdvance() {
            imageSlider.switchAuto();
            switchPlayPauseClass();
        }
        function switchPlayPauseClass() {
            var auto = document.getElementById('auto');
            var isAutoPlay = imageSlider.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass();
        
        console.log($("a[href='#1']").text());
        for(let el of $("a[href='#1']")){
            $(el).click(function () {
            	$.ajax({
            		url: "/mini_2nd/dateScreenshot",
            		data: "day=" + this.innerText,
            		dataType: "json",
            		success: function (result) {
                        for(let path of result){
                            console.log(path.imgPath);
                            var img = $("#slider > img");
                            for(let i of img){
                                console.log(i);
                            }
//                             $("#slider").html("");
//                             var img = $("<img src='<c:url value = 'captureimages/" + path.imgPath + "' /> />");
//                             console.log(img);
//                             $("#slider").append(img);
//                             $("#slider").html(html);
//							$("#slider").html(`<img src="<c:url value="captureimages/${path.imgPath}" />" />`);
                        }
//             			console.log(result);
            		}
            	})
            })
        }
    </script>
	
</body>
</html>