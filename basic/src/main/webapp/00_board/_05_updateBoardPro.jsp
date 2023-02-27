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
	request.setCharacterEncoding("utf-8");
	
	int idx=Integer.parseInt(request.getParameter("idx"));
	String title=request.getParameter("upTitle").trim();
	String content=request.getParameter("upContent").trim();
	if(title.equals("") || content.equals("")){%>
	<script>msgGo("비어 있는 값 저장불가","_05_updateBoard.jsp");	</script>
	<%} else{
	BoardDAO.getInstance().updateBoard(idx, title, content);}%>
	<script>msgGo("게시글 수정완료","_01_boardList.jsp");</script>
</body>
</html>