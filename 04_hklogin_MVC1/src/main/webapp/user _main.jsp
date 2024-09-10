<%@page import="com.hk.dtos.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div class="main">
			<div class="lead">
				<span><%=ldto.getId() %>[<%=ldto.getRole()%>]님이 로그인하였습니다.</span>
				<span><a href="">나의 정보</a></span>
				<span><a href="userController.jsp?command=logout">로그아웃</a></span>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="footer.jsp" %>