<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="top.jsp"/>

<!-- <script>
	$(document).ready(function() {
		let text=request.getAttribute('text');
		alert("carText: "+text);
		$('#carView').append(text);
		$("#search").click(function() {
			$("#carKind option:selected").val();
			let searchVal=$("#carKind option:selected").val();
			$.ajax({
				type : "get",
				url : "carView.do",
				data : searchVal,
				success : function(data) {
					let innerText=data.value;
					alert(innerText);
					$('#carView').append(innerText);
				}
			});
		});
	});
</script>  -->

<form action="carView.do" method="post">
	<div class="row pt-3 px-3">
		<div class="col-9"></div>
		<div class="col-3">
			<div class="input-group">
				<label class="input-group-text" for="inputGroupSelect01">차량 검색</label>
			  	<select class="form-select" name="data">
				    <option value="1">소형</option>
				    <option value="2">중형</option>
				    <option value="3">대형</option>
				    <option value="4" selected>전체</option>
			  	</select>
			  <input class="btn btn-outline-secondary" type="submit" id="search" value="검색"/>
			</div>
		</div>
	</div>
</form>
<hr class="mx-3" color=gray>

<div align="center" id="carView">
${text}
</div>

<jsp:include page="bottom.jsp"/>