<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h1>회원가입</h1>
	<form action="${ctx }/join.do" method="post">
		<table border='1'>
			<tr>
				<td>아이디</td>
				<td width=200px><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="hobbies" value="sports">스포츠
					<input type="checkbox" name="hobbies" value="reading">독서
					<input type="checkbox" name="hobbies" value="drawing">그림
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>