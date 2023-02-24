<%@page import="basic.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 추가</title>
<link rel="stylesheet" href="./board.css">
</head>
<body>
<div>
	<h1> 게시글 추가하기 </h1>
	<form action="_04_addBoardPro.jsp" method="post">
	<table border="1">
		<tr><td>번호</td>
		<td><%=BoardDAO.getInstance().newNo() %></td></tr>
		<tr><td>작성자</td>
		<td>test</td></tr>	    
		<tr><td>제목</td>
		<td><input name="addTitle"></td></tr>	    
		<tr><td>내용</td>
		<td><textarea name="addContent"></textarea></td></tr>	    
		<tr><td colspan="2"><input type="button" name="write" value="작성완료">	    
	    	<button onclick="location.href='_00_main.jsp'">작성취소</button></td></tr>
	    		
	</table><br>
	</form>
</div>
</body>
</html>