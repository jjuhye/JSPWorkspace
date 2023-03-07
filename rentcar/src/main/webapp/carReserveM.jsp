<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xx 렌트카</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
</head>
<body>
    
<form action="carView.do" method="post">
	<font size="4" color="gray"><b>차량 검색하기</b></font>&nbsp;&nbsp;
	<select class="pb-1" name="carType">
		<option value="1">전체</option>
		<option value="2">소형</option>
		<option value="3">중형</option>
		<option value="4">대형</option>
	</select>
	<input type="button" value="검색" class="btn btn-outline-secondary btn-sm py-1"/>
</form>
<hr color=gray>

<div align="center" class="row p-2" id="carView">
	<h2 class="py-3"style="color: gray; font-weight:bold">최신형 자동차</h2>
	<div class="col-4"><img src="img/rent_logo.jpg" width="90%" height="100%" onclick="location.href ='${ctx}/main.do'" style="cursor:pointer"><br><br>차량명: 올란도</div>
	<div class="col-4"><img src="img/rent_logo.jpg" width="90%" height="100%" onclick="location.href ='${ctx}/main.do'" style="cursor:pointer"><br><br>차량명: 올란도</div>
	<div class="col-4"><img src="img/rent_logo.jpg" width="90%" height="100%" onclick="location.href ='${ctx}/main.do'" style="cursor:pointer"><br><br>차량명: 올란도</div>
</div>

</body>
