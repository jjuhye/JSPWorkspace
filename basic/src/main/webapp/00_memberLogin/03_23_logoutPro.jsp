<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./member.js"></script>
</head>
<body>
<%
session.removeAttribute("idx");
%>
<script>msgGo("로그아웃 완료","02_main.jsp")</script>
</body>
</html>