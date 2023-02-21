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
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String grade=request.getParameter("grade");
	String subject=request.getParameter("subject");
	String memo=request.getParameter("memo");
	String hobby[]=request.getParameterValues("hobbies");
	String hobbies="";
	for(String s=0; s)
%>

<table border="1">
<tr>
<td>번호</td>
<td>이름</td>
<td>학년</td>
<td>과목</td>
<td>취미</td>
<td>메모</td>
</tr>
<tr>
<td><%=num %></td>
<td><%=name %></td>
<td><%=grade %></td>
<td><%=subject %></td>
<td><%=hobby %></td>
<td><%=memo %></td>
</tr>
</table>

</body>
</html>