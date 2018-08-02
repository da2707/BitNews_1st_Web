<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<title>bit news</title>
</head>
<body>
	 <hr />
	 <form action='update' method='post'>
	   <input type='hidden' name='no' value='${board.no}' />
	    제목 : <input type='text' name='title' value='${board.title}' /><br>
	    말머리 : <select name="head">
	    		<option value="b">삽니다</option>
	    		<option value="s">팝니다</option>
	    	</select><br>
	    글쓴이 : <input type='text' name='writer' readonly value='${board.userId}' /><br>
	    내용 : <br>
	   <textarea name='content' rows='5' cols='70'>${board.content}</textarea><br>
	   <button type='submit'>수정</button>
	 </form>
	 
	 <script>
		$("button").click( function () {
			if( confirm("글을 진짜로 수정하세요?") ){
				return true;
			} return false;
		});
	</script>
</body>
</html>




