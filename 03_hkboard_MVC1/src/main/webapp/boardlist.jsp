<%@page import="com.hk.dtos.HKDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.daos.HKDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<%
	HKDao dao = new HKDao();
	List<HKDto> lists = dao.getAllList();
%>
<meta charset="UTF-8">
<title>게시판 글목록 조회</title>
<style type="text/css">
	th{
		background-color: silver;
		color: white;
	}
	
</style>
</head>
<body>
	<h1>게시판</h1>
	<h2>글목록</h2>
	
	<table>
		<col width="50px">
		<col width="100px">
		<col width="300px">
		<col width="200px">
		<tr>
			<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
		</tr>
		
		<%
			for(HKDto dto: lists){
				%>
				<tr>
					<td><%=dto.getSeq()%></td>
					<td><%=dto.getId()%></td>
					<td><a href="boarddetail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
					<td><%=dto.getRegDate()%></td>
				</tr>
				<% 
			}
		%>
		<tr>
			<td colspan="4">
				<button onclick="insertBoardForm()">글 추가</button>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		function insertBoardForm() {
			location.href = "insertboardForm.jsp"
		}
	</script>
</body>
