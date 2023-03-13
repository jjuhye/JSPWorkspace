<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<jsp:include page="top.jsp"/>
<script>
 	$(document).ready(function(){
 		
 		$("#ordday").change(function(){
			if($('#ordday').val()<checkToday()){
			alert("오늘 이전 날짜 선택 불가");
 			document.getElementById("ordday").value=checkToday();
			}
		});
	});

	function checkToday(){
		let today = new Date();   
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		month= month<10 ? "0"+month : month;
		let date = today.getDate();
		date= date<10 ? "0"+date : date;
		today=year + '-' + month + '-' + date;
		return today;
	}
	
	function check(){
		if($('#ordday').val()==''){
 			alert("대여 날짜를 선택해주세요");
 			return false;
 		}else{
 			if(confirm("아래 옵션으로 예약 하시겠습니까?")){
 				alert("예약 완료되었습니다.");
 				return true;
 			}else{
 				alert("예약을 취소합니다.")
 				$("#sendForm").attr("action","carView.do?data=r");
 				return true;
 			}
 		}
 	}
</script>

<div class="p-2" align="center" width="80%" >
	<h2 class="py-5"style="color: gray"><font color="red">${car.name} ${qty} 대</font> 예약하기 (옵션 선택)</h2>
		
	<form id="sendForm" action="rsvCfm.do?id=${id}&carNo=${car.no}&qty=${qty}" method="post" onsubmit='return check()'>
		<div class="row px-3">
			<div class="col-6 px-4"><img src="img/${car.img}" style="width:100%; border-radius:10px"></div>
			<div class="col-6 px-4">
				<div class="col">
					<table style="width:100%">
					<tr><td class="py-3">대여기간</td>
						<td><select class="order" name="dday">
						<option value="1" selected>1일</option>
						<option value="2">2일</option>
						<option value="3">최대 3일</option>
						</select>
						</td></tr>
					<tr><td class="py-3">대여일</td><td>
						<input id="ordday" name="rday" type="date" onkeydown="return false"/></td></tr>
					<tr><td class="py-3">보험적용</td>
						<td><select name="usein">
						<option value="1" selected>적용(1일1만원)</option>
						<option value="0">미적용</option>
						</select></td></tr>
					<tr><td class="py-3">Wifi적용</td>
						<td><select name="usewifi">
						<option value="1">적용(1일1만원)</option>
						<option value="0" selected>미적용</option>
						</select></td></tr>
					<tr><td class="py-3">네비게이션 적용</td>
						<td><select name="usenavi">
						<option value="1" selected>적용(무료)</option>
						<option value="0">미적용</option>
						</select></td></tr>
					<tr><td class="py-3">베이비시트 적용</td>
						<td><select name="useseat">
						<option value="1">적용(1일1만원)</option>
						<option value="0" selected>미적용</option>
						</select></td></tr>
					</table>
					<div class="py-3">
					<input type="submit" class="p-2 m-2" value="차량 예약하기"/>
				</div>
			</div>
		</div>
		</div>
	</form>
</div>

<jsp:include page="bottom.jsp"/>