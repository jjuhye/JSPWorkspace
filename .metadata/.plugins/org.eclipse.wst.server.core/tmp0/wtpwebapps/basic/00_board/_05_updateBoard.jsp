<%@page import="basic.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./board.js"></script>
</head>
<body>
<%
int no=Integer.parseInt(request.getParameter("upIdx"));
String[] list=BoardDAO.getInstance().readBoard(no);
%>

<div>
	<h1> 게시글 수정하기 </h1>
	<form action="_05_updateBoardPro.jsp?idx=<%=no%>" method="post">
	<table border="1">
		<tr><td>번호</td>	<td colspan=3><%=list[0]%></td></tr>
		<tr><td>작성자</td><td><%=list[1] %></td>
			<td>작성일</td><td><%=list[2] %></td></tr>
		<tr><td>제목</td>
		<td colspan=3><input type="text" name="upTitle" value=<%=list[3] %>></td></tr>	    
		<tr><td>내용</td>
		<td><textarea colspan=3 rows="10" cols="30" name="upContent"><%=list[4] %></textarea></td></tr>	    
		<tr><td colspan="4"><input type="submit" value="수정하기"></td></tr>   
	</table><br>
	</form>
	    <button onclick="location.href='_00_main.jsp'">작성취소</button>
</div>