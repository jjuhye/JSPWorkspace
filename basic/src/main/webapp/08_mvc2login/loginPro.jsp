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
	
	String dbid="qwer";
	String dbpw="1234";

	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	String msg="";
	if(id.equals(dbid) && pw.equals(dbpw)){
		msg="로그인 성공";
	}else{
		msg="로그인 실패";
	}
	
%>
<h1><%=msg %></h1>
</body>
</html>