<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="userController.jsp" method="post">
		<input type="hidden" name="command" value="adduser"/>
		<input type="text" name="id" placeholder="ID" required="required"/>
		<input type="text" name="name" placeholder="이름" required="required"/>
		<input type="password" name="password" placeholder="PASSWORD" required="required"/>
		<input type="password" name="password2" placeholder="PASSWORD 확인" required="required"/>
		<input type="text" name="address" placeholder="주소" required="required"/>
		<input type="email" name="email" placeholder="E-Mail" required="required"/>
		<button type="submit">가입완료</button>
		<button type="button" onclick="location.href='index.jsp'">메인</button>
	</form>
</body>
</html>