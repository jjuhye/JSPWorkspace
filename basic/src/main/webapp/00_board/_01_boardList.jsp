<%@page import="board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file= "header.jsp" %>
<%
ArrayList<BoardVO> list=BoardDAO.getInstance().boardList();
%>
<div>
	<h1 class="py-3"> 게시판 </h1>
	<div class='px-3 nav justify-content-end'>전체 게시글 수 : <%=list.size()%></div> 
	<table border="1" class='table'>
   	    <tr><th>번호</th><th>작성자</th><th>작성일</th><th>제목</th><th>내용</th><th>삭제</th></tr>
	    
  <%
	    for(int i=0; i<list.size(); i++){ 
	    %>
	    	<tr><td><%=list.get(i).getNo()%></td><td><%=list.get(i).getName() %></td>
	    	<td><%=list.get(i).getRegDate() %></td><td><a href="_05_updateBoard.jsp?upNum=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a></td></td>
	    	<td><%=list.get(i).getContent() %>
	    	<td><button onclick="window.location.href='_06_deleteBoardPro.jsp?delNo=<%=list.get(i).getNo()%> '">삭제하기</button></td>
	    <%}%>
	</table><br>
</div>
</body>
</html>