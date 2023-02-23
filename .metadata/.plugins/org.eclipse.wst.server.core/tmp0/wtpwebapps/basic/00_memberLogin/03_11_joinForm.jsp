<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./member.css">
</head>
<body>

<div align="center">
	<h1> 회원가입 페이지 </h1>
	
	<form action="03_12_joinPro.jsp" method="post">
		<table border="1">
		    <tr>
				<td>아이디</td>
		        <td><input type="text" name="newId"></td>
		    </tr>
		    <tr>
		        <td>비밀번호</td>
		        <td><input type="text" name="newPw"></td>
		    </tr>
		    <tr>
				<td>이름</td>
		        <td><input type="text" name="newName"></td>
		    </tr>
		    <tr>
		        <td>성별</td>
		        <td>남성<input type="radio" name="newGen" value="m" checked>
		        여성<input type="radio" name="newGen" value="f"></td>
		    </tr>
		    <tr>
		    <td colspan="2"><input type="submit" value="회원가입"></td>
		    </tr>
		</table>
		<br>
	</form>
	<button onclick="location.href='02_main.jsp'">메인화면</button>
</div>
</body>
</html>