<%@page import="java.net.URLEncoder"%>
<%@page import="com.hk.daos.UserDao"%>
<%@page import="com.hk.dtos.UserDto"%>
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
	String command=request.getParameter("command");
	
	UserDao dao=UserDao.getUserDao();//클래스명.메서드():static메서드호출방법
	
	if(command.equals("registform")){//회원가입폼이동
		response.sendRedirect("registform.jsp");
	}else if(command.equals("adduser")){//회원가입하기
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		
		boolean isS=dao.insertUser(new UserDto(id,name,password,address,email));
		if(isS){
			%>
			<script type="text/javascript">
				alert("회원에 가입이 되셨습니다.");
				location.href="index.jsp";
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("회원 가입 실패");
				location.href="userController.jsp?command=registform";
			</script>
			<%
		}
	}else if(command.equals("idchk")){
		String id=request.getParameter("id");
		String resutlId=dao.idCheck(id);//결과값이 null이면 사용가능
		
		request.setAttribute("resultId", resutlId);
		pageContext.forward("idchkform.jsp");//사용자에게 id가 사용가능한지 알려줄 페이지
	}else if(command.equals("login")){	//로그인 하기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		//Dao객체에 메서드 실행: getLogin(id,password)
		UserDto ldto = dao.getLogin(id, password);
		
		if(ldto == null || ldto.getId() == null){	//회원이 존재하지 않는 경우
			response.sendRedirect("index.jsp?msg=" + URLEncoder.encode("회원가입을 해주세요!","utf-8"));
		}else{
			//회원일 경우
			//sessionScope 객체에 로그인 정보 저장
			session.setAttribute("ldto", ldto);
			session.setMaxInactiveInterval(10*60);	//10분간 요청이 없으면 세션 다운
			
			//등급[Admin, Manager, User]
			if(ldto.getRole().toUpperCase().equals("ADMIN")){
				response.sendRedirect("admin_main.jsp");
			}else if(ldto.getRole().toUpperCase().equals("MANAGER")){
				response.sendRedirect("manager_main.jsp");
			}else if(ldto.getRole().toUpperCase().equals("USER")){
				response.sendRedirect("user _main.jsp");
			}
		}
	}else if(command.equals("logout")){		//로그아웃하기
		
		//로그아웃은 session에서 로그인 정보를 삭제
		//session.removeAttribute("ldto");	//ldto 이름의 객체를 삭제
		session.invalidate();		//session안에 모든 정보 삭제
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>