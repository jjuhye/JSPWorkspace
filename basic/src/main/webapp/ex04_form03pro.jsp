<%@page import="basic.Util"%>
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
String no1 = request.getParameter("num1");
String no2 = request.getParameter("num2");

boolean ch1 = true;
boolean ch2 = true;

for(int i =0 ; i < no1.length(); i++){
	if(no1.charAt(i)<'0' ||no1.charAt(i) >'9' ){
		ch1 = false;
	}
}

for(int i =0 ; i < no2.length(); i++){
	if(!Character.isDigit(no2.charAt(i))){
		ch2 = false;
	}
}

if(ch1 && ch2){
	int n1=Integer.parseInt(no1);
	int n2=Integer.parseInt(no2);
	String big="";
	if(n1==n2){
	%>
	<h1>두 숫자가 같습니다</h1>
	<%
	}else{
		if(n1>n2){
		big="num1 :"+n1;
		}else{
		big="num2 :"+n2;
		}
	%>
	<h1>더 큰 숫자는 <%=big %> 입니다</h1>
	<%
	}
}else{
%>
<h1>숫자가 아닌값이 있습니다</h1>
<%
}
%>
</body>
</html>