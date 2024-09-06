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
<body>
<%
	//boardupdateform.jsp에서 파라미터: seq, title, content
	String sseq = request.getParameter("seq");
	int seq = Integer.parseInt(sseq);
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	HKDao dao = new HKDao();
	boolean isS = dao.updateBoard(new HKDto(seq, title, content));
	
	if(isS){
		%>
		<script type="text/javascript">
			alert("글을 수정합니다");
			location.href="boarddetail.jsp?seq=<%=seq%>";
		</script>
		<% 
	}else{
		%>
		<script type="text/javascript">
			alert("글 수정 실패");
			location.herf="boardupdateform.jsp?seq=<%=seq%>";
		</script>
		<% 
	}
%>
</body>
</html>