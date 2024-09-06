<%@page import="com.hk.board.dtos.UserDto"%>
<%@page import="com.hk.board.daos.UserDao"%>
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
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String birthYear=request.getParameter("birthYear");
		int birthYearInt=Integer.parseInt(birthYear);
		String addr=request.getParameter("addr");
		String mobile1=request.getParameter("mobile1");
		String mobile2=request.getParameter("mobile2");
		String height=request.getParameter("height");
		int heightInt=Integer.parseInt(height);
		
		UserDao dao = new UserDao();
		boolean isS = dao.updateUser(new UserDto(userId,name, birthYearInt,addr,mobile1,mobile2,heightInt));
		
		if(isS){
			%><!-- JAVA 코드에서 나와 JS 사용  -->
			<script type="text/javascript">
				alert("회원정보를 수정했습니다.");
				location.href = "userUpdateForm.jsp?userId=<%=userId%>";
			</script>
			<% 
		}else{
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>