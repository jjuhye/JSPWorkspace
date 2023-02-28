<%@page import="basic.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file= "header.jsp" %>
<%
int no=Integer.parseInt(request.getParameter("upIdx"));
String[] list=BoardDAO.getInstance().readBoard(no);
%>

<div>
	<h1 class='py-3'> 게시글 수정하기 </h1>
	<form action="_05_updateBoardPro.jsp?idx=<%=no%>" method="post">
	<table border="1">
		<tr><td>번호</td>	<td class="col-3"><%=list[0]%></td></tr>
		<tr><td>작성자</td><td><%=list[1] %></td>
			<td>작성일</td><td><%=list[2] %></td></tr>
		<tr><td>제목</td>
		<td colspan=3><input type="text" name="upTitle" value=<%=list[3] %>></td></tr>	    
		<tr><td>내용</td>
		<td><textarea colspan=3 rows="10" cols="30" name="upContent"><%=list[4] %></textarea></td></tr>	    
		<tr><td colspan="4"><input type="submit" value="수정하기"></td></tr>   
	</table><br>
	</form>
	    <button onclick="location.href='_01_boardList.jsp'">작성취소</button>
</div>