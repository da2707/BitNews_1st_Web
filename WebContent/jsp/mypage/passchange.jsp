<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>비밀번호 변경</h2>
  <form action="passchange" id="form" method="post">
    <div class="form-group">
      <label for="pwd">현재 비밀번호</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 재확인</label>
      <input type="password" class="form-control" id="pwd-check" placeholder="Enter password again">
    </div>
    <div class="form-group">
      <label for="pwd">새로운 비밀번호</label>
      <input type="password" class="form-control" id="npwd" name="npwd" placeholder="Enter new password">
    </div>
    <div class="form-group">
      <label for="pwd">새로운 비밀번호 재확인</label>
      <input type="password" class="form-control" id="npwd-check" placeholder="Enter new password again">
    </div>
    <button type="submit" class="btn btn-default">변경 완료</button>
    <button type="button" class="btn btn-default" onclick="location.href='userupdate'">취소</button>
  </form>
</div>

 <script>
 $("#form").on("submit", function() {
		var pwd = $("#pwd").val();
		var pwdcheck =$("#pwd-check").val();
		
		var npwd = $("#npwd").val();
		var npwdcheck = $("#npwd-check").val();
		
		if(pwd == "" ||pwdcheck == ""||npwd =="" ||npwdcheck==""){
			alert("빈칸을 채워주십시오.");
			return false;
		}
		
		if(pwd != pwdcheck){
			alert("현재 비밀번호를 똑같이 입력해주십시오.");
			return false;
		}
		
		if(npwd != npwdcheck){
			alert("새로운 비밀번호를 똑같이 입력해주십시오.");
			return false;
		}
		
		if(pwd == pwdcheck && npwd == npwdcheck){
			$.ajax({
					url: "/mini_2nd/mypage/passchange",
					data: "pwd=" + pwd + "&npwd=" + npwd,
					dataType: "json",
					success: function(data){
						if(data.result == 1){
							alert("비밀번호 변경 성공")
							location.href = "/mini_2nd/mypage/mypagemove"
							}
						else{
							alert("비밀번호가 일치하지 않습니다.");
							location.href="/mini_2nd/mypage/passchangemove"
							}
				}
			})
					
		}else{
			alert("확인/재확인 비밀번호가 일치하지 않습니다.");
			return false;
		}
		});
           
        </script>
</body>
</html>