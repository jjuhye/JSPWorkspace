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
/* String play=request.getParameter("play"); */
String result=request.getParameter("result");
String answer=request.getParameter("answer");
int rt=Integer.parseInt(result);
int as=Integer.parseInt(answer);
String msg="";

boolean check=false;
	if(rt>as){
		msg="Down";
	} else if (rt<as){
		msg="Up";
	}else{
		msg="정답입니다";
		check=true;
	}

%>
<h1><%=msg %></h1>
<%if(check){
%>
	<a href="index.jsp">[처음으로]</a>
<%}else{
%>
	<a href="updownGamePlay.jsp?rqNum=<%=result%>">[뒤로가기]</a>
<%}%>
</body>
</html>