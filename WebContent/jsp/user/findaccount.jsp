<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	.form-horizontal{
	width: 520px;
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
	margin-bottom: 60px;
	margin-left:140px;
	}
	.form-p{
	padding-left:200px;
	}


</style>
</head>
<body>
<form name="mForm" class="form-horizontal" action="${pageContext.request.contextPath}/findacc" onsubmit="return doAction()">
  <h2 id="fipw">ID/PW 찾기</h2>
  <br><br><br>
  <p class="form-p" style="color: red;">${errMsg}</p>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">NAME</label>
    <div class="col-sm-10">
      <input type="text" class="sign-form" id="inputName" name="name" placeholder="이름을 입력하세요"  size="30">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label" >E-MAIL</label>
    <div class="col-sm-10">
      <input type="text" class="sign-form" id="inputEmail" name="email" placeholder="E-MAIL주소를 입력하세요"  size="30">
      &nbsp;&nbsp;<button type="button" onclick="certification();">인증</button>
    </div>
  </div>
  <div class="form-group">
    <label for="inputNum" class="col-sm-2 control-label">인증번호</label>
    <div class="col-sm-10">
      <input type="text" class="sign-form" id="confirmNum" name="num" placeholder="인증번호를 입력하세요"  size="30" maxlength="4">
      &nbsp;&nbsp;<button>확인</button>
    </div>
  </div>
</form>
<script>
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var f = document.mForm;
	var num;
	function doAction(){
		if(f.num.value == ""){
			alert("인증번호를 입력하지 않았습니다");
			f.num.focus()
			return false;
			
		}

		if($("#confirmNum").val() == num){
			alert("계정정보가 전송되었습니다.");
		}
		if($("#confirmNum").val() != num){
			alert("인증번호를 확인하세요");
			f.num.focus()
			return false;
		}
		$.ajax({
			url : "/mini_2nd/ajax/sendemailfind",
			data : "email=" + $("#inputEmail").val(),
			success : function(data) {
				console.log(data);
				var result = JSON.parse(data);
				alert(result.msg);

			}
		});
	}
	function certification() {
		if (f.name.value == "") {
			alert("이름을 입력하지 않았습니다.")
			f.email.focus()
			return false;
		}
		if (f.email.value == "") {
			alert("이메일을 입력하지 않았습니다.")
			f.email.focus()
			return false;
		}
		if (regex.test(f.email.value) === false) {
			alert("잘못된 이메일 형식입니다.");
			f.email.value = ""
			f.email.focus()
			return false;
		}
		//       console.log($("#inputEmail").val());
		$.ajax({
			url : "/mini_2nd/ajax/sendemail",
			data : "email=" + $("#inputEmail").val(),
			success : function(data) {
				console.log(data);
				var result = JSON.parse(data);
				alert(result.msg);
				console.log(result.num);
				num = result.num;
			}
		});
	}
</script>
</body>
</html>















