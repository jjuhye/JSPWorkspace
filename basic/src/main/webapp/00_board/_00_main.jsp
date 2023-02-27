<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="./board.css">
<!-- <script type="text/javascript" src="./member.js"></script> -->
</head>
<body>
<div>
	<h1> 게시판 </h1>
    <div><a href="_01_boardList.jsp"> 전체 게시글 확인하기 </a></div>
    <div><a href="_02_addDummyPro.jsp"> 더미 게시글 추가하기 </a></div>
    <div><a href="_03_deleteAllBoard.jsp"> 전체 게시글 삭제하기 </a></div>
    <div><a href="_04_addBoard.jsp"> 게시글 추가하기 </a></div>
    <hr>
    <div><a href="_08_boardListPaging.jsp"> 페이징 게시판 </a></div>
</div>
</body>
</html>