<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//순수 자바 코드영역
//java8 만들어진 날짜 객체

LocalDate now= LocalDate.now();
System.out.println(now);
String today = now.format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"));
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>안녕 test.jsp</h1>
	<h1><%= 10+3 %></h1>
	<h1>오늘은 <%=today %>이야</h1>
</body>
</html>