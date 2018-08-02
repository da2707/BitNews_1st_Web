<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>언론사 설정</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
.form-group input[type="checkbox"] {
    display: none;
}

.form-group input[type="checkbox"] + .btn-group > label span {
    width: 20px;
}

.form-group input[type="checkbox"] + .btn-group > label span:first-child {
    display: none;
}
.form-group input[type="checkbox"] + .btn-group > label span:last-child {
    display: inline-block;   
}

.form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
    display: inline-block;
}
.form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
    display: none;   
}
</style>
</head>
<body>
<form action="<c:url value="/config" />" name="checkForm" method="post">

    <div class="[ col-xs-12 col-sm-12 ]">
        <h3>언론사 설정</h3><hr />
        
        <div class="[ form-group ]">
            <input type="checkbox" name="newsId" id="hellodd" value="hellodd" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="hellodd" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="hellodd" class="[ btn btn-default active ]">
                    Hellodd
                </label>
            </div>
            <input type="checkbox" name="newsId" value="kinews" id="kinews" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="kinews" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="kinews" class="[ btn btn-default active ]">
                    KINEWS
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="newsId" value="etnews" id="etnews" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="etnews" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="etnews" class="[ btn btn-default active ]">
					전자신문
                </label>
            </div>
            <input type="checkbox" name="newsId" value="nextdaily" id="nextdaily" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="nextdaily" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="nextdaily" class="[ btn btn-default active ]">
					넥스트 데일리
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="newsId" value="boannews" id="boannews" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="boannews" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="boannews" class="[ btn btn-default active ]">
					보안뉴스
                </label>
            </div>
            <input type="checkbox" name="newsId" value="bloter" id="bloter" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="bloter" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="bloter" class="[ btn btn-default active ]">
					블로터
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="newsId" value="zdnet" id="zdnet" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="zdnet" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="zdnet" class="[ btn btn-default active ]">
					ZD Net Korea
                </label>
            </div>
            <input type="checkbox" name="newsId" value="itchosun" id="itchosun" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="itchosun" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="itchosun" class="[ btn btn-default active ]">
					IT Chosun
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="newsId" value="ddaily" id="ddaily" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="ddaily" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="ddaily" class="[ btn btn-default active ]">
					디지털 데일리
                </label>
            </div>
            <input type="checkbox" name="newsId" value="dt" id="dt" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="dt" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="dt" class="[ btn btn-default active ]">
					디지털 타임스
                </label>
            </div>
        </div>
        <div class="[ form-group ]">
            <input type="checkbox" name="newsId" value="inews" id="inews" autocomplete="off" />
            <div class="[ btn-group ]">
                <label for="inews" class="[ btn btn-default ]">
                    <span class="[ glyphicon glyphicon-ok ]"></span>
                    <span> </span>
                </label>
                <label for="inews" class="[ btn btn-default active ]">
					아이뉴스 24
                </label>
            </div>
        </div>
        
    	<button class="[ form-group ]" onclick="doConfig();">설정</button>
    </div>
</form>
    
<script type="text/javascript">
	console.log(`id, ${newsid}`)
    var list = ${newsid};
    for(var ck of list){
        console.log(ck);
        ck.checked = true;
        console.dir(ck);
    }
    // $("input[")
	function doConfig() {
		document.checkForm.target = "config";
		document.checkForm.action = "<c:url value='/config' />";
		document.checkForm.submit();
		self.close();
		}
//     	console.log( $("input") );
//     	console.log( $("input").length );
//         $("input").click(function () {
//             $("input").each(function (index) {
//                 if($(this).prop("checked")){
//                     console.log(index);
//                     console.log(index);
//                 }
//                 // console.log( $(this).prop("checked") );
//             });
//         });
    </script>
</body>
</html>