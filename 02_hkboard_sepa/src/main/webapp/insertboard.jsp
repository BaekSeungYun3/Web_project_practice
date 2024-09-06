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
		//insertboardForm.jsp에서 전송된 파라미터 받음
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		/* //java코드에서 유효값 처리 가능
		if(id==null || title == null || content == null){
			//글 추가페이지로 돌아감
			
		}else{
			//DB 작업 코드
		} */
		
		HKDao dao = new HKDao();
		boolean isS = dao.insertBoard(new HKDto(id,title,content));
		
		if(isS){
			response.sendRedirect("boardlist.jsp");
		}else{
			%>	
			<script type="text/javascript">
				alert("글 추가 실패");
				location.href="boardlist.jsp";
			</script>
			<% 
		}
	%>
</body>
</html>