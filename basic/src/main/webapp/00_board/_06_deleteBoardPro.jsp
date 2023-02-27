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
int no=Integer.parseInt(request.getParameter("delNo"));
BoardDAO.getInstance().delBoard(no);
String stt = request.getParameter("pg");
if(stt==null){
%>
<script>
msgGo("게시글 삭제 완료","_01_boardList.jsp");
</script>
<%}else{%>
<!-- <input type="hidden" name="start" value=stt> -->
<script>
msgGo("게시글 삭제완료","_07_boardListPaging.jsp?start=<%=stt%>");
</script>
<%}%>
</body>
</html>