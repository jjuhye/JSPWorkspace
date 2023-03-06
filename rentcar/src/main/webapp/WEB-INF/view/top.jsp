<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${ctx }/css/styleR.css">
</head>
<body>
	<header>
		<div class="px-3 nav justify-content-between">
			<div class="py-3"><img src="img/rent_logo.jpg" width="100px" ></div>
			<c:if test="${log eq null}">
				<div class="pt-4"><a href='main.do?center=memberLogin'>
				<button type="button" class="btn btn-outline-secondary btn-sm">로그인</button></a>
				</div>
			</c:if>
			
			<c:if test="${log ne null}">
				<div class="pt-4"><span id="login">***님</span>  
				 <a href='main.do?center=memberLogout'><button type="button" class="btn btn-outline-secondary btn-sm">로그아웃</button></a></div>
			</c:if>
			
		</div>
		<div class="row">
			<div id="menu" class="col-3  py-3" onclick="location.href='main.do?center=carReserveMain'">예약하기</div>
			
			<div id="menu" class="col-2  py-3" onclick="location.href='main.do?center=carReserveView' ">예약확인</div>
			<div id="menu" class="col-2  py-3" onclick="location.href='#' ">자유게시판</div>
			<div id="menu" class="col-2  py-3" onclick="location.href='#'">이벤트</div>
			<div id="menu" class="col-3  py-3" onclick="location.href='#'">고객센터</div>
		</div>
	</header>