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
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");

	session.setAttribute("name", name);
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	
%>

</body>
</html>