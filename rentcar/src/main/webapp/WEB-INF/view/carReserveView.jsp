<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="top.jsp"/>

<script>
	$(document).ready(function() {
		let carNo=request.getAttribute("no");
		/* $(".card-img-top").click(function(){ */
			alert("#id");
			if($("#id").length()){
				$("#revStep1").show();
				$("#revStep2").hide();
				/* return response.sendRedirect("/rsvCheck.do"); */
			}else{
				alert("로그인이 필요합니다.");
				/* return request.getRequestDispatcher("/login.do").forward(request, response); */
			};
		});
		
		$("#nextSelect").click(function() {
			
			$("#revStep1").hide();
			$("#revStep2").show();
		});
			/* if (checkIt()) {	//입력폼에 입력한 상황 체크
				//입력된 사용자의 아이디와 비밀번호를 얻어냄
				let query = {
					id : $("#id").val(),
					pw : $("#pw").val()
				};
	
				$.ajax({
					type : "POST",
					url : "carView.do",
					data : query,
					success : function(data) {
						if(data == 1){
							alert("로그인성공");
							window.location.href = "main.do";
						}else {
							alert("아이디와 패스워드를 확인해주세요.");
							$("#id").val("");
							$("#pw").val("");
						}	
					}
				});
			}
		});
	}); */
	
/* 	function q1() {
		// 여기에 코드를 입력하세요
		$('#names-q1').empty();
		$.ajax({
		type: "GET",
		url: "http://spartacodingclub.shop/sparta_api/seoulair",
		data: {},
		success: function (response) {
		let rows = response["RealtimeCityAir"]["row"];
		for (let i = 0; i < rows.length; i++) {
		let gu_name = rows[i]['MSRSTE_NM'];
		let gu_mise = rows[i]['IDEX_MVL'];
		let temp_html = `<li>${gu_name} : ${gu_mise}</li>`
		$('#names-q1').append(temp_html);
		}
		}
		})
	} */
	
	//인증되지 않은 사용자 영역에서 사용하는 입력 폼의 입력값 유무 확인
/* 	function checkIt() {
		// trim() : 좌우공백제거
		if (!$.trim($("#id").val())) {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}else if (!$.trim($("#pw").val())) {
			alert("비밀번호를 입력하세요.");
			$("#pw").focus();
			return false;
		}else{
			return true;
		}
	} */
</script> 

<div align="center">
	<form action="reserve.do?rsvStep=option" method="post" id="revStep1">
		<h2 class="py-3"style="color: gray">렌트 예약하기</h2>
		<div class="row">
			<div class="col-6">이미지</div>
			<div class="col-6">
				<div class="col">
					<table>
					<tr class="py-2"><td>차량이름</td><td>이름...</td></tr>
					<tr><td>차량이름</td><td>이름...</td></tr>
					<tr><td>차량이름</td><td>이름...</td></tr>
					<tr><td>차량이름</td><td>이름...</td></tr>
					<tr><td>차량이름</td><td>이름...</td></tr>
					<tr><td colspan="2"><input type="submit" value="옵션 선택후 구매하기"/></td></tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>

<jsp:include page="bottom.jsp"/>