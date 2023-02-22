<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<link rel="stylesheet" href="./member.css">
</head>
<body>

<div align="center">
	<h1> 로그인 페이지 </h1>
	
	<form action="03_22_loginPro.jsp" method="post">
		<table border="1">
		    <tr>
				<td>아이디</td>
		        <td><input type="text" name="loginId"></td>
		    </tr>
		    <tr>
		        <td>비밀번호</td>
		        <td><input type="text" name="loginPw"></td>
		    </tr>
		    <tr>
		    <td colspan="2"><input type="submit" value="로그인"/></td>
		    </tr>
		</table>
		<br>
		<input type="submit" value="메인화면" formaction="02_main.jsp"/>
	</form>
</div>
</body>
</html>