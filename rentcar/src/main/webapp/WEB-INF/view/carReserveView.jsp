<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<jsp:include page="top.jsp"/>
<div class="p-2" align="center" width="100%" >
		<h2 class="py-5"style="color: gray">렌트카 예약하기</h2>
		
	<form action="reserve.do?page=option" method="post">
		<div class="row p-3">
			<div class="col-7 px-4"><img src="img/${car.img}" style="width:100%; border-radius:10px"></div>
			<div class="col-5 px-4">
				<div class="col">
					<table style="width:100%">
					<tr><td class="py-3">대여차량</td><td style="font-size:1.4rem; font-weight:bold; color:#ff8080">${car.name}</td></tr>
					<tr><td class="py-3">대여수량</td>
					<td >
						<c:if test="${car.usepeople eq 0}">
							대여 가능 차량이 없습니다.
						</c:if>
						<c:if test="${car.usepeople ne 0}">
							<select id="qty">
							<c:forEach var="i" begin="1" end="${car.usepeople}">
								<option value="${i}">${i}</option>";
							</c:forEach>
							</select>
						</c:if>
						</td></tr>
					<tr><td class="py-3">차량분류</td><td>${kind}</td></tr>
					<tr><td class="py-3">대여가격</td><td>${car.price}</td></tr>
					<tr><td class="py-3">제조회사</td><td>${car.company}</td></tr>
					</table>
					<c:if test="${id eq null}">
					<div class="py-3" style="color: #ff8080">로그인 후 예약가능합니다.</div>
					</c:if>
					<c:if test="${car.usepeople ne 0 && id ne null}">
					<div class="py-3">
					<input class="p-2" id="buy" type="submit" value="옵션 선택 후 예약하기 >"/></div>
					</c:if>
				</div>
			</div>
		</div>
		<input name="carNo" type="hidden" value="${car.no}"/>
	</form>
	<div class="p-3" align="center">
		<hr class="mx-3" color=gray>
		<h5 style=" color: #ff8080">차량 상세정보</h5>
		${car.info}
	</div>
</div>

<jsp:include page="bottom.jsp"/>