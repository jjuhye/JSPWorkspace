<%@page import="board.model.BoardDAO"%>
<%@page import="board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file= "header.jsp" %>
	<%
	    String curPage = request.getParameter("start");
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardVO> list=dao.getPageData(curPage);
	%>
	
	전체 게시글 수 : <%= dao.boardList().size() %>개
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	<%
		for(int i=0; i<list.size(); i++) {
	%>	
		<tr>
			<td><%= list.get(i).getNo() %></td>
			<td><%= list.get(i).getName() %></td>
			<td><%= list.get(i).getRegDate() %></td>
			<td><%= list.get(i).getTitle() %></td>
			<td><%= list.get(i).getContent() %></td>
			<td>
<%-- 	<%int idx=BoardDAO.getInstance().getIdx(list.get(i).getNo());%>  --%>
				<button onclick="window.location.href='_06_deleteBoardPro.jsp?delNo=<%=list.get(i).getNo()%> &start=<%=curPage%>'">삭제하기</button>
			</td>
		</tr>
	
	<%	} %>
	</table>
	
	<%
		String endPage = request.getParameter("end");
		int[] nums =dao.addPageNextBefore(endPage); 
	    int start = nums[0];
	    int end = nums[1];
	    int pageLimit = nums[2];
	    int totalPageNum = nums[3];
	%>
	
	<%  if(start > pageLimit) { %>             <!--  4-1 : 3   -->  <!-- 계속 3으로 유지 4-3 1   -->
		[<a href="_07_boardListPaging.jsp?start=<%= start - 1 %>&end=<%= start - pageLimit %>">이전</a>]
	<%	} %>
	<!-- 1 2 3 -->  <!-- 4 5 6  -->  <!-- end는 페이지 끝 번호  -->
	<%  for(int i=start; i<=end; i++) { %>
			[<a href="_07_boardListPaging.jsp?start=<%= i %>&end=<%= start %>"><%= i %></a>]
	<%	} %>
	
	<%  if(end < totalPageNum) { %>
		[<a href="_07_boardListPaging.jsp?start=<%= start + pageLimit %>&end=<%= start + pageLimit%>">이후</a>]
	<%	} %>
</body>
</html>