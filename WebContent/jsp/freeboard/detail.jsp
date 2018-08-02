<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
	<meta charset='utf-8'>
	<title>bit news</title>
	<style>
	
	div.container {
		width: 90%;
	}
	
	</style>
</head>
<body>
	<div style="
		 text-align: center;
		 font-size: 40px;
		 font-weight: bold;"
	> 자유 게시판
	</div>

<hr />
	<div class="container">
	
번호 :  ${board.no}<br><br>
글쓴이 : <c:out value="${board.userId}" /><br><br>
제목 : <c:out value="${board.title}" /><br><br>
내용 : <c:out value="${board.content}" /><br><br>
등록일 : <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /><br><br><br>
조회수 : ${board.viewCnt}<br>
첨부파일 : <c:forEach var="file" items="${fileList}">
	<a href="/mini_2nd/common/file/down?path=${file.filePath}&sName=${file.systemName}&dName=${file.oriName}">${file.oriName}</a>(${file.fileSize} bytes)<br>
	</c:forEach><br>

<hr />
	<c:if test="${sessionScope.user.userId eq board.userId}">
		<a href='updateForm?no=${board.no}' id="mod">수정</a>
		<a href='delete?no=${board.no}' id="del">삭제</a>
	</c:if>
		<a href='list'>목록</a>	
<hr />

	 <%--  댓글 파트입니다.  --%>	
	 <form action="commentUpdate" method="post">
		<input type="hidden" name="no" value="${board.no}" />
		<input type="hidden" name="commentNo" value="${commentNo}" />
		
		<%-- 댓글 목록 --%>
		<div id="commentList"></div>
	 </form>
		
	 <%-- 댓글 관련 파트 시작 --%>		
	 <form id="rForm" class="form-inline">
		<div id="comment">
		    <div class="form-group">
			    <input type="text" name="writer" class="form-control" readonly value="${user.userId}" placeholder="아이디를 입력하세요">
		    </div>
		    <div class="form-group">
			    <input type="text" size="50" name="content" class="form-control input-wp1" placeholder="내용을 입력하세요.">
		    </div>
		  	<button class="btn btn-primary">등록</button>
		</div>
	 </form>
	<script>

	$("#del").click( function () {
		if(confirm("정말로 삭제하시겠습니까?")){
			return true;
		} return false;
	});
	
	function commentDelete(commentNo) {
		$.ajax({
			url: "<c:url value='/freeBoard/commentDelete'/>",
			data: {
				no: "${board.no}", 
				commentNo: commentNo
			},
			dataType: "json",
			success: makeCommentList
		});
	}
	
	function commentUpdateForm(commentNo) {
		
		$("#commentList tr[id^=row]").show();
		$("#commentList tr[id^=modRow]").remove();
		
		var modId = $("#row" + commentNo + " > td:eq(0)").text();
		var modContent = $("#row" + commentNo + " > td:eq(1)").text();
		
		var html = '';
		html += '<tr id="modRow' + commentNo + '">';
		html += '	<td>' + modId + '</td>';
		html += '	<td>';
		html += '		<div class="form-group">';
		html += '			<input type="text" name="content" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td colspan="2">'; 
		html += '		<a href="javascript:commentUpdate(' + commentNo + ');" class="btn btn-success btn-sm" role="button">수정</a>';
		html += '		<a href="javascript:commentCancel(' + commentNo + ');" class="btn btn-warning btn-sm" role="button">취소</a>';
		html += '	</td>';
		html += '</tr>';
		$("#row" + commentNo).after(html);	
		$("#row" + commentNo).hide();
	}
	
	function commentUpdate(commentNo) {
		$.ajax({
			url: "<c:url value='/freeBoard/commentUpdate'/>",
			type: "POST",
			data: {
				no: "${board.no}", 
				content: $("#modRow" + commentNo + " input[name=content]").val(), 
				commentNo: commentNo
			},
			dataType: "json",
			success: function (result) {
				makeCommentList(result);
			} 
		});
	}
	
	function commentCancel(commentNo) {
		$("#row" + commentNo).show();
		$("#modRow" + commentNo).remove();
	}
	
	// 댓글 등록 처리
	$("#rForm").submit(function (e) {
		e.preventDefault();
		
		$.ajax({
			url: "<c:url value='/freeBoard/commentRegist'/>",
			type: "POST",
			data: {
				no: "${board.no}", 
				content: $("#rForm input[name='content']").val(), 
				writer: $("#rForm input[name='writer']").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			if (!'$(user.userId)') {
				$("#rForm input[name='writer']").val("");
			}
			$("#rForm input[name='content']").val("");
			
			makeCommentList(result);
		});
	});	
	
	// 댓글 목록 만드는 공통 함수
	function makeCommentList(result) {
		console.dir(result);
		var html = "";
		html += '<table class="table table-bordered">';
		html += '	<colgroup>'; 
		html += '		<col width="7%">'; 
		html += '		<col width="*">'; 
		html += '		<col width="14%">'; 
		html += '		<col width="10%">'; 
		html += '	</colgroup>'; 
		  
		for (var i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<tr id="row' + comment.commentNo + '">';
			html += '	<td>' + comment.userId + '</td>';
			html += '	<td>' + comment.content + '</td>';
			var date = new Date(comment.regDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '	<td>' + time + '</td>';  
			html += '	<td>';
			html += '		<a href="javascript:commentUpdateForm(' + comment.commentNo + ')" class="btn btn-success btn-sm" id="a" role="button">수정</a>';    
			html += '		<a href="javascript:commentDelete(' + comment.commentNo + ')" class="btn btn-danger btn-sm" id="b" role="button">삭제</a>';    
			html += '	</td>';
			html += '</tr>';
		}
		
		if (result.length == 0) {
			html += '<tr><td colspan="4">댓글이 존재하지 않습니다.</td></tr>';
		}
		
		html += "</title>";
		$("#commentList").html(html);
	}
	
	// 댓글 목록 조회
	function commentList() {
		$.ajax({
			url: "<c:url value='/freeBoard/commentList'/>",
			data: {no: "${board.no}"},
			dataType: "json", 
			success: makeCommentList
		});
	}
	
	// 상세 페이지 로딩시 댓글 목록 조회 ajax 호출
	commentList();	
	</script>	
	</div>
		
</body>
</html>
