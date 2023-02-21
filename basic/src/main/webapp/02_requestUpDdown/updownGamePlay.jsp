<%@page import="java.util.Random"%>
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
	int num=0;
	String play=request.getParameter("play");
	if(play==null){
		Random rd = new Random();
		num=rd.nextInt(20)+1;
	}else{
		num=Integer.parseInt(play);
	}
	%>
	치트키 : <%=num%>
	<h1>Up Down 게임</h1>
	<h2>1~20사이에 값 입력</h2>
<form action="updownGamePlaypro.jsp" method="post">
	<input type="hidden" name="result" value=<%=num%>>
	<input type="text" name="answer" value="0">
	<input type="submit" value="확인">
</form>
</body>
</html>