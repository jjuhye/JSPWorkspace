<%@page import="basic.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="./member.css">
</head>
<body>

<% 
int loginIdx=(int)session.getAttribute("idx");
/* int loginIdx=Integer.parseInt(request.getParameter("loginIdx")); */
String[] member=MemberDAO.getInstance().memberData(loginIdx);
String id=member[0];
/* String pw=member[1]; */
String name=member[2];
String gender=member[3];
%>

<div align="center">
	<h1> 회원정보 수정 </h1>
	
	<form action="03_32_updatePro.jsp?upIdx=<%=loginIdx%>" method="post">
		<table border="1">
		    <tr>
				<td>아이디</td>
		        <td><%=id %></td>
		    </tr>
		    <tr>
		        <td>비밀번호</td>
		        <td><input type="text" name="upPw"></td>
		    </tr>
		    <tr>
				<td>이름</td>
		        <td><input type="text" name="upName" value=<%=name %>></td>
		    </tr>
		    <tr>
		        <td>성별</td>
		        <% 
				if(gender.equals("남성")){%>
		        <td>남성<input type="radio" name="upGen" value="m" checked>
		        	여성<input type="radio" name="upGen" value="f"></td>
				<%} else{%>
		        <td>남성<input type="radio" name="upGen" value="m">
		        	여성<input type="radio" name="upGen" value="f" checked></td>
				<%}%>
		    </tr>
		    <tr>
		    <td colspan="2"><input type="submit" value="정보 수정"></td>
		    </tr>
		</table>
		<br>
	</form>
	<button onclick="location.href='02_main.jsp'">메인화면</button>
</div>
</body>
</html>