<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   session.removeAttribute("log");
%>
<script>
alert('로그아웃 하셨습니다')
location.href="01_memberlist.jsp";
</script>
</body>
</html>