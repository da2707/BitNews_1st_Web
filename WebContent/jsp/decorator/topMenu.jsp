<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="container-fluid space"></div>
	<div class="container">
		<div class="row tab">
			<div class="col-md-2"></div>
			<div class="col-md-8"><a href="<c:url value="/main" />">bit News</a></div>
			<div class="col-md-2"></div>
		</div>
	</div>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<c:url value="/main" />">Bit News</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
<!--         <li><a href="#">Link <span class="sr-only">(current)</span></a></li> class="active" 클릭시 활성화 -->
        <li><a href="#">BLOTER</a></li>
        <li><a href="<c:url value="/newsList?type=hellodd" />">hellDD</a></li>
        <li><a href="#">아이뉴스 24</a></li>
        <li><a href="#">디지털 타임스</a></li>
        <li><a href="#">ZD Net Korea</a></li>
        <li><a href="#">디지털 데일리</a></li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 유저공간 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
			<li><a href="/mini_2nd/freeBoard/list">자유게시판</a></li>
			<li><a href="/mini_2nd/usedBoard/list">중고장터</a></li>
			<li><a href="/mini_2nd/articleBoard/list">시민기사 게시판</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
<!--         <button type="submit" class="btn btn-default">언론사 선택</button> -->
		  <div class="opt">
		  	<c:if test="${!empty sessionScope.user}">
		  	<a href="#" onclick="doPop();" class="btn_stt">설정</a>
		  	</c:if>
		  </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
      	<c:choose>
        <c:when test="${empty sessionScope.user}">
        <li><a href="<c:url value="/user/signupForm" />">회원가입</a></li>
        </c:when>
        <c:when test="${sessionScope.user.userId eq 'admin'}">
        <li><a href="<c:url value="/adminpagemove" />">AdminPage</a></li>        
        </c:when>                
        <c:otherwise>
        <li><a href="<c:url value="/mypage/mypagemove" />">MyPage</a></li>        
        </c:otherwise>
        </c:choose>
              	
        <c:choose>
        <c:when test="${empty sessionScope.user}">
        	<li><a href="<c:url value="/login/login" />">로그인</a></li>
        </c:when>
        <c:otherwise>
        	${sessionScope.user.userName}님 접속
        	<li><a href="<c:url value="/login/logout" />">로그아웃</a><li>
        </c:otherwise>
        </c:choose>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav> 

<script>
	function doPop(){
        var left = (screen.width - 700) / 2;
        var top = (screen.height - 1000) / 2;
        console.log(`width=${left},height=${top}`);
        window.name = "config"; 
        window.open("<c:url value='/setting' />", "", `width=600, height=600, left=${left}, top=${top}`);
	}
</script>