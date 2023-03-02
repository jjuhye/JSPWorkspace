<%@page import="java.io.Console"%>
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
String tempNo=request.getParameter("delNo").trim();
/* int no=Integer.parseInt(request.getParameter("delNo")); */
int no=Integer.parseInt(tempNo);
BoardDAO.getInstance().delBoard(no);
String curPage=request.getParameter("start");
System.out.println(curPage);
if(curPage==null){
%>
<script>
msgGo("게시글 삭제 완료","_01_boardList.jsp");
</script>
<%}else{%>
<script>
msgGo("게시글 삭제완료","_07_boardListPaging.jsp?start=<%=curPage%>");
</script>
<%}%>
</body>
</html>