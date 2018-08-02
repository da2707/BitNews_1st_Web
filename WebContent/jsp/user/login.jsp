<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	.form-horizontal{
	width: 500px;
	padding-right:15px;
	padding-left: 15px;
	margin-right:auto;
	margin-left:auto;
	margin-top:150px;
	margin-bottom:auto;
	}
	.form-group .btn{
	width:388px ;
	}
	div.checkbox > label > input, div.checkbox > label > a {
		margin-left: 60px;
	}
	.form-p{
	padding-left:200px;
	}
	#naverIdLogin{
	padding-left:140px;
		}
	#cb{
	padding-left:100px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
<form name="mForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/login/login" 
onsubmit="return doAction()">
<p class="form-p" style="color: red;">${errMsg}</p>
  <div class="form-group">
    <label for="inputID" class="col-sm-2 control-label">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputID" name="id" placeholder="아이디를 입력하세요">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPW" class="col-sm-2 control-label">PW</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPW" name="pw" placeholder="비밀번호를 입력하세요">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10"> 
      <button class="btn btn-default" >Login</button>
    </div>
  </div>
  	<div id="naverIdLogin">
		<a id="naverIdLogin_loginButton" href="#" role="button">
			<img id="naverimg" src="https://static.nid.naver.com/oauth/big_g.PNG" width=500>
		</a>
	</div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox" id="cb">
        <label>   
          <input type="checkbox" id="idSaveCheck"> ID 저장        
          <a href="<c:url value="/findaccform" />">ID/PW 찾기</a>		 
        </label>
      </div>
    </div>
  </div>
</form>
<form name="hForm" method="post" action="${pageContext.request.contextPath}/naverlogin">
	<input type="hidden" id="hID" name="id" >
	<input type="hidden" id="hPW" name="pw">
	<input type="hidden" id="hName" name="name" >
	<input type="hidden" id="hEmail" name="email">
</form>

  <script>
  
	var f = document.mForm;
	function doAction() {
		if (f.id.value == "") {
			alert("아이디 입력하세요")
			f.id.focus()
			return false;
		}
		if (f.pw.value == "") {
			alert("비밀번호 입력하세요")
			f.pw.focus()
			return false;
		}	
	
	}

	//ID저장
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    console.log("쿠키 레디");
	    var userInputId = getCookie("userInputId");
	    $("input[name='id']").val(userInputId); 
	     
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	    	console.log("클릭변경");
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
// 	    	console.log("쿠키 키업");
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	//ID저장
	

	//네이버 로그인
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "sAofArGGSfpJx6lL_dV7",
				callbackUrl: "http://localhost/mini_2nd/login/login",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();

		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				console.log(status);
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
					setLoginStatus();
				}
			});
		});

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		function setLoginStatus() {
			
			// 네이버 로그인 후 해야할 일...
			// 최초 로그인 이면... 회원가입 필요...
			// 회원 가입되어 있다면 로그인 세션에 추가 필요..
			
			console.dir(naverLogin.user);
			
				naverLogin.logout();
			//var profileImage = naverLogin.user.getProfileImage();
			//var nickName = naverLogin.user.getNickName();
			var email = naverLogin.user.getEmail();
			var uniqId = naverLogin.user.getId();
			var name = naverLogin.user.getNickName();
  			var hf = document.hForm;
			
		  		hf.id.value = uniqId;
		  		hf.pw.value = uniqId;
		  		hf.name.value = name;
		  		hf.email.value = email;
		  		hf.submit();

// 			if (email == undefined || email == null) {
// 				alert("이메일 정보가 필요합니다. 정보 동의를 해주셔야 합니다.");
// 				naverLogin.reprompt();
// 				return;
// 			}
			
			
			//$("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + '" height=50 /> <p>' + nickName + '님 반갑습니다.</p>');
			$("#gnbLogin").html("Logout");
// 			$("#gnbLogin").attr("href", "#");
		$("#naverIdLogin_loginButton").click(function(){

			
// 			$("#gnbLogin").click(function () {
// 				location.reload();
 			});
			
		}
		
		

	
	</script>

</body>
</html>

