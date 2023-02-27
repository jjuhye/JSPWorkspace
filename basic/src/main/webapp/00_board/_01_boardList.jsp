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
/* ArrayList<BoardVO> list=BoardDAO.getInstance().getList(); */
int size=BoardDAO.getInstance().getSize();
%>
<div>
	<h1> 게시판 </h1>
<%-- 	전체 게시글 수 : <%=list.size()%> --%>
	전체 게시글 수 : <%=size%>
	<table border="1">
   	    <tr><th>번호</th><th>작성자</th><th>작성일</th><th>제목</th><th>내용</th><th>삭제</th></tr>
	    
	    <%
	    for(int i=0; i<size; i++){ 
		String[] list=BoardDAO.getInstance().readBoard(i);
	    %>
	    	<tr><td><%=list[0]%></td><td><%=list[1] %></td>
	    	<td><%=list[2] %></td><td><a href="_05_updateBoard.jsp?upIdx=<%=i%>"><%=list[3]%></a></td></td>
	    	<td><%=list[4] %>
	    	<td><button onclick="location.href='_06_deleteBoardPro.jsp?delNo=<%=i %>'">삭제하기</button></td>
	    		
	    <%}%>
	</table><br>
	<a href="_00_main.jsp">뒤로가기</a>
</div>
</body>
</html>