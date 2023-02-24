<%@page import="basic.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./member.css">
</head>
<body>
<div align="center">
	<h1> 관리자 페이지(회원정보 확인하기) </h1>
	<table border="1">
	    <tr><th>번호</th><th>작성자</th><th>작성일</th><th>제목</th><th>내용</th><th>삭제</th></tr>
	    
	    <%
		request.setCharacterEncoding("utf-8");
	    String[][] mList=MemberDAO.getInstance().memberList();
	    
	    for(int i=0; i<mList.length; i++){ 
	    %>
	    	<tr><td><%=mList[i][0] %></td><td><%=mList[i][1] %></td>
	    	<td><%=mList[i][2] %></td><td><%=mList[i][3] %></td>
	    	<%
	    	if(i==0){
	    		%><td>삭제불가</td>
	    	<%}else{%>
	    	
	    	<td><button onclick="location.href='01_13_adminUserDelete.jsp?delIdx=<%=i %>'">삭제</button></td>
	    		
	    <%}}%>
	</table><br>
	<a href="01_11_adminMain.jsp">뒤로가기</a>
</div>
</body>
</html>