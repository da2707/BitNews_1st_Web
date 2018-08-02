<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h2>회원탈퇴</h2>
  <form action="/mini_2nd/mypage/leave" id="form" method="post">
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 재확인</label>
      <input type="password" class="form-control" id="pwd-check" placeholder="Enter password">
    </div>
    <button type="submit" class="btn btn-default">회원탈퇴</button>
    <button type="button" class="btn btn-default" onclick="location.href='mypagemove'">취소</button>
  </form>
</div>
<script>
$("#form").on("submit", function() {
	var pass = $("#pwd").val();
	var pwdcheck =$("#pwd-check").val();
	
	if(pass == "" ||pwdcheck == ""){
		alert("빈칸을 채워주십시오.");
		return false;
	}

	if(pass == pwdcheck){
		$.ajax({
				url: "/mini_2nd/mypage/leave",
				data: "pwd=" + pass,
				dataType: "json",
				success: function(data){
					if(data.result == 1){
						alert("회원 탈퇴 성공,그동안 이용해주셔서 감사합니다.");
						location.href ='/mini_2nd/login/logout';
						//console.log(data.result);
						}
					else{
						alert("비밀번호가 일치하지 않습니다.");
						location.href='/mini_2nd/mypage/leavemove';
						//console.log(data.result);
						}
			}
		})
	}else{
		alert("확인/재확인 비밀번호가 일치하지 않습니다.");
		return false;
	}
	});
/*
window.onsubmit = function(){
    var pwd = document.getElementById('pwd').value;
    var pwdcheck = document.getElementById('pwd-check').value
    
    if(pwd == ""|| pwdcheck ==""){
    	alert("빈칸을 채워주십시오")
    	return false;
    }else if(pwd!=pwdcheck){
    	alert("비밀번호가 일치하지 않습니다.");
    	return false;
    }else{
    	return true;
    }
}
*/
</script>
</body> 
</html>