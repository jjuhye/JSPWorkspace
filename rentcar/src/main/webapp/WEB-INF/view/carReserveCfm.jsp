<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="top.jsp"/>
<script>
function deleteRsv(rsvNo,carNo,qty){
	if(confirm("예약을 취소하시겠습니까?")){
		location.href="rsvDel.do?car_no="+carNo+"&rsv_no="+rsvNo+"&qty="+qty}; 
		alert("예약이 정상적으로 취소되었습니다.");
	}else{
		alert("예약이 취소되지 않았습니다.");
	}
}

</script>

<div class="p-2" align="center">
	<h2 class="py-5"style="color: gray">예약 확인 페이지</h2>
		
	<div class="px-5">
		<table class="table">
			<thead>
		    <tr>
		      <th scope="col">이미지</th>
		      <th scope="col">차량명</th>
		      <th scope="col">대여일</th>
		      <th scope="col">대여기간</th>
		      <th scope="col">금액</th>
		      <th scope="col">수량</th>
		      <th scope="col">보험</th>
		      <th scope="col">Wifi</th>
		      <th scope="col">네비게이션</th>
		      <th scope="col">베이비시트</th>
		      <th scope="col">삭제</th>
		    </tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach var="vo" items="${rsv_list}">
					<tr>
				      <c:forEach var="car_vo" items="${car_list}">
				      	<c:if test="${car_vo.no eq vo.no}">
					      	<td class="col-2"><img src="img/${car_vo.img}" style="width:100%; border-radius:10px"></td>
					      	<td style="vertical-align:middle">${car_vo.name}</td>
						    <td style="vertical-align:middle">${vo.dday}</td>
						    <td style="vertical-align:middle">${vo.rday}</td>
					    	<td style="vertical-align:middle">
 					    	${(car_vo.price+vo.usein*10000+vo.usewifi*10000+vo.useseat*10000)*vo.dday*vo.qty}
					    	</td>
						    <td style="vertical-align:middle">${vo.qty}</td>
						    <td style="vertical-align:middle">${vo.usein}</td>
						    <td style="vertical-align:middle">${vo.usewifi}</td>
						    <td style="vertical-align:middle">${vo.usenavi}</td>
						    <td style="vertical-align:middle">${vo.useseat}</td>
						    <td style="vertical-align:middle">
						    <input type="button" value="삭제" onclick="deleteRsv(${vo.reserve_seq},${vo.no},${vo.qty})">
<!-- 						    <input name="del" type="button" value="삭제"/></td> -->
				      	</c:if>
				      </c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="bottom.jsp"/>