<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JH 렌트카</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/css/styleR.css">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
</head>
<body>
	<header>
		<div class="px-3 nav justify-content-between">
			<div class="py-3"><img src="img/rent_logo.jpg" width="100px" onclick="location.href ='${ctx}/main.do'" style="cursor:pointer"></div>
			<c:if test="${id eq null}">
				<div class="pt-4">
				<button onclick="location.href='main.do?center=memberLogin'" class="btn btn-outline-secondary btn-sm">로그인</button>
				</div>
			</c:if>
			
			<c:if test="${id ne null}">
				<div class="pt-4"><span>${id}님</span>  
				 <button onclick="location.href='${ctx}/logout.do'" class="btn btn-outline-secondary btn-sm">로그아웃</button></div>
			</c:if>
			
		</div>
		<div class="row">
			<div id="menu" class="col-3  py-3" onclick="location.href='carView.do?data=recent'">예약하기</div>
			
			<div id="menu" class="col-2  py-3" onclick="location.href='main.do?center=carReserveView'">예약확인</div>
			<div id="menu" class="col-2  py-3" onclick="location.href='#' ">자유게시판</div>
			<div id="menu" class="col-2  py-3" onclick="location.href='#'">이벤트</div>
			<div id="menu" class="col-3  py-3" onclick="location.href='#'">고객센터</div>
		</div>
	</header>