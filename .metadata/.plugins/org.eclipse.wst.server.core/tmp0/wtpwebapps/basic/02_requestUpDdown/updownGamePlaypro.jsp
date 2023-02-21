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
String result=request.getParameter("result");
String answer=request.getParameter("answer");
int rt=Integer.parseInt(result);
int as=Integer.parseInt(answer);
String msg="";

	if(rt>as){
		msg="Down";
	} else if (rt<as){
		msg="Up";
	}else{
		msg="정답입니다";
		rt=0;
	}

%>
<h1><%=msg %></h1>
if(rt==0){

}else{<a href="updownGamePlay.jsp?play=<%=rt%>">[뒤로가기]</a>
</body>
</html>