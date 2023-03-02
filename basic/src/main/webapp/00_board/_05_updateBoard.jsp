<%@page import="kr.basic.model.BoardVO"%>
<%@page import="kr.basic.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file= "header.jsp" %>
<%
int no=Integer.parseInt(request.getParameter("upNum"));
BoardVO vo=BoardDAO.getInstance().readBoard(no);
/* String[] list=BoardDAO.getInstance().readBoard(no); */
%>

<div>
	<h1 class='py-3'> 게시글 수정하기 </h1>
	<form action="_05_updateBoardPro.jsp?upNum=<%=no%>" method="post">
	<table border="1" class="table">
		<tr><td>번호</td>	<td class="col-3"><%=no%></td></tr>
		<tr><td>작성자</td><td><%=vo.getName() %></td>
			<td>작성일</td><td><%=vo.getRegDate() %></td></tr>
		<tr><td>제목</td>
		<td colspan=3><input class="col-12" type="text" name="upTitle" value=<%=vo.getTitle() %>></td></tr>	    
		<tr><td>내용</td>
		<td  colspan=3 ><textarea class="col-12 left" rows="10" name="upContent"><%=vo.getContent() %></textarea></td></tr>	    
		<tr><td colspan="4"><input type="submit" value="수정하기"></td></tr>   
	</table><br>
	</form>
	    <button onclick="location.href='_01_boardList.jsp'">작성취소</button>
</div>