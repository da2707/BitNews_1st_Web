<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<title>bit news</title>
	<style>
	div.container {width: 90%;}
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
	 <form method='post' action='write' enctype="multipart/form-data">
	    제목 :   <input type='text' name='title' size='70' /><br><br>
	    글쓴이 : <input type='text' readonly value='${user.userId}' name='userId' size='30' /><br><br>
	    내용 :   <textarea name='content' rows='7' cols='70' placeholder='예쁘고 고운말 쓰기!'></textarea><br><br>
	    첨부파일 : 
	    <input type="file" name="attach1" /><br>
	    <input type="file" name="attach2" /><br>
	   <button type='submit'>등록</button>
	 </form>
	 </div>

</body>
</html>






