<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="top.jsp"/>

<script>
	$(document).ready(function() {

		$("#login").click(function() {
			
			if (checkIt()) {	//입력폼에 입력한 상황 체크
				//입력된 사용자의 아이디와 비밀번호를 얻어냄
				let query = {
					id : $("#id").val(),
					pw : $("#pw").val()
				};
	
				$.ajax({
					type : "POST",
					url : "login.do",
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
	});
	
	//인증되지 않은 사용자 영역에서 사용하는 입력 폼의 입력값 유무 확인
	function checkIt() {
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
	}
</script> 

<div align="center">
	<h2 class="pt-5 pb-2"style="color: gray; font-weight:bold"> 로그인</h2>
	<div class="py-2" >아 이 디 &nbsp &nbsp<input type="text" id="id"/></div>
	<div class="py-2"  >비밀번호 &nbsp <input type="text" id="pw"/></div>
	<div class="py-2"><button id="login" class="btn btn-outline-secondary btn-sm">로그인</button></div>
</div>

<jsp:include page="bottom.jsp"/>