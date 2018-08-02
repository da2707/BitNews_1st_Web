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
  #update{
  margin-left:140px;
  }
</style>
</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">마이페이지</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">회원정보 수정</a></li>
      <li><a href="scrap">스크랩</a></li>
      <li><a href="used">내 글</a></li>
      <li><a href="comment">내 댓글</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    </ul>
  </div>
</nav>

<form class="form-horizontal" id="form" action="/mini_2nd/mypage/userupdate" method="post">
  <h2 id="update">회원정보수정</h2>
  <div class="form-group">
    <label for="inputPW" class="col-sm-2 control-label">PW</label>
    <div class="col-sm-10">
      <input type="password" class="sign-form" id="inputPW" placeholder="비밀번호를 입력하세요"  size="30">
	       
    </div>
  </div>
  <div class="form-group">
    <label for="inputPW" class="col-sm-2 control-label">PW 확인</label>
    <div class="col-sm-10">
      <input type="password" class="sign-form" id="checkPW" placeholder="비밀번호를 한번 더 입력하세요" size="30">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPW" class="col-sm-2 control-label">NAME</label>
    <div class="col-sm-10">
      <input type="text" class="sign-form" id="inputName" placeholder="이름을 입력하세요"  size="30">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPW" class="col-sm-2 control-label" onblur="" >E-MAIL</label>
    <div class="col-sm-10">
      <input type="text" class="sign-form" id="inputEmail" placeholder="E-MAIL주소를 입력하세요"  size="30">
    </div>
  </div>
<button type="button" id="submit" class="btn btn-default">정보수정</button>
</form>

<footer id="buttons">
<button type="button" class="btn btn-default" onclick="location.href='passchangemove'">비밀번호 변경</button>
<button type="button" class="btn btn-default" onclick="location.href='leavemove'">탈퇴</button>
</footer>

<script>
var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

$("#submit").on("click",function(){
	var pwd = $("#inputPW").val();
	var pwdcheck = $("#checkPW").val();
	var name = $("#inputName").val();
	var email = $("#inputEmail").val();
	
	if(pwd == "" || pwdcheck ==""){
		alert("빈칸을 채워주십시오.");
		return false;
	}
	
	if (regex.test(form.inputEmail.value) === false) {
		alert("잘못된 이메일 형식입니다.");
		form.inputEmail.value = ""
		form.inputEmail.focus()
		return false;
	}

	if(pwd == pwdcheck){
		$.ajax({
			url:"/mini_2nd/mypage/userupdate",
			data:"pwd=" + pwd +"&name=" + name + "&email=" + email,
			dataType:"json",
			success:function(data){
				if(data.result == 1){
					alert("정보 변경 성공");
					location.href = "/mini_2nd/mypage/mypagemove";
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					location.href = "/mini_2nd/mypage/mypagemove";
					}
			}
		})
	}else{
		alert("확인/재확인 비밀번호가 일치하지 않습니다.");
		form.inputPW.value ="";
		form.checkPW.value ="";
		return false;
	}
});


</script>
</body>
</html>