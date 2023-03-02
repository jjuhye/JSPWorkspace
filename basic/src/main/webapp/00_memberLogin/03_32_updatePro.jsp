<%@page import="kr.basic.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./member.js"></script>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
int loginIdx=Integer.parseInt(request.getParameter("upIdx"));
String[] member=MemberDAO.getInstance().memberData(loginIdx);
String id=member[0];
String pw=member[1];
String name=member[2];
String gender=member[3];


String upPw=request.getParameter("upPw");
String upName=request.getParameter("upName");
String upGen=request.getParameter("upGen");

if(upPw.equals("")){
	%>
	<script>msgGo("비밀번호를 입력해주세요","03_31_updateForm.jsp?loginIdx=<%=loginIdx%>")</script>
	<%
}else if(!pw.equals(upPw)){
	%>
	<script>msgGo("비밀번호가 틀립니다","03_31_updateForm.jsp?loginIdx=<%=loginIdx%>")</script>
	<%
}else{
	if(name.equals(upName)){
	upName=name;
	}
	if(gender.equals(upGen)){
	upGen=gender;
	}
	if(request.getParameter("upGen").equals("m")){
		upGen="남성";
	}else{
		upGen="여성";
	}
	MemberDAO.getInstance().updateMember(loginIdx, id, pw, upName, upGen);
	%>
	<script>msgGo("회원정보 수정완료","02_main.jsp")</script>
	<%
}
%>
</body>
</html>