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
BoardDAO.getInstance().delAllBoard();
%>
<script>
msgGo("게시글 전체 삭제 완료","_00_main.jsp");
</script>
</body>
</html>