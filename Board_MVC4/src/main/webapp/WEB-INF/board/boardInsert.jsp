<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<style>
tr :last-child {
	text-align: left;
}

input[type=submit], input[type=reset] {
	text-align: center;
}

#btns {
	text-align: center;
}
</style>

<script type="text/javascript">

let check = 0;
function idcheck(){
	 if($("#id").val()==''){
		 alert("아이디를 입력하세요.");
		 $("#id").focus();
		 $("#id").css("border", "");
		 return;
	 }
	 let id=$("#id").val();
	 // 클라이언트와 서버와 통신하는 방법 
	 $.ajax({ 
		 url : "${ctx}/vaildIdAjax.do",
		 type : "POST",
		 data : {"id" : id},
		 success : getResult,  //함수(callback)
		 error : function(){ alert("error"); }    		 
	 });
}  

function getResult(data){    	
	 if(data =="valid"){
		 alert("사용가능한 id 입니다.");
		 $("#pw").focus();
		 $("#id").css("border", "3px blue solid")
		 check = 1;
	 }else if(data=="notValid"){
		 alert("이미 사용하고 있는 id 입니다.");
		 $("#id").val("");
		 $("#id").focus();
		 $("#id").css("border", "3px red solid")
		 check = -1;
	 } 	 
}

function validCheck(form){
	if(check == 0){
		alert('id 중복체크 해주세요');
		return false;
	} else if(check == -1){
		alert('id 중복체크 다시하세요');
		return false;
	}
	/*

		@ 앞에는 영어소문자 . _ % + - 만 허용

		@ 골뱅이 필수.

		@ 뒤 . 앞에는 영어소문자 . - 만 허용

		. 점 필수

		. 뒤에는 영어소문자 2자리 이상
		*/
	if(!form.email.value.match( /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/)){
		alert("이메일 형식이 다릅니다");
		form.email.value="test@test.com";
		form.email.focus();
		return false;
	}
	
	if(!form.phone.value.match( /010-\d{3,4}-\d{4}/)){
		alert("전화번호 형식이 다릅니다");
		form.phone.value="010-1234-1234";
		form.phone.focus();
		return false;
	}
	
	form.submit();
	
}



window.onload = function(){
	$("#id").keyup(function(e) {
		 if(e.keyCode=='8'){
			 check =0;
		 }
	  $("#id").css("border", "");
	});
}
</script>
<body>
	<h1 class="py-3">회원 가입</h1>
	<form action="${ctx}/memberInsert.do" method="post" >
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td><input class="col-5" type="text" name="id" id="id" autofocus required />
				 <input type="button" value="중복체크" onclick="idcheck()" class="btn btn-outline-dark"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input class="col-5" type="password" name="pass" id="pw" required/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="col-5" type="text" name="name" id="name" required/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input class="col-5" type="number" name="age" id="age" required /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input class="col-5" type="text" name="email" id="email" required/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input class="col-5" type="tel" name="phone" id="phone" required/></td>
			</tr>
			<tr>
				<td colspan="2" id="btns">
					<input type="button" value="가입" class="col-3 btn btn-primary" onclick="validCheck(form)" /> 
					<input type="reset" value="취소" class="col-3 btn btn-warning" /></td>
			</tr>
		</table>
	</form>
	

</body>
</html>