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
	
	String writer=request.getParameter("writer").trim();
	String title=request.getParameter("addTitle").trim();
	String content=request.getParameter("addContent").trim();
	if(writer.equals("") || title.equals("") || content.equals("")){%>
	<script>msgGo("비어 있는 값 저장불가","_04_addBoard.jsp");	</script>
	<%} else{
		BoardDAO.getInstance().newBoard(writer, title, content);
	}%>
	<script>msgGo("게시판 추가완료","_01_boardList.jsp");</script>
	
</body>
</html>