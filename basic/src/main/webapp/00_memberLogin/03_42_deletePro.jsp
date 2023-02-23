<%@page import="basic.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="./member.js"></script>
<%
	int delInt = (int)session.getAttribute("idx");
	
	String delPw=request.getParameter("delPw");

	if(MemberDAO.getInstance().checkPw(delPw,delInt)){
		MemberDAO.getInstance().delMember(delInt);
		%>
		<script>msgGo("회원탈퇴 완료","03_23_logoutPro.jsp")</script>
		<%
	}else{
		%>
		<script>msgGo("비밀번호가 틀립니다","03_41_deleteForm.jsp")</script>
		<%
	}
%>
</body>
</html>