<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h1>가입정보</h1>
		<table border='1'>
			<tr>
				<td>아이디</td>
				<td width=200px>${Member.id }</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>${Member.pw }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${Member.name}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${Member.email }</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>${Member.hobbyt }</td>
			</tr>
		</table>
</div>
</body>
</html>