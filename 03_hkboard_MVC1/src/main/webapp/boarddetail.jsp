<%@page import="com.hk.dtos.HKDto"%>
<%@page import="com.hk.daos.HKDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//dto → Object → dto  
	HKDto dto = (HKDto)request.getAttribute("dto");
%>
<body>
	<h1>게시판 상세보기</h1>
			<table border="1">
				<tr>
					<th>작성자(ID)</th>
					<td><%=dto.getId() %></td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td><%=dto.getTitle() %></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea rows="10" cols="60" name="content" required="required"><%=dto.getContent() %></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" onclick="updateForm('<%=dto.getSeq()%>')" value="수정폼 이동"/>
						<input type="button" onclick="delBoard(<%=dto.getSeq()%>)" value="삭제"/>
						<input type="button" value="글 목록" onclick="location.href= hkController.jsp?Command=boardlist"/>
					</td>
				</tr>
			</table>
	<script type="text/javascript">
		//수정폼으로 이동
		function updateForm(seq) {
			location.href = "boardupdateform.jsp?seq="+seq;
		}
		
		//글 삭제
		function delBoard(seq) {
			location.href = "deleteboard.jsp?seq="+seq;
		}
	</script>
</body>
</html>