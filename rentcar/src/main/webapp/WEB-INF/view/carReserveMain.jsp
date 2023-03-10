<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<jsp:include page="top.jsp"/>

<form action="carView.do" method="post">
	<div class="row pt-3 px-3">
		<div class="col-9"></div>
		<div class="col-3">
			<div class="input-group">
				<label class="input-group-text" for="inputGroupSelect01">차량 검색</label>
			  	<select class="form-select" name="data">
				    <option value="r" selected>최신형</option>
				    <option value="1">소형</option>
				    <option value="2">중형</option>
				    <option value="3">대형</option>
				    <option value="a">전체</option>
			  	</select>
			  <input class="btn btn-outline-secondary" type="submit" id="search" value="검색"/>
			</div>
		</div>
	</div>
</form>
<hr class="mx-3" color=gray>

<div align="center" id="carView">
	<h2 class="py-3" style="color: gray">${kind} 자동차</h2>
	<div class="row row-cols-1 px-5 row-cols-md-3 g-4">
	<c:forEach var="vo" items="${list}">
	<div class="col">
		<div class="card p-2 h-100" onclick="location.href='reserve.do?carNo=${vo.no}'" style="cursor:pointer">
			<img src="img/${vo.img}" style="width: 100%" class="card-img-top">
			<div class="card-body">
				<h5>차량명 : ${vo.name}</h5>
				<p class="card-text">대여 가능 : ${vo.usepeople}대</p>
			</div>
		</div>
	</div>	
	</c:forEach>
	</div>
</div>

<jsp:include page="bottom.jsp"/>