<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
    
<div align="center">
	<h1 class=py-5> 메인페이지 </h1>
	
	<%
	Object obj = session.getAttribute("idx");
	%>
	
	<table border="1">
	<% if(obj == null){ %>
	    <tr>
	        <td><a href="03_11_joinForm.jsp"> 회원가입 </a></td>
	        <td><a href="03_21_loginForm.jsp"> 로그인 </a></td>
	    </tr>
	<%}else{ %>
	    <tr>
	        <td><a href="03_23_logoutPro.jsp"> 로그아웃 </a></td>
	        <td><a href="03_31_updateForm.jsp?loginIdx=<%=obj%>"> 회원정보수정 </a></td>
	        <td><a href="03_41_deleteForm.jsp"> 회원탈퇴 </a></td>
	    </tr>
	<%} %>
	</table>
</div>
</body>
</html> 