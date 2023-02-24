<%@page import="basic.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="basic.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./board.css">
</head>
<body>
<%
ArrayList<BoardVO> list=BoardDAO.getInstance().getList();
%>
<div>
	<h1> 게시판 </h1>
	전체 게시글 수 : <%=list.size()%>
	<table border="1">
   	    <tr><th>번호</th><th>작성자</th><th>작성일</th><th>제목</th><th>내용</th><th>삭제</th></tr>
	    
	    <%
	    for(int i=0; i<list.size(); i++){ 
	    %>
	    	<tr><td><%=list.get(i).getNo()%></td><td><%=list.get(i).getName() %></td>
	    	<td><%=list.get(i).getDate() %></td><td><%=list.get(i).getTitle() %></td>
	    	<td><%=list.get(i).getContent() %>
	    	<td><button onclick="location.href='_06_deleteBoardPro.jsp?delNo=<%=list.get(i).getNo() %>'">삭제하기</button></td>
	    		
	    <%}%>
	</table><br>
	<a href="_00_main.jsp">뒤로가기</a>
</div>
</body>
</html>