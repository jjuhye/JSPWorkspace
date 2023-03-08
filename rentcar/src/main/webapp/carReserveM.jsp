<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xx 렌트카</title>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<style>*{
	font-family: 'Gowun Dodum', sans-serif;
}
p.card-text{
	background-color:#00FEFE;
	text-decoration: underline;
}
</style>
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
			<div id="menu" class="col-3  py-3" onclick="location.href='main.do?center=carReserveMain'">예약하기</div>
			
			<div id="menu" class="col-2  py-3" onclick="location.href='main.do?center=carReserveView' ">예약확인</div>
			<div id="menu" class="col-2  py-3" onclick="location.href='#' ">자유게시판</div>
			<div id="menu" class="col-2  py-3" onclick="location.href='#'">이벤트</div>
			<div id="menu" class="col-3  py-3" onclick="location.href='#'">고객센터</div>
		</div>
	</header>
	
<form action="carView.do" method="post">
	<div class="row pt-3 px-3">
		<div class="col-9"></div>
		<div class="col-3">
			<div class="input-group">
				<label class="input-group-text" for="inputGroupSelect01">차량 검색</label>
			  	<select class="form-select" id="iii" required>
				    <option value="" disabled selected>차종</option>
				    <option value="1">소형</option>
				    <option value="2">중형</option>
				    <option value="3">대형</option>
			  	</select>
			  <input class="btn btn-outline-secondary" type="submit" id="search" value="검색"/>
			</div>
		</div>
	</div>
</form>
<hr class="mx-3" color=gray>

<div align="center" id="carView">
	<h2 class="py-3"style="color: gray">최신형 자동차</h2>
	<div class="row row-cols-1 px-5 row-cols-md-3 g-4">
	  <div class="col">
	    <div class="card p-3 h-100">
	      <img src="img/rent_logo.jpg" style="width: 100%" class="card-img-top">
	      <div class="card-body">
	        <h5>Mini</h5>
	        <p class="card-text">대여 가능 차량 : ${2}대</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card p-2 h-100">
	      <img src="img/rent_logo.jpg" style="width: 100%" class="card-img-top">
	      <div class="card-body">
	        <h5>Mini</h5>
	        <p class="card-text">대여 가능 차량 : ${2}대</p>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="card p-2 h-100">
	      <img src="img/rent_logo.jpg" style="width: 100%; height:280px" class="card-img-top">
	      <div class="card-body">
	        <h5>Mini</h5>
	        <p class="card-text">대여 가능 차량 : ${2}대</p>
	      </div>
	    </div>
	  </div>
	</div>
</div>

</body>
