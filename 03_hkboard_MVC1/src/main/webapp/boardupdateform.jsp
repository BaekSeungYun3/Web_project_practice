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
<title>게시판 글 수정폼</title>
</head>
<body>
<%
	/* //boarddetail.jsp → parameter: seq 전달
	String sseq = request.getParameter("seq");	//반환값은 항상 문자열
	int seq = Integer.parseInt(sseq);	//int형으로 변환
	
	HKDao dao = new HKDao(); */
	HKDto dto = (HKDto)request.getAttribute("dto");
%>
	<h1>글 수정하기</h1>
		<form action="hkController.jsp" method="post">
			<input type="hidden" name="command" value="boardupdate"/>
			<input type="hidden" name="seq" value="<%=dto.getSeq()%>"/>
			<table border="1">
				<tr>
					<th>작성자(ID)</th>
					<td><%=dto.getId()%></td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td><input type="text" name="title" value="<%=dto.getTitle()%>" required="required"/></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea rows="10" cols="60" name="content" required="required"><%=dto.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정완료"/>
						<input type="button" value="글 목록" onclick="location.href='hkController.jsp?command=boardlist'"/>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>