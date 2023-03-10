<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<jsp:include page="top.jsp"/>
<script>
function check(){
	alert("테스트");
	alert(checkToday());
}

function checkToday(){
	let today = new Date();   

	let year = today.getFullYear();
	let month = today.getMonth() + 1;
	let date = today.getDate();

	today=year + '-' + month + '-' + date;
	return today;
}
</script>

<div class="p-2" align="center" width="100%" >
	<h2 class="py-5"style="color: gray"><font color="red">${car.name}</font> 예약하기 (옵션 선택)</h2>
		
	<form action="reserve.do?carNo=${car.no}" method="post">
		<div class="row p-3">
			<div class="col-7 px-4"><img src="img/${car.img}" style="width:100%; border-radius:10px"></div>
			<div class="col-5 px-4">
				<div class="col">
					<table style="width:100%">
					<tr><td class="py-3">대여기간</td>
						<td><select id="dday">
						<option value="1" selected>1일</option>
						<option value="2">2일</option>
						<option value="3">최대 3일</option>
						</select>
						</td></tr>
					<tr><td class="py-3">대여일</td><td id="rday"><input type="date"/></td></tr>
					<tr><td class="py-3">보험적용</td>
						<td><select id="usein">
						<option value="insY" selected>적용(1일1만원)</option>
						<option value="insN">미적용</option>
						</select></td></tr>
					<tr><td class="py-3">Wifi적용</td>
						<td><select id="usewifi">
						<option value="wifiY" selected>적용(1일1만원)</option>
						<option value="wifiN">미적용</option>
						</select></td></tr>
					<tr><td class="py-3">네비게이션 적용</td>
						<td><select id="usenavi">
						<option value="navY" selected>적용(무료)</option>
						<option value="navN">미적용</option>
						</select></td></tr>
					<tr><td class="py-3">베이비시트 적용</td>
						<td><select id="useseat">
						<option value="navY" selected>적용(1일1만원)</option>
						<option value="navN">미적용</option>
						</select></td></tr>
					</table>
					<div class="py-3">
					<input class="p-2" id="buy" type="button" value="차량 예약하기" onclick="check()"/></div>
				</div>
			</div>
		</div>
	</form>
</div>

<jsp:include page="bottom.jsp"/>