<%@page import="kr.basic.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
int delidx=Integer.parseInt(request.getParameter("delIdx"));

MemberDAO.getInstance().delMember(delidx);

response.sendRedirect("01_12_adminUserList.jsp");
%>
</body>
</html>