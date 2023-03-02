<%@page import="kr.basic.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "header.jsp" %>

<div>
	<h1> 게시글 추가하기 </h1>
	<form action="_04_addBoardPro.jsp" method="post">
	<table border="1" class="table">
		<tr><td>번호</td>
		<td ><%=BoardDAO.getInstance().getCurrentNo()%></td></tr>
		<tr><td>작성자</td>
		<td ><input  class="col-12" type="text" name="writer"></td></tr>
		<tr><td>제목</td>
		<td><input  class="col-12" type="text" name="addTitle"></td></tr>	
		<tr><td>내용</td>
		<td><textarea  class="col-12 left"  rows="7" cols="22" name="addContent"></textarea></td></tr>	    
		<tr><td colspan="2"><input type="submit" value="작성완료"></td></tr>   
	</table><br>
	</form>
	    <button onclick="location.href='_01_boardList.jsp'">작성취소</button>
</div>
</body>
</html>