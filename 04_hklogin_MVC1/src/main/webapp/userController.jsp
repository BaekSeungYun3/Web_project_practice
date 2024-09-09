<%@page import="com.hk.dtos.UserDto"%>
<%@page import="com.hk.daos.UserDao"%>
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
	String command = request.getParameter("command");
	
	UserDao dao = UserDao.getUserDao();		//클래스명.메서드():static메서드 호출방법
	
	if(command.equals("registform")){	//회원가입폼 이동
		response.sendRedirect("registform.jsp");
	}else if(command.equals("adduser")){
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		
		boolean isS = dao.insertUser(new UserDto(id,name,password,address,email));
		if(isS){
			%>
			<script type="text/javascript">
				alert("회원가입 완료!");
				location.href = "index.jsp";
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("회원가입 실패");
				location.href = "userController.jsp?command=registform";
			</script>
			<%
		}
	}
%>
</body>
</html>