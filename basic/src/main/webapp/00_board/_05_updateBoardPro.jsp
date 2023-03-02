<%@page import="kr.basic.model.BoardDAO"%>
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
	request.setCharacterEncoding("utf-8");
	
	int no=Integer.parseInt(request.getParameter("upNum"));
	String title=request.getParameter("upTitle").trim();
	String content=request.getParameter("upContent").trim();
	if(title.equals("") || content.equals("")){%>
	<script>msgGo("비어 있는 값 저장불가","_05_updateBoard.jsp?upNum=<%=no%>");	</script>
	<%} else{
	BoardDAO.getInstance().updateBoard(no, title, content);}%>
	<script>msgGo("게시글 수정완료","_01_boardList.jsp");</script>
</body>
</html>